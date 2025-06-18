package com.hair.hairshop.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hair.hairshop.board.dto.Board;
import com.hair.hairshop.board.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

    @Autowired
    BoardMapper boardMapoper;

    @Override
    public List<Board> list() throws Exception {
        List<Board> boardList = boardMapoper.list();
        return boardList;
    }

    @Override
    public Board select(int no) throws Exception {
        Board board = boardMapoper.select(no);
        return board;
    }

    @Override
    public int insert(Board board) throws Exception {
        int result = boardMapoper.insert(board);
        return result;
    }

    @Override
    public int update(Board board) throws Exception {
        int result = boardMapoper.update(board);
        return result;
    }

    @Override
    public int delete(int no) throws Exception {
        int result = boardMapoper.delete(no);
        return result;
    }
    
}
