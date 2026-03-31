package com.naver.jbb.api;

import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.naver.jbb.domain.LikesDTO;
import com.naver.jbb.service.LikesService;

@RestController
@RequestMapping("/likes")
public class LikesController {

    private final LikesService likesService;
    public LikesController(LikesService likesService){
        this.likesService = likesService;
    }

    @PostMapping
    public ResponseEntity<Map<String, Object>> toggleLike(@RequestBody LikesDTO likesDTO, HttpSession session, Model m){
        String user_id = (String)session.getAttribute("id");
        Map<String, Object> response = new HashMap<>();

        try {
            if(user_id == null){
                response.put("error", "로그인이 필요합니다.");
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
            }

            //세션 사용자 아이디를 DTO에 주입
            likesDTO.setUser_id(user_id);

            boolean liked = likesService.toggleLike(likesDTO);
            int likeCount = likesService.getLikeCount(likesDTO.getBoard_bno());

            response.put("liked", liked);
            response.put("likeCount", likeCount);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("error", e.getMessage()); //에러메세지
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    @GetMapping("/isLiked/{bno}")
    public ResponseEntity<Map<String, Object>> checkIfLiked(@PathVariable("bno") int board_bno, HttpSession session){
        Map<String, Object> response = new HashMap<>();
        try {
            boolean isLiked = likesService.isUserLikedPost(board_bno, session);
            int likeCount = likesService.getLikeCount(board_bno);

            response.put("likeCount", likeCount);
            response.put("isLiked", isLiked);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("error", "좋아요 여부,개수 확인 중 오류 발생");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

}
