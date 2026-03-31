package com.naver.jbb.interceptor;

import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.stereotype.Component;

@Component
public class AdminInterceptor implements HandlerInterceptor{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");

        if(session.getAttribute("id") == null || !id.equals("admin")) {
            PrintWriter out = response.getWriter();
            response.setCharacterEncoding("utf-8");
            response.setContentType("text/html; charset=utf-8");
            out.println("<script>alert('관리자만 접근가능한 페이지입니다.'); ");
            out.println("self.location='"+request.getContextPath() +"/adminlogin'; </script>");
            out.close();
            return false;
        }
        return true;
    }
}

