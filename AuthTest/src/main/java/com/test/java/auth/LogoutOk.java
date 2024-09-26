package com.test.java.auth;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/auth/logout.do")
public class LogoutOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//로그아웃
		HttpSession session = req.getSession();
		
		session.removeAttribute("auth"); //로그아웃
		
		session.removeAttribute("name");//이름버리기
		session.removeAttribute("lv");//등급버리기
		
		
		resp.sendRedirect("/auth/index.do");

	}
}
