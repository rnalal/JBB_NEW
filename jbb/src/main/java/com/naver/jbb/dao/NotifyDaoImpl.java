package com.naver.jbb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.jbb.domain.NotifyDTO;
import com.naver.jbb.domain.SearchCondition;

@Repository
public class NotifyDaoImpl implements NotifyDao{

    private final SqlSession session;
    private static final String namespace="com.naver.jbb.dao.NotifyMapper.";

    public NotifyDaoImpl(SqlSession session){
        this.session = session;
    }

    //공지사항 목록
    @Override
    public List<NotifyDTO> selectAll(SearchCondition sc) throws Exception{
        return session.selectList(namespace+"notify_list", sc);
    }

    //공지사항 개수
    @Override
    public int notifyCnt(SearchCondition sc) throws Exception{
        return session.selectOne(namespace+"notifyCnt", sc);
    }

    //공지사항 상세보기
    @Override
    public NotifyDTO detail(Integer nno) throws Exception{
        return session.selectOne(namespace+"notify_detail", nno);
    }

    //공지사항 등록
    @Override
    public int insert(NotifyDTO notifyDto) throws Exception{
        return session.insert(namespace+"insert",notifyDto);
    }

    //공지사항 수정
    @Override
    public int update(NotifyDTO notifyDto) throws Exception{
        return session.update(namespace+"update", notifyDto);
    }

    //공지사항 삭제
    @Override
    public int delete(Integer nno) throws Exception{
        return session.delete(namespace+"delete", nno);
    }
}
