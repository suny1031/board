package com.toy.board.board;

import java.util.List;

public interface BoardService {


    public List<Board> selectBoardList();
    public void insertBoard(Board board);
    public Board selectByBorad(String brdIdx);
}
