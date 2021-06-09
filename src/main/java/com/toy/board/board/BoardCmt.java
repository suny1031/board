package com.toy.board.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardCmt {

    private String cmtIdx;
    private String brdIdx;
    private String cmtContent;
    private String cmtWriter;
    private String cmtRegDate;
    private String cmtIsDel;
    private String cmtGrp;
    private String cmtSeq;
    private int cmtLvl;


}
