package com.naver.jbb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.naver.jbb.dao.NotificationDao;
import com.naver.jbb.domain.NotificationDTO;

@Service
public class NotificationServiceImpl implements NotificationService {

    private final SimpMessagingTemplate template;
    private final NotificationDao notificationDao;
    public NotificationServiceImpl(SimpMessagingTemplate template, NotificationDao notificationDao){
        this.template = template;
        this.notificationDao = notificationDao;
    }

    // userId(글 작성자)에게 1:1 알림 보내기
    @Override
    @Transactional
    public void sendToUser(String userId, NotificationDTO noti) throws Exception {
        //1)DB에 저장
        noti.setRecipient(userId);
        notificationDao.insert(noti);

        //구독 경로: /user/{userId}/queue/notifications
        template.convertAndSendToUser(
                userId,
                "/queue/notifications",
                noti
        );
    }

    @Override
    public List<NotificationDTO> getAll(String userId) throws Exception {
        return notificationDao.selectAll(userId);
    }
    @Override
    public int getUnreadCount(String userId) throws Exception {
        return notificationDao.countUnread(userId);
    }
    @Override
    public int markAllRead(String userId) throws Exception{
        return notificationDao.markAllRead(userId);
    }
}
