package com.toy.board.board;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
public class Board {

    private String brdIdx;
    private String title;
    private String content;
    private String writer;
    private String isDel;
    private String regDate;

}
