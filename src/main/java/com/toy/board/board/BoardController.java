package com.toy.board.board;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/list")
    public String list(Model model){
        //ystem.out.println(boardService.selectBoardList());
        model.addAttribute("brdList",boardService.selectBoardList());
        return "board/boardList";
    }

    @GetMapping("/upload")
    public String uploadForm(){
        return "board/boardUpload";
    }

    @PostMapping("/uploadimpl")
    public String upload(Board board,Model model){
        System.out.println(board.toString());
        boardService.insertBoard(board);

        model.addAttribute("alertMsg","게시물 등록에 성공하였습니다");
        model.addAttribute("url","/list");
        return "common/result";
    }

    @GetMapping("/detail")
    public String uploadForm(String brdIdx,Model model){
        model.addAttribute("brd",boardService.selectByBorad(brdIdx));
        return "board/boardDetail";
    }

}
