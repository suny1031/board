package com.toy.board.board;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("brdList", boardService.selectBoardList());
        return "board/boardList";
    }

    @GetMapping("/upload")
    public String upload() {
        return "board/boardUpload";
    }

    @PostMapping("/uploadimpl")
    public String uploadImpl(Board board, Model model) {
        System.out.println(board.toString());
        boardService.insertBoard(board);

        model.addAttribute("alertMsg", "게시물 등록에 성공하였습니다");
        model.addAttribute("url", "/list");
        return "common/result";
    }

    @GetMapping("/detail")
    public String detail(String brdIdx, Model model) {
        model.addAttribute("brd", boardService.selectByBoard(brdIdx));
        model.addAttribute("brdCmtList", boardService.selectBoardCmtList(brdIdx));
        return "board/boardDetail";
    }

    @GetMapping("/modify")
    public String modify(String brdIdx, Model model) {
        model.addAttribute("brd", boardService.selectByBoard(brdIdx));
        return "board/boardModify";
    }

    @PostMapping("modifyimpl")
    public String modifyImpl(Board board, Model model) {
        boardService.updateBoard(board);

        model.addAttribute("alertMsg", "게시물 수정에 성공하였습니다");
        model.addAttribute("url", "/detail?brdIdx=" + board.getBrdIdx());
        return "common/result";
    }

    @GetMapping("delete")
    public String delete(String brdIdx, Model model) {
        boardService.updateBoardDelete(brdIdx);

        model.addAttribute("alertMsg", "게시물 삭제 성공하였습니다");
        model.addAttribute("url", "/list");
        return "common/result";
    }

    @PostMapping("cmtuploadimpl")
    @ResponseBody
    public String cmtUpload(@RequestBody BoardCmt boardCmt, Model model) {

        boardService.insertBoardCmt(boardCmt);

        return "success";

    }

    @PostMapping("cmtdelete")
    @ResponseBody
    public String cmtDelete(@RequestBody BoardCmt boardCmt, Model model) {
        boardService.updateBoardCmtDelete(boardCmt);
        return "success";

    }

    @PostMapping("cmtmodify")
    public String cmtModify(BoardCmt boardCmt, Model model) {

        boardService.updateBoardCmtModify(boardCmt);

        model.addAttribute("url", "/detail?brdIdx=" + boardCmt.getBrdIdx());
        return "common/result";
    }

    @PostMapping("rcmtupload")
    public String RcmtUpload(BoardCmt boardCmt, Model model) {
        boardService.insertBoardRCmt(boardCmt);

        model.addAttribute("url", "/detail?brdIdx=" + boardCmt.getBrdIdx());
        return "common/result";
    }
}
