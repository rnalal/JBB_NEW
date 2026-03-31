package com.naver.jbb.service;

import jakarta.servlet.http.HttpSession;

import com.naver.jbb.domain.LikesDTO;

public interface LikesService {

    //좋아요 추가 & 삭제 (토글)
    boolean toggleLike(LikesDTO likesDto) throws Exception;

    //좋아요 개수
    int getLikeCount(int board_bno) throws Exception;

    //좋아요 여부 확인
    boolean isUserLikedPost(int board_bno, HttpSession session) throws Exception;
}
