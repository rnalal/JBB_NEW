package com.naver.jbb.config;

import com.naver.jbb.interceptor.AdminInterceptor;
import com.naver.jbb.interceptor.AuthInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@RequiredArgsConstructor
@Configuration
public class WebConfig implements WebMvcConfigurer {

    private final AuthInterceptor authInterceptor;
    private final AdminInterceptor adminInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        // 로그인 필요한 경로
        registry.addInterceptor(authInterceptor)
                .addPathPatterns(
                        "/user/mypage",
                        "/user/update",
                        "/user/delete",
                        "/user/logout",

                        "/board/write",
                        "/board/modify",
                        "/board/remove",
                        "/board/draft",
                        "/board/draft/delete",
                        "/board/myboardlist",
                        "/board/mycommentlist",
                        "/board/mylikeslist",

                        "/comments/**",
                        "/likes/**",
                        "/notifications/**",

                        "/qna/**",

                        "/admin/**"
                )
                .excludePathPatterns(
                        "/",
                        "/user/login",
                        "/user/join",
                        "/user/checkid",
                        "/user/findIdCheck",
                        "/adminlogin",

                        "/board/list",
                        "/board/read",
                        "/board/view",
                        "/board/getSubCategories",
                        "/board/getPostsByCategory",

                        "/faq/**",
                        "/notify/**",

                        "/css/**",
                        "/js/**",
                        "/img/**",
                        "/resources/**",
                        "/error"
                );

        // 관리자만 접근 가능한 경로
        registry.addInterceptor(adminInterceptor)
                .addPathPatterns("/admin/**")
                .excludePathPatterns(
                        "/adminlogin",
                        "/css/**",
                        "/js/**",
                        "/img/**",
                        "/resources/**",
                        "/error"
                );
    }
}