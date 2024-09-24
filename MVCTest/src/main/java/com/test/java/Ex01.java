package com.test.java;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex01 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int num = 10;
		String txt = "문자열";
		
		req.setAttribute("num", num);
		req.setAttribute("txt", txt);
		
		//'/' == webapp(root)폴더를 벗어나지 않도록 해야함
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF//views//ex01.jsp");
		dispatcher.forward(req, resp);
	
	}
	
}
