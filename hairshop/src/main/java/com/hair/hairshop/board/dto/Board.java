package com.hair.hairshop.board.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Board {

    private int no;                 // 게시글 번호
    private String title;           // 게시글 제목
    private String writer;          // 게시글 작성자
    private String content;         // 게시글 내용
    private Date createdAt;         // 등록일자
    private Date updatedAt;         // 수정일자
    
}
