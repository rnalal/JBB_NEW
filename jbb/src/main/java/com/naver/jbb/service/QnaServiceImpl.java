package com.naver.jbb.service;

import java.util.List;

import com.naver.jbb.domain.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.jbb.dao.QnaDao;
import com.naver.jbb.domain.QnaDTO;

@Service
public class QnaServiceImpl implements QnaService{

    private final QnaDao qnaDao;
    public QnaServiceImpl(QnaDao qnaDao){
        this.qnaDao = qnaDao;
    }

    //내가 쓴 질문 목록
    @Override
    public List<QnaDTO> selectUserQnaList(String userId, SearchCondition sc) throws Exception{
        return qnaDao.selectUserQnaList(userId, sc);
    }
    //내가 쓴 질문 개수
    public int countUserQna(String userId) throws Exception {
        return qnaDao.countUserQna(userId);
    }

    //질문 상세보기 -> 질문&답변 조회
    @Override
    public QnaDTO getQuestionWithAnswer(Integer qno, String userId) throws Exception{
        return qnaDao.getQuestionWithAnswer(qno, userId);
    }

    //질문 작성
    @Override
    public int insertQuestion(QnaDTO qnaDto) throws Exception{
        return qnaDao.insertQuestion(qnaDto);
    }

    //질문 삭제
    @Override
    public int delete_question(Integer qno) throws Exception{
        return qnaDao.delete_question(qno);
    }
}
