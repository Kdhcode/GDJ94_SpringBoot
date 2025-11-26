package com.winter.app.board.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QnaDAO {
	public List<QnaDTO> list() throws Exception;
		

	
	public int add(QnaDTO qnaDTO) throws Exception;
}
