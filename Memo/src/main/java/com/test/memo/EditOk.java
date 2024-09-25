package com.test.memo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.memo.model.MemoDTO;
import com.test.memo.repository.MemoDAO;

@WebServlet("/editok.do")
public class EditOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//edit.do > 데이터 줄테니 > DB에 update
		
		//1. 데이터 가져오기(memo, seq, pw)
		//1.5 권한 확인(암호 확인)
		//2. DB update
		//3. 결과 통보 + list.do 이동하기
		
		//0. 한글 깨지지 않도록
		req.setCharacterEncoding("UTF-8");
		
		//1.		
		String memo = req.getParameter("memo");
		String seq = req.getParameter("seq");
		String pw = req.getParameter("pw");
		
		//1.5
		MemoDAO dao = new MemoDAO(); //DB접속

		MemoDTO dto = new MemoDTO();
		dto.setSeq(seq);//seq를 DAO한테 줬던거 가져와보자구~!~!~!
		dto.setPw(pw);
		
		int result = 0;
		
		if (dao.check(dto) == 1) {
			//2. 		
			dto.setMemo(memo);
			if (dao.edit(dto) == 1) {
				result = 1;
			}
		} else {
			result = 2;
		}
		
		
		
		if (result == 1) {
			resp.sendRedirect("/memo/list.do");
		} else if (result == 2) {
			PrintWriter writer = resp.getWriter();
			writer.println("<html><body>");
			writer.println("<script>");
			writer.println("alert('incorrect password');");
			writer.println("history.back();");
			writer.println("</script>");
			writer.println("</body></html>");
			writer.close();
		} else {
			PrintWriter writer = resp.getWriter();
			writer.println("<html><body>");
			writer.println("<script>");
			writer.println("alert('failed');");
			writer.println("history.back();");
			writer.println("</script>");
			writer.println("</body></html>");
			writer.close();
		}


	}

}
