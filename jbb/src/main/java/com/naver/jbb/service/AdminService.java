package com.naver.jbb.service;

import java.util.List;
import java.util.Map;

import com.naver.jbb.domain.BoardDTO;
import com.naver.jbb.domain.FaqDTO;
import com.naver.jbb.domain.NotifyDTO;
import com.naver.jbb.domain.QnaDTO;
import com.naver.jbb.domain.SearchCondition;
import com.naver.jbb.domain.UserActivityDTO;
import com.naver.jbb.domain.UserDTO;

public interface AdminService {

    //사용자 목록 조회
    List<UserDTO> getUserListPaging(SearchCondition sc) throws Exception;
    int getTotalUserCount(SearchCondition sc) throws Exception;
    //사용자목록-작성한 게시글 목록
    List<BoardDTO> userboard(SearchCondition sc) throws Exception;
    int  getuserboardCount(SearchCondition sc) throws Exception;
    //사용자 상세조회
    UserDTO userdetail(String id) throws Exception;
    //사용자 삭제
    int userdelete(String id) throws Exception;
    //사용자 추가
    int userinsert(UserDTO userDto) throws Exception;
    int checkuserId(String id) throws Exception;

    //문의 목록 조회
    List<QnaDTO> qnalist(SearchCondition sc) throws Exception;
    int qnaCount(SearchCondition sc) throws Exception;
    //문의 상세보기
    QnaDTO qnadetail(Integer qno) throws Exception;
    //답변 작성
    void insertAnswer(QnaDTO qnaDto) throws Exception;
    //문의 삭제
    int qnadelete(Integer qno) throws Exception;
    //답변 삭제
    void answerdelete(Integer parent_id, Integer qno) throws Exception;

    //공지사항 목록
    List<NotifyDTO> admin_notify_list(SearchCondition sc) throws Exception;

    //FAQ 작성
    int faqInsert(FaqDTO faqDto) throws Exception;
    //FAQ 목록
    List<FaqDTO> faqAll(SearchCondition sc) throws Exception;
    //FAQ 개수
    int faqCnt(SearchCondition sc) throws Exception;
    //FAQ 상세보기
    FaqDTO faqdetail(Integer fno) throws Exception;
    //FAQ 수정
    int faqUpdate(FaqDTO faqDto) throws Exception;
    //FAQ 삭제
    int faqDelete(Integer fno) throws Exception;

    //게시판 목록
    List<BoardDTO> admin_boardlist(SearchCondition sc) throws Exception;
    int boardCnt(SearchCondition sc) throws Exception;
    //게시물 상세보기
    BoardDTO admin_boarddetail(Integer bno) throws Exception;
    //게시물 삭제
    int admin_boardremove(Integer bno) throws Exception;

    //인사이트 분석
    //일,주,월별 신규 가입자 수
    List<Map<String, Object>> getDailyNewUsers() throws Exception;
    List<Map<String, Object>> getWeeklyNewUsers() throws Exception;
    List<Map<String, Object>> getMonthlyNewUsers() throws Exception;
    //사용자 활동 빈도
    List<UserActivityDTO> getAllUserActivity(SearchCondition sc) throws Exception;
    int userActivityCnt(SearchCondition sc) throws Exception;
    //카테고리 게시글 수
    List<Map<String, Object>> BoardCategoryCnt() throws Exception;
    List<BoardDTO> BoardCategoryDetail(SearchCondition sc) throws Exception;
    int BoardCategoryDetailCnt(SearchCondition sc) throws Exception;
    //일별 게시글 작성 수
    List<BoardDTO> getDailyPostCount(SearchCondition sc) throws Exception;
    int getDailyPostCountTotal(SearchCondition sc) throws Exception;
    //일자별 상세페이지
    List<BoardDTO> getPostsByDate(SearchCondition sc) throws Exception;
    int countPostsByDate(SearchCondition sc) throws Exception;
}
