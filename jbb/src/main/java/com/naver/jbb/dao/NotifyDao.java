package com.naver.jbb.dao;

import java.util.List;

import com.naver.jbb.domain.NotifyDTO;
import com.naver.jbb.domain.SearchCondition;

public interface NotifyDao {

    //공지사항 목록
    List<NotifyDTO> selectAll(SearchCondition sc) throws Exception;

    //공지사항 개수
    int notifyCnt(SearchCondition sc) throws Exception;

    //공지사항 상세보기
    NotifyDTO detail(Integer nno) throws Exception;

    //공지사항 등록
    int insert(NotifyDTO notifyDto) throws Exception;

    //공지사항 수정
    int update(NotifyDTO notifyDto) throws Exception;

    //공지사항 삭제
    int delete(Integer nno) throws Exception;
}
