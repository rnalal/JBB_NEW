package com.naver.jbb.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.naver.jbb.dao.AdminDao;
import com.naver.jbb.domain.BoardDTO;
import com.naver.jbb.domain.FaqDTO;
import com.naver.jbb.domain.NotifyDTO;
import com.naver.jbb.domain.QnaDTO;
import com.naver.jbb.domain.SearchCondition;
import com.naver.jbb.domain.UserActivityDTO;
import com.naver.jbb.domain.UserDTO;

@Service
public class AdminServiceImpl implements AdminService{

    private final AdminDao adminDao;
    public AdminServiceImpl(AdminDao adminDao){
        this.adminDao = adminDao;
    }

    // 사용자 목록 조회
    @Override
    public List<UserDTO> getUserListPaging(SearchCondition sc) throws Exception{
        return adminDao.getUserListPaging(sc);
    }
    @Override
    public int getTotalUserCount(SearchCondition sc) throws Exception{
        return adminDao.getTotalUserCount(sc);
    }
    //사용자목록-작성한 게시글 목록
    @Override
    public List<BoardDTO> userboard(SearchCondition sc) throws Exception{
        return adminDao.userboard(sc);
    }
    @Override
    public int getuserboardCount(SearchCondition sc) throws Exception{
        return adminDao.getuserboardCount(sc);
    }
    //사용자 상세조회
    @Override
    public UserDTO userdetail(String id) throws Exception{
        return adminDao.userdetail(id);
    }
    //사용자 삭제
    @Override
    public int userdelete(String id) throws Exception{
        return adminDao.userdelete(id);
    }
    //사용자 추가
    @Override
    public int userinsert(UserDTO userDto) throws Exception{
        return adminDao.userinsert(userDto);
    }
    @Override
    public int checkuserId(String id) throws Exception{
        int result = 0;

        result = adminDao.checkuserId(id);
        return result;
    }

    //문의 목록 조회
    @Override
    public List<QnaDTO> qnalist(SearchCondition sc) throws Exception{
        return adminDao.qnalist(sc);
    }
    @Override
    public int qnaCount(SearchCondition sc) throws Exception{
        return adminDao.qnaCount(sc);
    }
    //문의 상세보기
    @Override
    public QnaDTO qnadetail(Integer qno) throws Exception{
        return adminDao.qnadetail(qno);
    }
    //답변작성
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void insertAnswer(QnaDTO qnaDto) throws Exception{
        int result = adminDao.insertAnswer(qnaDto);
        if (result != 1) throw new Exception("답변 등록 실패");

        adminDao.is_answered_update(qnaDto.getParent_id());
    }
    //문의 삭제
    @Override
    public int qnadelete(Integer qno) throws Exception{
        return adminDao.qnadelete(qno);
    }
    //답변 삭제
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void answerdelete(Integer parent_id, Integer qno) throws Exception{
        adminDao.answerdelete(parent_id);
        adminDao.answerdelete_update(qno);
    }

    //공지사항 목록
    @Override
    public List<NotifyDTO> admin_notify_list(SearchCondition sc) throws Exception{
        return adminDao.admin_notify_list(sc);
    }

    //FAQ 작성
    @Override
    public int faqInsert(FaqDTO faqDto) throws Exception{
        return adminDao.faqInsert(faqDto);
    }
    //FAQ 목록
    @Override
    public List<FaqDTO> faqAll(SearchCondition sc) throws Exception{
        return adminDao.faqAll(sc);
    }
    //FAQ 개수
    @Override
    public int faqCnt(SearchCondition sc) throws Exception{
        return adminDao.faqCnt(sc);
    }
    //FAQ 상세보기
    @Override
    public FaqDTO faqdetail(Integer fno) throws Exception{
        return adminDao.faqdetail(fno);
    }
    //FAQ 수정
    @Override
    public int faqUpdate(FaqDTO faqDto) throws Exception{
        return adminDao.faqUpdate(faqDto);
    }
    //FAQ 삭제
    @Override
    public int faqDelete(Integer fno) throws Exception{
        return adminDao.faqDelete(fno);
    }

    //게시판 목록
    @Override
    public List<BoardDTO> admin_boardlist(SearchCondition sc) throws Exception{
        return adminDao.admin_boardlist(sc);
    }
    @Override
    public int boardCnt(SearchCondition sc) throws Exception{
        return adminDao.boardCnt(sc);
    }
    //게시물 상세보기
    @Override
    public BoardDTO admin_boarddetail(Integer bno) throws Exception{
        return adminDao.admin_boarddetail(bno);
    }
    //게시물 삭제
    @Override
    public int admin_boardremove(Integer bno) throws Exception{
        return adminDao.admin_boardremove(bno);
    }

    //인사이트 분석
    //일,주,월별 신규 가입자 수
    @Override
    public List<Map<String, Object>> getDailyNewUsers() throws Exception{
        return adminDao.getDailyNewUsers();
    }
    @Override
    public List<Map<String, Object>> getWeeklyNewUsers() throws Exception{
        return adminDao.getWeeklyNewUsers();
    }
    @Override
    public List<Map<String, Object>> getMonthlyNewUsers() throws Exception{
        return adminDao.getMonthlyNewUsers();
    }
    //사용자 활동 빈도
    @Override
    public List<UserActivityDTO> getAllUserActivity(SearchCondition sc) throws Exception{
        return adminDao.getAllUserActivity(sc);
    }
    @Override
    public int userActivityCnt(SearchCondition sc) throws Exception{
        return adminDao.userActivityCnt(sc);
    }
    //카테고리 게시글 수
    @Override
    public List<Map<String, Object>> BoardCategoryCnt() throws Exception{
        return adminDao.BoardCategoryCnt();
    }
    @Override
    public List<BoardDTO> BoardCategoryDetail(SearchCondition sc) throws Exception{
        return adminDao.BoardCategoryDetail(sc);
    }
    @Override
    public int BoardCategoryDetailCnt(SearchCondition sc) throws Exception{
        return adminDao.BoardCategoryDetailCnt(sc);
    }
    //일별 게시글 작성 수
    @Override
    public List<BoardDTO> getDailyPostCount(SearchCondition sc) throws Exception{
        return adminDao.getDailyPostCount(sc);
    }
    @Override
    public int getDailyPostCountTotal(SearchCondition sc) throws Exception{
        return adminDao.getDailyPostCountTotal(sc);
    }
    //일자별 상세페이지
    @Override
    public List<BoardDTO> getPostsByDate(SearchCondition sc) throws Exception{
        return adminDao.getPostsByDate(sc);
    }
    @Override
    public int countPostsByDate(SearchCondition sc) throws Exception{
        return adminDao.countPostsByDate(sc);
    }
}
