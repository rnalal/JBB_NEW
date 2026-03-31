package com.naver.jbb.service;

import java.util.List;
import java.util.Map;

import com.naver.jbb.domain.BoardDraftDTO;
import com.naver.jbb.domain.BoardDTO;
import com.naver.jbb.domain.CategoryDTO;
import com.naver.jbb.domain.SearchCondition;

public interface BoardService {

    //게시글 목록
    List<BoardDTO> getList() throws Exception;

    //중분류에 해당하는 게시글 목록
    List<BoardDTO> getPostsByCategory(Integer subCategory, SearchCondition sc) throws Exception;
    //중분류에 해당하는 게시물 개수
    int Subcount(int subCategory) throws Exception;

    //전체 게시물 갯수
    int getCount() throws Exception;

    //게시글 상세보기
    BoardDTO read(Integer bno) throws Exception;
    void increaseViewCnt(Integer bno) throws Exception;

    //페이징
    List<BoardDTO> getPage(Map map) throws Exception;

    //게시물 등록
    int write(BoardDTO boardDto) throws Exception;

    //게시물 수정
    int modify(BoardDTO boardDto) throws Exception;

    //게시물 삭제
    int remove(Integer bno, String writer) throws Exception;

    //게시물 검색
    List<BoardDTO> getSearchResultPage(SearchCondition sc) throws Exception;

    //검새된 게시물 개수
    int getSearchResultCnt(SearchCondition sc) throws Exception;

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

    //게시물 임시저장하기 & 업데이트
    void saveDraft(BoardDraftDTO boardDraftDto) throws Exception;
    //작성자별 최신 Draft 한 건 조회
    BoardDraftDTO getDraft(String writer) throws Exception;
    //Draft 삭제 (최종 게시 후)
    int removeDraft(Integer draft_id) throws Exception;
}
