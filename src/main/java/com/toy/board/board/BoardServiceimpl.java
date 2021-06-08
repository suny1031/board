package com.toy.board.board;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class BoardServiceimpl implements BoardService{


    private final BoardRepository boardRepository;

    @Override
    public List<Board> selectBoardList() {
        return boardRepository.selectBoardList();
    }

    @Override
    public void insertBoard(Board board) {
        boardRepository.insertBoard(board);
    }

    @Override
    public Board selectByBorad(String brdIdx) {
        return boardRepository.selectByBorad(brdIdx);
    }


}
