package com.naver.jbb.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.naver.jbb.domain.LikesDTO;

@Repository
public class LikesDaoImpl implements LikesDao{

    private final SqlSession session;
    private static final String namespace="com.naver.jbb.dao.LikesMapper.";

    public LikesDaoImpl(SqlSession session){
        this.session = session;
    }

    //좋아요 추가
    @Override
    public int addLike(LikesDTO likesDto) throws Exception{
        return session.insert(namespace+"addLike", likesDto);
    }

    //좋아요 삭제
    @Override
    public int removeLike(LikesDTO likesDto) throws Exception {
        return session.delete(namespace+"removeLike", likesDto);
    }

    //좋아요 개수
    @Override
    public int getLikeCount(int board_bno) throws Exception {
        return session.selectOne(namespace+"getLikeCount",board_bno);
    }

    //사용자가 해당 게시물에 좋아요 눌렀는지 확인
    @Override
    public int isLikeByUser(LikesDTO likesDto) throws Exception {
        return session.selectOne(namespace+"isLikeByUser", likesDto);
    }

}
