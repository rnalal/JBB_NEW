package com.naver.jbb.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.naver.jbb.domain.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.jbb.domain.QnaDTO;

@Repository
public class QnaDaoImpl implements QnaDao{

    private final SqlSession session;
    private static final String namespace="com.naver.jbb.dao.QnaMapper.";
    public QnaDaoImpl(SqlSession session){
        this.session = session;
    }

    //내가 쓴 질문 목록
    @Override
    public List<QnaDTO> selectUserQnaList(String userId, SearchCondition sc) throws Exception{
        Map<String, Object> param = new HashMap<>();
        param.put("userId", userId);
        param.put("offset", sc.getOffset());
        param.put("pageSize", sc.getPageSize());

        return session.selectList(namespace+"selectUserQnaList", param);
    }
    //내가 쓴 질문 개수
    @Override
    public int countUserQna(String userId) throws Exception {
        return session.selectOne(namespace+"countUserQna", userId);
    }

    //질문 상세보기 -> 질문&답변 조회
    @Override
    public QnaDTO getQuestionWithAnswer(Integer qno, String userId) throws Exception {
        Map map = new HashMap();
        map.put("qno", qno);
        map.put("userId", userId);
        return session.selectOne(namespace+"getQuestionWithAnswer", map);
    }

    //질문 작성
    @Override
    public int insertQuestion(QnaDTO qnaDto) throws Exception{
        return session.insert(namespace+"insertQuestion", qnaDto);
    }

    //질문 삭제
    @Override
    public int delete_question(Integer qno) throws Exception{
        return session.delete(namespace+"delete_question", qno);
    }

}
