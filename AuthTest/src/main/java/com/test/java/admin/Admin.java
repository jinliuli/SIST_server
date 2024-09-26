package com.test.java.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin/admin.do")
public class Admin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//인증받지 못한 사용자 차단
		HttpSession session = req.getSession();
		
		/*
			자바 short circuit
			- 논리 연산시 발생하는 정책
			쇼트 서킷이란, 논리연산자 AND, OR 을 나타내기 위해 부호 &&,  || 을 사용하는 것을 의미한다.
&&, || 와 &, | 를 비교할 때, 둘은 최종적으로 같은 결과를 내지만 다른 과정을 거친다.
 & ,  | : 연산자의 앞 조건식과 뒤 조건식을 둘 다 실행 시킨다.
&& ,  ||  : 연산자의 앞 조건식의 결과에 따라 뒤 조건식의 실행 여부를 결정한다. 이러한 논리연산자를 특별히 『쇼트-서킷』이라 한다.
쇼트 서킷에서는 &&  앞의 boolean 값이 false 일 때, && 뒤를 굳이 실행하지 않음으로 불필요한 연산을 생략하고
마찬가지로 || 앞의 boolean 값이 false 일 때만 뒤를 실행한다. (|| 앞쪽이 True 라면 뒤를 굳이 연산하지 않는다.)
			
			int a = 9;
			if ((a % 2 == 0) && a > 0) {
				
			}
			
			
			int a = 10;
			if ((a % 2 == 0) || a > 0) {
				
			}
		 */
		//로그아웃시에 몰래admin.do로 들어갈려면 (int)null == 1 이거 먼저 실행하기 때문에 오류 발생 > HTTP 상태 500 – 내부 서버 오류
		//if ((int)session.getAttribute("lv") == 1 || session.getAttribute("auth") == null) {
		if (session.getAttribute("auth") == null || (int)session.getAttribute("lv") == 1) {
			
			//절대경로(/)
			//1. 클라이언트 > /root == webapp
			//2. 서버 > / == webapp
			//resp.sendRedirect("/auth/index.do"); //location.href = '/auth/index.do''
			
			PrintWriter writer = resp.getWriter();
			writer.println("<html><body><script>");
			writer.println("alert('invalid access');");
			writer.println("location.href='/auth/index.do';");
			writer.println("</script></body></html>");
			writer.close();
			
			return;
			
		} 
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/admin.jsp");
		dispatcher.forward(req, resp);
	}

}