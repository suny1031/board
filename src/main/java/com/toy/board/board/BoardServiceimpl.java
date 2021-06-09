package com.toy.board.board;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class BoardServiceimpl implements BoardService{


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
    public void UpdateBoard(Board board) {
       boardRepository.UpdateBoard(board);
    }

    @Override
    public void UpdateBoardDelete(String brdIdx) {
        boardRepository.UpdateBoardDelete(brdIdx);
    }

    @Override
    public List<BoardCmt> selectBoardCmtList(String brdIdx) {
        return boardCmtRepository.selectBoardCmtList(brdIdx);
    }


}
