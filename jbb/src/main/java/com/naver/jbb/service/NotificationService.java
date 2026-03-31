package com.naver.jbb.service;

import java.util.List;

import com.naver.jbb.domain.NotificationDTO;

public interface NotificationService {

    void sendToUser(String userId, NotificationDTO noti) throws Exception;
    List<NotificationDTO> getAll(String userId) throws Exception;
    int getUnreadCount(String userId) throws Exception;
    int markAllRead(String userId) throws Exception;
}
