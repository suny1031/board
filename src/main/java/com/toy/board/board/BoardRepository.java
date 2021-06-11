package com.toy.board.board;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;


@Mapper
public interface BoardRepository {

    public List<Board> selectBoardList();

    @Insert("insert into board.board(brd_idx,title,content,writer) values(NEXTVAL(sc_brd_idx),#{title},#{content},'Guest')")
    public void insertBoard(Board board);

    @Select("select * from board.board where brd_idx = #{brdIdx}")
    public Board selectByBoard(String brdIdx);

    @Update("update board.board set title =#{title} , content =#{content}, reg_date =now() where brd_idx =#{brdIdx}")
    public void updateBoard(Board board);

    @Update("update board.board set is_del ='1' where brd_idx = #{brdIdx}")
    public void updateBoardDelete(String brdIdx);

}
