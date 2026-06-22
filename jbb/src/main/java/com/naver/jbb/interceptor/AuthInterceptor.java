package com.naver.jbb.interceptor;

import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.stereotype.Component;

@Component
public class AuthInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession(false);

        String servletPath = request.getServletPath();
        String method = request.getMethod();

        //댓글 조회는 비로그인도 허용
        if("/comments".equals(servletPath) && "GET".equalsIgnoreCase(method)){
            return true;
        }
        //좋아요 상태 조회 허용
        if (servletPath.startsWith("/likes/isLiked/") && "GET".equalsIgnoreCase(method)) {
            return true;
        }

        if (session == null || session.getAttribute("id") == null) {
            if (servletPath.startsWith("/admin")) {
                response.sendRedirect(request.getContextPath() + "/adminlogin");
            } else {
                response.sendRedirect(request.getContextPath() + "/user/login");
            }
            return false;
        }

        return true;
    }
}
