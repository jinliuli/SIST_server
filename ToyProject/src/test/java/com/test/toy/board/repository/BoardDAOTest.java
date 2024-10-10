package com.test.toy.board.repository;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.Calendar;

import javax.swing.border.Border;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
//JUnit5 전용 import
import org.junit.jupiter.api.Test;

import com.test.toy.board.model.BoardDTO;


public class BoardDAOTest {
	
	private static BoardDAO dao;
		
		@BeforeAll
		static void init() {
			dao = BoardDAO.getInstance();
		}

	
	//@Disabled
	@DisplayName("게시판 글을 작성합니다.")
	@Test
	void testAdd() {
		
		//System.out.println(1);
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO dto = new BoardDTO();
		dto.setId("hong");
		dto.setSubject("제목입니다.");
		dto.setContent("내용입니다요");
		
		int result = dao.add(dto);
		
		assertEquals(1, result);
		
	}
	
	@Disabled
	@DisplayName("제목을 빼고 게시판 글을 작성합니다.")
	@Test
	void testAdd2() {
		
		//System.out.println(1);
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO dto = new BoardDTO();
		dto.setId("hong");
		dto.setSubject(null);
		dto.setContent("내용입니다요");
		
		int result = dao.add(dto);
		
		assertEquals(1, result);
	
	}
	
	@Disabled
	@DisplayName("로그인을 안했는데 게시판 글을 작성합니다.")
	@Test
	void testAdd3() {
		
		//System.out.println(1);
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO dto = new BoardDTO();
		dto.setId(null
				);
		dto.setSubject("제목입니다.");
		dto.setContent("내용입니다요");
		
		int result = dao.add(dto);
		
		assertEquals(1, result);
	
	}
	
//	//@Disabled
//	@DisplayName("목록을 가져옵니다.")
//	@Test
//	void testList() {
//		
//		ArrayList<BoardDTO> list = dao.list();
//		
//		//System.out.println(list.get(0));
//		
//		assertEquals(7, list.size());
//		
//	}
	
	//@Disabled
	@DisplayName("글 1개를 상세보기합니다.")
	@Test
	void testGet() {
		
		String seq = "1";
		
		BoardDTO dto = dao.get(seq);
		
		assertNotNull(dto);
		assertEquals("게시판입니다.", dto.getSubject());
		assertEquals("1", dto.getSeq());
		
	}
	
	//@Disabled
	@DisplayName("1번 글의 조회수를 증가시킵니다.")
	@Test
	void testUpdateReadcount() {
		
		String seq = "1";
		
		int count = dao.get(seq).getReadcount(); //0
		
		dao.updateReadcount(seq); //0 > 1
				
		assertEquals(count + 1, dao.get(seq).getReadcount());
				
	}

	
	
	@Disabled
	@DisplayName("제목/내용을 수정합니다.")
	@Test
	void testEdit() {
		
		Calendar now = Calendar.getInstance();
		
		BoardDTO dto = new BoardDTO();
		dto.setSeq("1");
		dto.setSubject("제목입니다. " + String.format("%tT", now));
		dto.setContent("내용입니다. " + String.format("%tT", now));
		
		int result = dao.edit(dto);
		
		assertEquals(1, result);
		
	}
	
	@Disabled
	@DisplayName("게시물을 삭제합니다.")
	@Test
	void testDel() {
		
		String seq = "2";
		
		int result = dao.del(seq);
		
		assertEquals(1, result);
		
	
	}
	
	
//	@DisplayName("(날짜를 가공해서) 목록을 가져옵니다.")
//	@Test
//	void tesList2() {
//		
//		ArrayList<BoardDTO> list = dao.list();
//
//		//System.out.println(list.get(0));
//		
//		assertEquals(6, list.size());
//		
//		
//		//System.out.println(assertEquals(6, list.size()));
//		
//	}
}
