package com.naver.jbb.service;

import com.naver.jbb.domain.UserDTO;

public interface UserService {

    //회원가입
    int join(UserDTO userdto) throws Exception;

    //회원가입 - 아이디 중복체크
    int checkId(String id) throws Exception;

    //로그인
    UserDTO login(String id) throws Exception;
    //로그인횟수증가
    int incrementLoginCount(String id) throws Exception;

    //아이디 찾기
    public UserDTO findUserId(UserDTO userdto) throws Exception;

    //마이페이지
    UserDTO mypage(String id) throws Exception;

    //회원정보 수정
    int update(UserDTO userdto) throws Exception;

    //탈퇴
    int delete(String id) throws Exception;

}
