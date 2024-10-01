package com.test.api;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex01.do")
public class Ex01 extends HttpServlet { //컨트롤러 > 일은 안하고 통제만 한다.

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//요청되는 상황
		//1. 처음 요청(URL) > ex01.do
		//2. 검색 요청(<form>태그) > ex01.do?word=자바
		
		String word = req.getParameter("word");
		String count = req.getParameter("count");
		String start = req.getParameter("start");
		
		if (word != null) {
			
			//OpenAPI 요청 > 결과 반환
			BookDAO dao = new BookDAO();
			
			//ArrayList<BookDTO> list = dao.search(word, count, start);
			HashMap<String, Object> map = dao.search(word, count, start);
			
			
			req.setAttribute("list", (ArrayList<BookDTO>)map.get("result"));
			req.setAttribute("word", word);
			req.setAttribute("count", count); //상태유지되도록
			req.setAttribute("start", start); //상태유지
			req.setAttribute("total", map.get("total")); 
			
		}
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex01.jsp");
		dispatcher.forward(req, resp);
	}

}