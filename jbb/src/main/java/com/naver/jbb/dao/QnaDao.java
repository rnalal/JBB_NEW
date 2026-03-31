package com.naver.jbb.dao;

import java.util.List;

import com.naver.jbb.domain.QnaDTO;
import com.naver.jbb.domain.SearchCondition;

public interface QnaDao {

    //내가 쓴 질문 목록
    List<QnaDTO> selectUserQnaList(String userId, SearchCondition sc) throws Exception;
    //내가 쓴 질문 개수
    int countUserQna(String userId) throws Exception;

    //질문 상세보기 -> 질문&답변 조회
    QnaDTO getQuestionWithAnswer(Integer qno, String userId) throws Exception;

    //질문 작성
    int insertQuestion(QnaDTO qnaDto) throws Exception;

    //질문 삭제
    int delete_question(Integer qno) throws Exception;
}
