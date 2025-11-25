package com.winter.app.board;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
class BoardDAOTest {

	@Autowired
	private BoardDAO boardDAO;
	
	@Test
	void testlist() throws Exception {
		List<BoardDTO> ar = boardDAO.list();
		assertNotEquals(0, ar.size());
	}
	
	@Test
	void testDetail() throws Exception{
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setNum(3123L);
		
		boardDTO=boardDAO.detail(boardDTO);
//		log.info(boardDTO.toString());
		
		assertNull(boardDTO); 
	}
	
	/*
	 * @Test void testAdd() throws Exception {
	 * 
	 * BoardDTO boardDTO = new BoardDTO(); boardDTO.setTitle("t1");
	 * boardDTO.setWriter("w1"); boardDTO.setContents("c1"); int result =
	 * boardDAO.add(boardDTO); assertEquals(1, result); }
	 */
	
	/*
	 * @Test void testDelete() throws Exception { BoardDTO boardDTO = new
	 * BoardDTO(); boardDTO.setNum(792L);
	 * 
	 * int result = boardDAO.delete(boardDTO);
	 * 
	 * assertEquals(1, result); }
	 */
	
	@Test
	void testUpdate() throws Exception {
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setNum(794L);
		boardDTO.setTitle("update01");
		boardDTO.setContents("update011");
		int result = boardDAO.update(boardDTO);
		
		assertEquals(1, result);
	}
	
//	@Test
//	void testUpdate() throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		map.put("t", "update T");
//		map.put("c", "update C");
//		map.put("n", 25L);
//		int result = boardDAO.update(boardDTO);
//		
//		assertEquals(1, result);
//	}
}
