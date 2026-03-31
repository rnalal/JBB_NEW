package com.naver.jbb.api;

import java.util.List;

import com.naver.jbb.domain.PageHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naver.jbb.domain.NotifyDTO;
import com.naver.jbb.domain.SearchCondition;
import com.naver.jbb.service.NotifyService;

@Controller
@RequestMapping("/notify")
public class NotifyController {

    private final NotifyService notifyService;

    public NotifyController(NotifyService notifyService) {
        this.notifyService = notifyService;
    }

    //공지사항 목록
    @GetMapping("/list")
    public String list(@ModelAttribute SearchCondition sc, Model m) throws Exception{

        int totalCnt = notifyService.notifyCnt(sc);
        PageHandler ph = new PageHandler(totalCnt, sc);

        List<NotifyDTO> list = notifyService.selectAll(sc);

        m.addAttribute("list", list);
        m.addAttribute("sc", sc);
        m.addAttribute("ph", ph);
        m.addAttribute("totalCnt", totalCnt);

        return "notifyList";
    }
}
