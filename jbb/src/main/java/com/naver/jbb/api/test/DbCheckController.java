package com.naver.jbb.api.test;

import com.naver.jbb.db.DbCheckMapper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DbCheckController {

    private final DbCheckMapper mapper;

    public DbCheckController(DbCheckMapper mapper){
        this.mapper = mapper;
    }

    @GetMapping("/db-check")
    public int dbCheck(){
        return mapper.selectOne();
    }
}
