package com.naver.jbb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.naver.jbb.domain.FaqDTO;
import com.naver.jbb.domain.SearchCondition;

@Repository
public class FaqDaoImpl implements FaqDao{

    private final SqlSessionTemplate session;
    private static final String namespace="com.naver.jbb.dao.FaqMapper.";

    public FaqDaoImpl(SqlSessionTemplate session){
        this.session = session;
    }

    @Override
    public List<FaqDTO> user_faqlist(SearchCondition sc) throws Exception{
        return session.selectList(namespace+"user-faqlist", sc);
    }
    @Override
    public int faqCnt(SearchCondition sc) throws Exception{
        return session.selectOne(namespace+"faqCnt", sc);
    }
}
