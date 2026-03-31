package com.naver.jbb.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.jbb.domain.BoardDraftDTO;
import com.naver.jbb.domain.BoardDTO;
import com.naver.jbb.domain.SearchCondition;

@Repository
public class BoardDaoImpl implements BoardDao {

    private final SqlSession session;
    private static final String namespace="com.naver.jbb.dao.BoardMapper.";

    public BoardDaoImpl(SqlSession session) {
        this.session = session;
    }

    //게시글 목록
    @Override
    public List<BoardDTO> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    }

    //중분류에 해당하는 게시글 목록
    @Override
    public List<BoardDTO> getPostsByCategory(Integer subCategory, SearchCondition sc) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("subCategory", subCategory);
        params.put("offset", sc.getOffset());
        params.put("pageSize", sc.getPageSize());

        return session.selectList(namespace+"getPostsByCategory", params);
    }

    //중분류에 해당하는 게시물 개수
    @Override
    public int Subcount(int subCategory) throws Exception {
        return session.selectOne(namespace+"Subcount", subCategory);
    }

    //전체 게시물 개수
    public int count() throws Exception {
        return session.selectOne(namespace+"count");
    }

    //게시글 상세보기
    public BoardDTO select(int bno) throws Exception {
        return session.selectOne(namespace+"select", bno);
    }

    //페이징
    @Override
    public List<BoardDTO> selectPage(Map map) throws Exception {
        return session.selectList(namespace+"selectPage", map);
    }

    //게시글 조회수 증가
    @Override
    public int increaseViewCnt(Integer bno) throws Exception {
        return session.update(namespace+"increaseViewCnt", bno);
    }

    //게시물 등록
    public int insert(BoardDTO boardDto) throws Exception {
        return session.insert(namespace+"insert", boardDto);
    }

    //게시물 수정
    @Override
    public int update(BoardDTO boardDto) throws Exception {
        return session.update(namespace+"update", boardDto);
    }

    //게시물 삭제
    @Override
    public int delete(Integer bno, String writer) throws Exception {
        Map map = new HashMap();
        map.put("bno", bno);
        map.put("writer", writer);
        return session.delete(namespace+"delete", map);
    }

    //전체 게시물 삭제
    @Override
    public int deleteAll() {
        return session.delete(namespace+"deleteAll");
    }

    //게시물 검색
    @Override
    public List<BoardDTO> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace+"searchSelectPage", sc);
    }

    //검색된 게시물 개수
    @Override
    public int searchResultCnt(SearchCondition sc) throws Exception {
        return session.selectOne(namespace+"searchResultCnt", sc);
    }

    //댓글개수
    @Override
    public int updateCommentCnt(Integer bno, int cnt) {
        Map map = new HashMap();
        map.put("cnt", cnt);
        map.put("bno", bno);
        return session.update(namespace+"updateCommentCnt", map);
    }

    //최신글 5개
    @Override
    public List<BoardDTO> getLatestPosts() throws Exception{
        return session.selectList(namespace+"getLatestPosts");
    }
    //인기글 5개
    @Override
    public List<BoardDTO> getPopularPosts() throws Exception{
        return session.selectList(namespace+"getPopularPosts");
    }

    //내가 쓴 글 목록
    @Override
    public List<BoardDTO> myboardlist(String writer, int offset ,int size) throws Exception{
        Map<String, Object> params = new HashMap<>();
        params.put("writer", writer);
        params.put("offset", offset);
        params.put("size", size);
        return session.selectList(namespace+"myboardlist", params);
    }

    //좋아요 한 글 목록
    @Override
    public List<BoardDTO> mylikeslist(String user_id, int offset, int size) throws Exception{
        Map<String, Object> params = new HashMap<>();
        params.put("user_id", user_id);
        params.put("offset", offset);
        params.put("size", size);

        return session.selectList(namespace+"mylikeslist", params);
    }

    //내가 쓴 댓글
    @Override
    public List<BoardDTO> mycommentlist(String commenter, int offset, int size) throws Exception{
        Map<String, Object> params = new HashMap<>();
        params.put("commenter", commenter);
        params.put("offset", offset);
        params.put("size", size);

        return session.selectList(namespace+"mycommentlist", params);
    }

    //게시물 임시저장하기
    @Override
    public int insertDraft(BoardDraftDTO boardDraftDto) throws Exception{
        return session.insert(namespace+"insertDraft", boardDraftDto);
    }
    //기존 임시저장 게시물 업데이트
    @Override
    public int updateDraft(BoardDraftDTO boardDraftDto) throws Exception{
        return session.update(namespace+"updateDraft", boardDraftDto);
    }
    //작성자별 최신 Draft 한 건 조회
    @Override
    public BoardDraftDTO selectDraftByWriter(String writer) throws Exception{
        return session.selectOne(namespace+"selectDraftByWriter", writer);
    }
    //Draft 삭제 (최종 게시 후)
    @Override
    public int deleteDraft(Integer draft_id) throws Exception{
        return session.delete(namespace+"deleteDraft", draft_id);
    }

    //글쓴이 가져오기
    @Override
    public String findWriterByBno(Integer bno) throws Exception{
        return session.selectOne(namespace+"findWriterByBno", bno);
    }
}
