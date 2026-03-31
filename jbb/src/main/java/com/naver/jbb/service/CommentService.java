package com.naver.jbb.service;

import java.util.List;

import com.naver.jbb.domain.CommentDTO;

public interface CommentService {

    //댓글 개수
    int getCount(Integer bno) throws Exception;

    //댓글 삭제
    int remove(Integer cno, Integer bno, String commenter) throws Exception;

    //댓글 등록
    int write(CommentDTO commentDto) throws Exception;

    //댓글 목록
    List<CommentDTO> getList(Integer bno) throws Exception;

    //댓글 상세보기
    CommentDTO read(Integer cno) throws Exception;

    //댓글 수정
    int modify(CommentDTO commentDto) throws Exception;
}
