package com.naver.jbb.exception;

import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartException;

import java.io.IOException;
import java.io.PrintWriter;

@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public void handleMaxUploadSizeExceededException(HttpServletResponse response) throws IOException {
        sendUploadSizeAlert(response);
    }

    @ExceptionHandler(MultipartException.class)
    public void handleMultipartException(HttpServletResponse response) throws IOException {
        sendUploadSizeAlert(response);
    }

    private void sendUploadSizeAlert(HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");

        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('사진 용량이 너무 큽니다. 10MB 이하 파일만 업로드해주세요.');");
        out.println("history.back();");
        out.println("</script>");
        out.flush();
    }
}
