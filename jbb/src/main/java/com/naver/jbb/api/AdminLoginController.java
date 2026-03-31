package com.naver.jbb.api;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.jbb.domain.UserDTO;
import com.naver.jbb.service.AdminService;
import com.naver.jbb.service.UserService;

@Controller
public class AdminLoginController {

    private final AdminService adminService;
    private final UserService userService;
    public AdminLoginController(AdminService adminService, UserService userService){
        this.adminService = adminService;
        this.userService = userService;
    }

    //관리자 로그인
    @GetMapping("/adminlogin")
    public String login() {
        return "admin_login";
    }
    @PostMapping("/adminlogin")
    public String login(String id, String pwd, String toURL,
                        HttpServletRequest request, HttpServletResponse response, RedirectAttributes rattr) throws Exception {

        if(!loginCheck(id, pwd)) {
            rattr.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀립니다.");
            return "redirect:/adminlogin";
        }

        HttpSession session = request.getSession();
        session.setAttribute("id", id);

        //세션 타이머 추가
        session.setAttribute("loginTime", System.currentTimeMillis());

        //로그인 횟수 증가
        userService.incrementLoginCount(id);
        return "redirect:/admin/userlist";
    }
    private boolean loginCheck(String id, String pwd) {
        UserDTO userdto = null;

        try {
            userdto = userService.login(id);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return userdto!=null && userdto.getPwd().equals(pwd);
    }

    //관리자 로그아웃
    @GetMapping("/adminlogout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "admin_login";
    }
}
