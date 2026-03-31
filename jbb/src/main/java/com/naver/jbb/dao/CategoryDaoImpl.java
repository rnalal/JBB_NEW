package com.naver.jbb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.jbb.domain.CategoryDTO;

@Repository
public class CategoryDaoImpl implements CategoryDao{

    private final SqlSession session;
    private static final String namespace="com.naver.jbb.dao.CategoryMapper.";

    public CategoryDaoImpl(SqlSession session){
        this.session = session;
    }

    //모든 카테고리 리스트 불러오기
    @Override
    public List<CategoryDTO> getAllCategories(){
        return session.selectList(namespace+"getAllCategories");
    }

    //중분류 카테고리 리스트 불러오기
    @Override
    public List<CategoryDTO> getSubCategories(Integer mainCategory){
        return session.selectList(namespace+"getSubCategories", mainCategory);
    }
}
