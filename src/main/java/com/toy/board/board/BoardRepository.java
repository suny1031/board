package com.toy.board.board;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;


@Mapper
public interface BoardRepository {

    @Select("select * from board.board")
    public List<Board> selectBoardList();

    @Insert("insert into board.board(brd_idx,title,content,writer) values(NEXTVAL(sc_brd_idx),#{title},#{content},'Guest')")
    public void insertBoard(Board board);

    @Select("select * from board.board where brd_idx = #{brdIdx}")
    public Board selectByBorad(String brdIdx);
}
