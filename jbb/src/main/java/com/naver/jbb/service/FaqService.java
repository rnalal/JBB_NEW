package com.naver.jbb.service;

import java.util.List;

import com.naver.jbb.domain.FaqDTO;
import com.naver.jbb.domain.SearchCondition;

public interface FaqService {

    List<FaqDTO> user_faqlist(SearchCondition sc) throws Exception;
    int faqCnt(SearchCondition sc) throws Exception;
}
