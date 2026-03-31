package com.naver.jbb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.jbb.dao.CategoryDao;
import com.naver.jbb.domain.CategoryDTO;

@Service
public class CategoryServiceImpl implements CategoryService{

    private final CategoryDao categoryDao;
    public CategoryServiceImpl(CategoryDao categoryDao){
        this.categoryDao = categoryDao;
    }

    //모든 카테고리 리스트 불러오기
    @Override
    public List<CategoryDTO> getAllCategories(){
        return categoryDao.getAllCategories();
    }

    //중분류 카테고리 리스트 불러오기
    @Override
    public List<CategoryDTO> getSubCategories(Integer mainCategory){
        return categoryDao.getSubCategories(mainCategory);
    }
}
