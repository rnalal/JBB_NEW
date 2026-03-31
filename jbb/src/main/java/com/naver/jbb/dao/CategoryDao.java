package com.naver.jbb.dao;

import java.util.List;

import com.naver.jbb.domain.CategoryDTO;

public interface CategoryDao {

    //모든 카테고리 리스트 불러오기
    List<CategoryDTO> getAllCategories();

    //중분류 카테고리 리스트 불러오기
    List<CategoryDTO> getSubCategories(Integer mainCategory);
}
