package com.student.study.dto;

import java.util.Date;

import lombok.Data;

@Data
public class board {
    
    private int no;
    private String title;
    private String writer;
    private String content;
    private Date createdAt;
    private Date updatedAt;

}
