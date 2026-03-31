package com.naver.jbb.api;

import java.util.List;

import com.naver.jbb.domain.PageHandler;
import jakarta.annotation.PostConstruct;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

import com.naver.jbb.domain.FaqDTO;
import com.naver.jbb.domain.SearchCondition;
import com.naver.jbb.service.FaqService;

@Controller
@RequestMapping("/faq")
public class FaqController {

    private final FaqService faqService;

    public FaqController(FaqService faqService) {
        this.faqService = faqService;
    }

    @GetMapping("/user_faqlist")
    public String user_faqlist(@ModelAttribute SearchCondition sc, Model m) {

        try {
            int totalCnt = faqService.faqCnt(sc);
            PageHandler ph = new PageHandler(totalCnt, sc);

            List<FaqDTO> list = faqService.user_faqlist(sc);

            m.addAttribute("list", list);
            m.addAttribute("sc", sc);
            m.addAttribute("ph", ph);
            m.addAttribute("totalCnt", totalCnt);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user_faqlist";
    }
}
