package com.naver.jbb.api;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.naver.jbb.domain.NotificationDTO;
import com.naver.jbb.service.NotificationService;

@Controller
@RequestMapping("/notifications")
public class NotificationController {

    private final NotificationService notificationService;

    public NotificationController(NotificationService notificationService){
        this.notificationService = notificationService;
    }

    //알림 목록 페이지
    @GetMapping
    public String list(Model m, HttpSession session) throws Exception {
        String userId = (String)session.getAttribute("id");
        List<NotificationDTO> list = notificationService.getAll(userId);
        m.addAttribute("notifications", list);
        return "notifications";
    }

    //읽지 않은 개수(AJAX)
    @ResponseBody
    @GetMapping("/unreadCount")
    public Map<String, Integer> unreadCount(HttpSession session) throws Exception{
        String userId = (String)session.getAttribute("id");
        int cnt = notificationService.getUnreadCount(userId);
        return Collections.singletonMap("count", cnt);
    }

    //모두 읽음 처리 (AJAX or form POST)
    @ResponseBody
    @PostMapping("/markAllRead")
    public void markAllRead(HttpSession session) throws Exception {
        String userId = (String)session.getAttribute("id");
        notificationService.markAllRead(userId);
    }
}
