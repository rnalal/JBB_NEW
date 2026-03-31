package com.naver.jbb.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.naver.jbb.dao.BoardDao;
import com.naver.jbb.dao.CommentDao;
import com.naver.jbb.domain.BoardDraftDTO;
import com.naver.jbb.domain.BoardDTO;
import com.naver.jbb.domain.SearchCondition;

@Service
public class BoardServiceImpl implements BoardService {

    private final BoardDao boardDao;
    private final CommentDao commentDao;

    public BoardServiceImpl(BoardDao boardDao, CommentDao commentDao){
        this.boardDao = boardDao;
        this.commentDao = commentDao;
    }

    //게시글 목록
    @Override
    public List<BoardDTO> getList() throws Exception {
        return boardDao.selectAll();
    }

    //중분류에 해당하는 게시글 목록
    @Override
    public List<BoardDTO> getPostsByCategory(Integer subCategory, SearchCondition sc) throws Exception{
        return boardDao.getPostsByCategory(subCategory, sc);
    }

    //중분류에 해당하는 게시물 개수
    @Override
    public int Subcount(int subCategory) throws Exception{
        return boardDao.Subcount(subCategory);
    }

    //전체 게시물 갯수
    @Override
    public int getCount() throws Exception {
        return boardDao.count();
    }

    //게시글 상세보기
    @Override
    public BoardDTO read(Integer bno) throws Exception {
        return boardDao.select(bno);
    }
    @Override
    public void increaseViewCnt(Integer bno) throws Exception{
        boardDao.increaseViewCnt(bno);
    }

    //페이징
    @Override
    public List<BoardDTO> getPage(Map map) throws Exception {
        return boardDao.selectPage(map);
    }

    //게시물 등록
    @Override
    public int write(BoardDTO boardDto) throws Exception {
        return boardDao.insert(boardDto);
    }

    //게시물 수정
    @Override
    public int modify(BoardDTO boardDto) throws Exception {
        return boardDao.update(boardDto);
    }

    //게시물 삭제
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer bno, String writer) throws Exception {
        int rowCnt = commentDao.deleteAll(bno);
        rowCnt = boardDao.delete(bno, writer);

        return rowCnt;
    }

    //게시물 검색
    @Override
    public List<BoardDTO> getSearchResultPage(SearchCondition sc) throws Exception {
        return boardDao.searchSelectPage(sc);
    }

    //검색된 게시물 개수
    @Override
    public int getSearchResultCnt(SearchCondition sc) throws Exception {
        return boardDao.searchResultCnt(sc);
    }

    //최신글 5개
    @Override
    public List<BoardDTO> getLatestPosts() throws Exception{
        return boardDao.getLatestPosts();
    }
    //인기글 5개
    @Override
    public List<BoardDTO> getPopularPosts() throws Exception{
        return boardDao.getPopularPosts();
    }

    //내가 쓴 글 목록
    @Override
    public List<BoardDTO> myboardlist(String writer, int offset, int size) throws Exception{
        return boardDao.myboardlist(writer, offset, size);
    }

    //좋아요 한 글 목록
    @Override
    public List<BoardDTO> mylikeslist(String user_id, int offset, int size) throws Exception{
        return boardDao.mylikeslist(user_id, offset, size);
    }

    //내가 쓴 댓글
    @Override
    public List<BoardDTO> mycommentlist(String commenter, int offset, int size) throws Exception{
        return boardDao.mycommentlist(commenter, offset, size);
    }

    //게시물 임시저장하기 & 업데이트
    @Override
    public void saveDraft(BoardDraftDTO boardDraftDTO) throws Exception{
        if(boardDraftDTO.getDraft_id()==null) {
            boardDao.insertDraft(boardDraftDTO);
        } else {
            boardDao.updateDraft(boardDraftDTO);
        }
    }
    //작성자별 최신 Draft 한 건 조회
    @Override
    public BoardDraftDTO getDraft(String writer) throws Exception{
        return boardDao.selectDraftByWriter(writer);
    }
    //Draft 삭제 (최종 게시 후)
    @Override
    public int removeDraft(Integer draft_id) throws Exception{
        return boardDao.deleteDraft(draft_id);
    }
}
