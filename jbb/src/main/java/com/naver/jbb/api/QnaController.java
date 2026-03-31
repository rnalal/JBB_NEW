package com.naver.jbb.api;

import java.util.List;

import com.naver.jbb.domain.PageHandler;
import com.naver.jbb.domain.SearchCondition;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.jbb.domain.QnaDTO;
import com.naver.jbb.service.QnaService;

@Controller
@RequestMapping("/qna")
public class QnaController {

    private final QnaService qnaService;
    public QnaController(QnaService qnaService){
        this.qnaService = qnaService;
    }

    //내가 쓴 질문 목록 조회
    @GetMapping("/list")
    public String list(@ModelAttribute SearchCondition sc, Model m, HttpSession session) throws Exception{

        String userId = (String)session.getAttribute("id");

        int totalCnt = qnaService.countUserQna(userId);
        PageHandler ph = new PageHandler(totalCnt, sc);

        List<QnaDTO> list = qnaService.selectUserQnaList(userId, sc);

        m.addAttribute("list", list);
        m.addAttribute("ph", ph);
        m.addAttribute("sc", sc);
        m.addAttribute("totalCnt", totalCnt);

        return "qnaList";
    }

    //질문 상세보기 -> 질문&답변 조회
    @GetMapping("/detail")
    public String detail(Integer qno, HttpSession session, Model m) {

        String userId = (String)session.getAttribute("id");

        try {
            QnaDTO qnaDetail = qnaService.getQuestionWithAnswer(qno, userId);
            m.addAttribute("qnaDetail",qnaDetail);
            m.addAttribute("loggedInUser", userId); //현재 로그인한 사용자 ID 추가
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "qnaDetail";
    }

    //질문 작성
    @GetMapping("/qwrite")
    public String qwrite(QnaDTO qnaDto, Model m) {
        m.addAttribute(qnaDto);
        return "questionWrite";
    }
    @PostMapping("/qwrite")
    public String qwrite(QnaDTO qnaDTO, Model m, HttpSession session, RedirectAttributes rattr) {
        String writer = (String)session.getAttribute("id");
        qnaDTO.setWriter(writer);
        int rowCnt;
        try {
            rowCnt = qnaService.insertQuestion(qnaDTO);
            m.addAttribute(qnaDTO);

            if(rowCnt != 1)
                throw new Exception("write failed");

            rattr.addFlashAttribute("msg", "QWRT_OK");

            return "redirect:/qna/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(qnaDTO);
            m.addAttribute("msg", "QWRT_ERR");
            return "questionWrite";
        }
    }

    //질문 삭제
    @PostMapping("/delete")
    public String delete(Integer qno, Model m, HttpSession session, RedirectAttributes rattr) {

        try {
            int rowCnt = qnaService.delete_question(qno);

            if(rowCnt!=1)
                throw new Exception("qna remove error");

            rattr.addFlashAttribute("msg", "DEL_OK");
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "DEL_ERR");
        }
        return "redirect:/qna/list";
    }
}
