package com.toy.board.board;

import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface BoardService {


    public List<Board> selectBoardList();

    public void insertBoard(Board board);

    public Board selectByBoard(String brdIdx);

    public void updateBoard(Board board);

    public void updateBoardDelete(String brdIdx);

    public List<BoardCmt> selectBoardCmtList(String brdIdx);

    public void insertBoardCmt(BoardCmt boardCmt);

    public void updateBoardCmtDelete(BoardCmt boardCmt);

    public void updateBoardCmtModify(BoardCmt boardCmt);

    public void insertBoardRCmt(BoardCmt boardCmt);


}
