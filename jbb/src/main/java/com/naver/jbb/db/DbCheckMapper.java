package com.naver.jbb.db;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface DbCheckMapper {

    @Select("select 1")
    int selectOne();

}
