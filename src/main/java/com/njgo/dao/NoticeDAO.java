package com.njgo.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.BoardDTO;

@Repository
public class NoticeDAO implements BoardDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String namespace="NoticeMapper.";

	@Override
	public List<BoardDTO> boardList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardDTO boardView(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int boardWrite(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardUpdate(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardDelete(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardHit(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

}