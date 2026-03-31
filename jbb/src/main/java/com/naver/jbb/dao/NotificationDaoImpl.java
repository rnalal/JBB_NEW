package com.naver.jbb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.jbb.domain.NotificationDTO;

@Repository
public class NotificationDaoImpl implements NotificationDao{

    private final SqlSession session;
    private static final String namespace = "com.naver.jbb.dao.NotificationMapper.";

    public NotificationDaoImpl(SqlSession session){
        this.session = session;
    }

    //알림 저장
    @Override
    public int insert(NotificationDTO n) throws Exception{
        return session.insert(namespace+"insert", n);
    }

    //사용자별 전체 알림 조회
    @Override
    public List<NotificationDTO> selectAll(String recipient) throws Exception{
        return session.selectList(namespace+"selectAll", recipient);
    }

    //읽지 않은 개수
    @Override
    public int countUnread(String recipient) throws Exception{
        return session.selectOne(namespace+"countUnread", recipient);
    }

    //모두 읽음 처리
    @Override
    public int markAllRead(String recipient) throws Exception{
        return session.update(namespace+"markAllRead", recipient);
    }

}
