package com.test.toy.test;

import com.test.toy.user.model.UserDTO;
import com.test.toy.user.repository.UserDAO;

public class DAOTest {
	
	public static void main(String[] args) {
		
		
		////UserDAO 클래스 > public UserDAO()
		//				   > private UserDAO()
		//UserDAO dao1 = new UserDAO();
		//UserDAO dao2 = new UserDAO();
		
		//System.out.println(dao1 == dao2); //false
		//System.out.println(dao1.equals(dao2)); //false
		
		
		
		
		//UserDAO 클래스 > public static UserDAO getInstance()
//		UserDAO dao1 = UserDAO.getInstance();
//		UserDAO dao2 = UserDAO.getInstance();
//		
//		System.out.println(dao1 == dao2);		//false > true
//		System.out.println(dao1.equals(dao2));	//false > true
		
		
		
//		UserDAO dao = UserDAO.getInstance();
//		
//		UserDTO dto = new UserDTO();
//		dto.setId("cow");
//		dto.setPw("1111");
//		dto.setEmail("cow@naver.com");
//		dto.setName("소");
//		dto.setIntro("안녕하세요.소입니다요.");
//		
//		int result = dao.register(dto);
//		System.out.println(result);
		
		
		
		//JUnit
		/*
			빌드패스에서 JUnit 라이브러리로
			src/test/java
			> com.test.toy.user.repository
			> UserDAOTest.java 파일
		*/
		
		
		
	}

}
