package com.toy.board.board;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface BoardCmtRepository {

    @Select("select * from board_comments where brd_idx = #{brdIdx} and cmt_is_del ='0' order by cmt_grp desc, cmt_seq asc")
    public List<BoardCmt> selectBoardCmtList(String brdIdx);

    @Insert("insert into board.board_comments(brd_idx, cmt_content, cmt_writer, cmt_grp, cmt_seq, cmt_lvl) " +
            "values(#{brdIdx}, #{cmtContent}, 'Guest',(select last_insert_id()+1),'1','0' )")
    public void insertBoardCmt(BoardCmt boardCmt);

    @Update("update board.board_comments set cmt_is_del = '1' where cmt_grp = #{cmtGrp} and  cmt_lvl > ${cmtLvl} or cmt_idx = ${cmtIdx} order by cmt_lvl ")
    public void updateBoardCmtDelete(BoardCmt boardCmt);


    @Update("update board.board_comments set cmt_content = #{cmtContent}, cmt_reg_date = now() where cmt_idx = #{cmtIdx}")
    public void updateBoardCmtModify(BoardCmt boardCmt);


    @Insert("insert into board.board_comments(brd_idx, cmt_content, cmt_writer, cmt_grp, cmt_seq, cmt_lvl)" +
            "values(#{brdIdx}, #{cmtContent}, 'Guest', #{cmtGrp}, #{cmtSeq}+1, #{cmtLvl}+1)")
    public void insertBoardRCmt(BoardCmt boardCmt);


    @Update("update board.board_comments set cmt_content =#{cmtContent} where cmt_idx = #{cmtIdx}")
    public void UpdateBoardCmtModify(BoardCmt boardCmt);


    @Update("update board.board_comments set cmt_seq = cmt_seq+1 where cmt_grp = ${cmtGrp} and cmt_seq > ${cmtSeq}")
    public void updateBoardCmt(BoardCmt boardCmt);

}
