package com.naver.jbb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.jbb.dao.FaqDao;
import com.naver.jbb.domain.FaqDTO;
import com.naver.jbb.domain.SearchCondition;

@Service
public class FaqServiceImpl implements FaqService{

    private final FaqDao faqDao;
    public FaqServiceImpl(FaqDao faqDao){
        this.faqDao = faqDao;
    }

    @Override
    public List<FaqDTO> user_faqlist(SearchCondition sc) throws Exception{
        return faqDao.user_faqlist(sc);
    }
    @Override
    public int faqCnt(SearchCondition sc) throws Exception{
        return faqDao.faqCnt(sc);
    }
}
