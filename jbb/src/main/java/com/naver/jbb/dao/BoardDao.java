package com.naver.jbb.dao;

import java.util.List;
import java.util.Map;

import com.naver.jbb.domain.BoardDraftDTO;
import com.naver.jbb.domain.BoardDTO;
import com.naver.jbb.domain.CategoryDTO;
import com.naver.jbb.domain.SearchCondition;

public interface BoardDao {

    //게시글 목록
    List<BoardDTO> selectAll() throws Exception;

    //중분류에 해당하는 게시글 목록
    List<BoardDTO> getPostsByCategory(Integer subCategory, SearchCondition sc) throws Exception;
    //중분류에 해당하는 게시물 개수
    int Subcount(int subCategory) throws Exception;

    //전체 게시물 개수
    int count() throws Exception;

    //게시글 상세보기
    BoardDTO select(int bno) throws Exception;

    //페이징
    List<BoardDTO> selectPage(Map map) throws Exception;

    //게시글 조회수 증가
    int increaseViewCnt(Integer bno) throws Exception;

    //게시물 등록
    int insert(BoardDTO boardDto) throws Exception;

    //게시물 수정
    int update(BoardDTO boardDto) throws Exception;

    //게시물 삭제
    int delete(Integer bno, String writer) throws Exception;

    //전체 게시물 삭제
    int deleteAll();

    //게시물 검색
    List<BoardDTO> searchSelectPage(SearchCondition sc) throws Exception;

    //검색된 게시물 개수
    int searchResultCnt(SearchCondition sc) throws Exception;

    //댓글개수
    int updateCommentCnt(Integer bno, int cnt);

    //최신글 5개
    List<BoardDTO> getLatestPosts() throws Exception;
    //인기글 5개
    List<BoardDTO> getPopularPosts() throws Exception;

    //내가 쓴 글 목록
    List<BoardDTO> myboardlist(String writer, int offset, int size) throws Exception;

    //좋아요 한 글 목록
    List<BoardDTO> mylikeslist(String user_id, int offset, int size) throws Exception;

    //내가 쓴 댓글
    List<BoardDTO> mycommentlist(String commenter, int offset, int size) throws Exception;

    //게시물 임시저장하기
    int insertDraft(BoardDraftDTO boardDraftDto) throws Exception;
    //기존 임시저장 게시물 업데이트
    int updateDraft(BoardDraftDTO boardDraftDto) throws Exception;
    //작성자별 최신 Draft 한 건 조회
    BoardDraftDTO selectDraftByWriter(String writer) throws Exception;
    //Draft 삭제 (최종 게시 후)
    int deleteDraft(Integer draft_id) throws Exception;

    //글쓴이 가져오기
    String findWriterByBno(Integer bno) throws Exception;
}
