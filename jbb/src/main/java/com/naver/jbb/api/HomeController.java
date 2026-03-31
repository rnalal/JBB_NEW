package com.naver.jbb.api;

import com.naver.jbb.service.BoardService;
import com.naver.jbb.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Collections;

@Controller
public class HomeController {

    private final BoardService boardService;
    private final CategoryService categoryService;

    public HomeController(BoardService boardService, CategoryService categoryService){
        this.boardService = boardService;
        this.categoryService = categoryService;
    }
    @GetMapping("/")
    public String home(Model m){
        try {
            m.addAttribute("latestPosts", boardService.getLatestPosts());
            m.addAttribute("popularPosts", boardService.getPopularPosts());
        } catch (Exception e){
            e.printStackTrace();
            m.addAttribute("latestPosts", Collections.emptyList());
            m.addAttribute("popularPosts", Collections.emptyList());
        }
        return "index";
    }
}
