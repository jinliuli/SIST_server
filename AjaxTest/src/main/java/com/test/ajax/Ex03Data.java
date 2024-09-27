package com.test.ajax;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex03data.do")
public class Ex03Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		//1. data.txt파일 찾기!
		//webapp > data.txt
		
		//File file = new File("data.txt"); //C:\class\dev\eclipse\data.txt
		//File file = new File("\\data.txt"); //C:\data.txt
		//System.out.println(file.getAbsolutePath());
		//String path = req.getRealPath("data.txt");//C:\class\code\server\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\AjaxTest\data.txt
		
		String path = req.getRealPath("./data.txt");//C:\class\code\server\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\AjaxTest\data.txt

		//System.out.println(path);
		
		File file = new File(path);
		//System.out.println(file.exists()); //true
		
		

		//2. data.txt파일을 스캐너로 읽어서 보여주기 ~!
		Scanner scan = new Scanner(file);//파일에 입력할수있는 스캐너
		String data = scan.nextLine();
		//System.out.println(data);//100
		*/
		
		//일부러 오류 > ex03.jsp $('.message').append(`<div>\${ajax.status}</div>`); > 500 5XX: Server Error(서버 에러))
		//int a = 0;
		//a = 10 / a;
		//오류가 사라지면 > ex03.jsp $('.message').append(`<div>\${ajax.status}</div>`); > 200 2XX: Success(성공)
		
		
		AjaxDAO dao = new AjaxDAO();
		String question = dao.getQuestion();
		
		
		//resp.sendRedirect("/ajax/ex03.do?data=" + URLEncoder.encode(question,"UTF-8"));
		
		//--------------------------------------------------------------------
		//브라우저용 서블릿
//		req.setAttribute("question", question);
//		
//		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex03ok.jsp");
//		dispatcher.forward(req, resp);
		
		/*
		<!DOCTYPE html> <html> <head> <meta charset="UTF-8"> <title></title> <link rel="stylesheet" href="http://bit.ly/3WJ5ilK"> <style> </style> </head> <body> <!-- ex03ok.jsp--> <div>가장 자신있는 프로그래밍 언어는?</div> <script src="https://code.jquery.com/jquery-3.7.1.js"></script> <script src="https://bit.ly/4cMuheh"></script> <script> </script> </body> </html> 
		*/
		
		//--------------------------------------------------------------------
		//Ajax용 서블릿
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		writer.print(question);
		writer.close();
		
	}

}
