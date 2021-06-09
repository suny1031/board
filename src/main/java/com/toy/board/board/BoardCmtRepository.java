package com.toy.board.board;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface BoardCmtRepository {

    @Select("select * from board_comments where brd_idx = #{brdIdx} order by cmt_grp desc, cmt_seq asc")
    public List<BoardCmt> selectBoardCmtList(String brdIdx);


}
