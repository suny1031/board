package com.toy.board.board;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class BoardServiceimpl implements BoardService {


    private final BoardRepository boardRepository;
    private final BoardCmtRepository boardCmtRepository;

    @Override
    public List<Board> selectBoardList() {
        return boardRepository.selectBoardList();
    }

    @Override
    public void insertBoard(Board board) {
        boardRepository.insertBoard(board);
    }

    @Override
    public Board selectByBoard(String brdIdx) {
        return boardRepository.selectByBoard(brdIdx);
    }

    @Override
    public void updateBoard(Board board) {
        boardRepository.updateBoard(board);
    }

    @Override
    public void updateBoardDelete(String brdIdx) {
        boardRepository.updateBoardDelete(brdIdx);
    }

    @Override
    public List<BoardCmt> selectBoardCmtList(String brdIdx) {
        return boardCmtRepository.selectBoardCmtList(brdIdx);
    }

    @Override
    public void insertBoardCmt(BoardCmt boardCmt) {
        boardCmtRepository.insertBoardCmt(boardCmt);
    }

    @Override
    public void updateBoardCmtDelete(BoardCmt boardCmt) {
        boardCmtRepository.updateBoardCmtDelete(boardCmt);
    }

    @Override
    public void updateBoardCmtModify(BoardCmt boardCmt) {
        boardCmtRepository.updateBoardCmtModify(boardCmt);
    }

    @Override
    public void insertBoardRCmt(BoardCmt boardCmt) {
        boardCmtRepository.insertBoardRCmt(boardCmt);


    }


}
