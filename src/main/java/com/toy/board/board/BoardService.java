package com.toy.board.board;

import java.util.List;

public interface BoardService {


    public List<Board> selectBoardList();

    public void insertBoard(Board board);

    public Board selectByBoard(String brdIdx);

    public void UpdateBoard(Board board);

    public void UpdateBoardDelete(String brdIdx);

    public List<BoardCmt> selectBoardCmtList(String brdIdx);



}
