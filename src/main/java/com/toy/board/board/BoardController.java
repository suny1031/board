package com.toy.board.board;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

@Controller
@RequiredArgsConstructor
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/list")
    public String list(Model model){
        model.addAttribute("brdList",boardService.selectBoardList());
        return "board/boardList";
    }

    @GetMapping("/upload")
    public String upload(){
        return "board/boardUpload";
    }

    @PostMapping("/uploadimpl")
    public String uploadImpl(Board board,Model model){
        System.out.println(board.toString());
        boardService.insertBoard(board);

        model.addAttribute("alertMsg","게시물 등록에 성공하였습니다");
        model.addAttribute("url","/list");
        return "common/result";
    }

    @GetMapping("/detail")
    public String detail(String brdIdx,Model model){
        model.addAttribute("brd",boardService.selectByBoard(brdIdx));
        model.addAttribute("brdCmtList",boardService.selectBoardCmtList(brdIdx));
        return "board/boardDetail";
    }

    @GetMapping ("/modify")
    public String modify(String brdIdx, Model model){
        model.addAttribute("brd",boardService.selectByBoard(brdIdx));
        return "board/boardModify";
    }

    @PostMapping("modifyimpl")
    public String modifyImpl(Board board, Model model){
        boardService.UpdateBoard(board);

        String brdIdx = board.getBrdIdx();
        model.addAttribute("alertMsg","게시물 수정에 성공하였습니다");
        model.addAttribute("url","/detail?brdIdx="+brdIdx);
        return "common/result";
    }

    @GetMapping("delete")
    public String delete(String brdIdx, Model model){
        boardService.UpdateBoardDelete(brdIdx);

        model.addAttribute("alertMsg","게시물 삭제 성공하였습니다");
        model.addAttribute("url","/list");
        return "common/result";
    }

    @GetMapping("cmtwriter")
    public String cmtwriter(String brdIdx, Model model){
        model.addAttribute("alertMsg","게시물 삭제 성공하였습니다");
        model.addAttribute("url","/list");
        return "common/result";
    }
}
