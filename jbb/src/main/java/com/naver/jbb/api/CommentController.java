package com.naver.jbb.api;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.naver.jbb.domain.CommentDTO;
import com.naver.jbb.service.CommentService;

@RestController
public class CommentController {

    @Autowired
    CommentService service;

    //댓글 수정
    @PatchMapping("/comments/{cno}") // {cno}는 URL 경로의 일부
    public ResponseEntity<String> modify(@PathVariable Integer cno,
                                         @RequestBody CommentDTO dto, HttpSession session){
        String commenter = (String)session.getAttribute("id");
        dto.setCommenter(commenter);
        dto.setCno(cno);

        try {
            if(service.modify(dto)!=1)
                throw new Exception("Write failed");

            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MODO_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    //댓글 등록
    @PostMapping("/comments")
    public ResponseEntity<String> write(@RequestBody CommentDTO dto, @RequestParam("bno")Integer bno, HttpSession session){
        String commenter = (String)session.getAttribute("id");
        dto.setCommenter(commenter);
        dto.setBno(bno);

        try {
            if(service.write(dto)!=1)
                throw new Exception("Write failed");

            return new ResponseEntity<>("WRT_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    //지정된 댓글 삭제
    @DeleteMapping("/comments/{cno}")
    public ResponseEntity<String> remove(@PathVariable Integer cno,
                                         Integer bno, HttpSession session) {
        String commenter = (String)session.getAttribute("id");

        try {
            int rowCnt = service.remove(cno, bno, commenter);

            if(rowCnt!=1)
                throw new Exception("Delete Failed");

            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    //댓글 목록
    @GetMapping("/comments")
    public ResponseEntity<List<CommentDTO>> list(Integer bno){
        List<CommentDTO> list = null;

        try {
            list = service.getList(bno);
            return new ResponseEntity<List<CommentDTO>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<CommentDTO>>(HttpStatus.BAD_REQUEST);
        }

    }
}
