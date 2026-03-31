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
