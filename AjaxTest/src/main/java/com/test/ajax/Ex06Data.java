package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/ex06data.do")
public class Ex06Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//ex06data.do?type=1
		String type = req.getParameter("type");
		
		if (type.equals("1")) {
			m1(req, resp);
		} else if (type.equals("2")) {
			m2(req, resp);
		} else if (type.equals("3")) {
			m3(req, resp);
		} else if (type.equals("4")) {
			m4(req, resp);
		} else if (type.equals("5")) {
			m5(req, resp);
		} else if (type.equals("6")) {
			m6(req, resp);			
		}
		
		
		//JSON 라이브러리 jar파일 사용하는 예제 > //ex06data.do?type=10
		AjaxDAO dao = new AjaxDAO();
		ArrayList<UserDTO> list = dao.listUser();
		
		resp.setContentType("application/json"); 
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		//JSONObject > JSON Object
		//JSONArray > JSON Array
		
		//질문 > m5
		/*
		{
			"question": "제목",
			"name": "홍길동",
			"age": "20"
		}
		*/
//		JSONObject obj = new JSONObject();
//		obj.put("question", "제목입니다.");
//		obj.put("name", "홍길동");
//		obj.put("age", "20");
//		
//		System.out.println(obj.toString());
		//"question":"제목입니다.","name":"홍길동","age":"20"}
		
		JSONArray arr = new JSONArray();
		
		for (UserDTO dto : list) {
			
			//UserDTO > JSONObject
			JSONObject obj = new JSONObject();
			obj.put("id", dto.getId());
			obj.put("pw", dto.getPw());
			obj.put("name", dto.getName());
			obj.put("lv", dto.getLv());
			
			arr.add(obj);
			
		}
		
		System.out.println(arr.toString());
		/*
		 * [{"pw":"1111","name":"홍길동","lv":"1","id":"hong"},
		 *  {"pw":"1111","name":"강아지","lv":"1","id":"dog"},
		 *  {"pw":"1111","name":"고양이","lv":"2","id":"cat"}]
		 * */
		
		writer.close();
		
	}

	private void m6(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
			//JSON 반환 + 다중값
			/*
					
					hong,1111,홍길동,1
					dog,1111,강아지,1
					cat,1111,고양이,2
					
					[
						{
							"id": "hong",
							"pw": "1111",
							"name": "홍길동",
							"lv": "1"
						},
						{
							"id": "hong",
							"pw": "1111",
							"name": "홍길동",
							"lv": "1"
						}
					]
					
				*/
				
				AjaxDAO dao = new AjaxDAO();
				ArrayList<UserDTO> list = dao.listUser();
				
				//ArrayList<UserDTO> > (변환+문자열) > JSON 객체 배열
				resp.setContentType("application/json"); 
				resp.setCharacterEncoding("UTF-8");
				
				PrintWriter writer = resp.getWriter();
				
//				writer.println("[");
//				
//				int i = 0;
//				
//				for (UserDTO dto : list) {
//					writer.println("{");
//					writer.printf("\"id\": \"%s\",", dto.getId());
//					writer.printf("\"pw\": \"%s\",", dto.getPw());
//					writer.printf("\"name\": \"%s\",", dto.getName());
//					writer.printf("\"lv\": \"%s\"", dto.getLv());
//					writer.println("}");
//					
//					if (i < list.size() - 1) {
//						writer.println(",");
//					}
//					i++;
//				}		
//				
//				writer.println("]");
				
				
				//JSON 라이브러리 사용
				JSONArray arr = new JSONArray();
				
				for (UserDTO dto : list) {
					
					//UserDTO > JSONObject
					JSONObject obj = new JSONObject();
					obj.put("id", dto.getId());
					obj.put("pw", dto.getPw());
					obj.put("name", dto.getName());
					obj.put("lv", dto.getLv());
					
					arr.add(obj);
					
				}
				writer.print(arr);
				
				
				writer.close();
				

		
	}
	
	private void m5(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		//JSON 반환 + 단일값
		/*
			
			JSON, JavaScript Object Notation
			- 객체 표기법
			
			//JavaScript 언어
			const obj = {
				name: '홍길동',
				age: 20,
				hello: function(){
				}
			};
			
			//JSON표기법 > 프로그램언어(X), 데이터표기법(O)
			{
				"name": "홍길동",
				"age": 20
			}
			
			
			{
				"question": "제목"
			}
			
		*/
		
		AjaxDAO dao = new AjaxDAO();
		
		String question= dao.getQuestion();
		
		resp.setContentType("application/json"); //("text/plain") > 텍스트파일이라고 알려줌
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter(); //throws IOException 구문 추가(예외미루기)
		writer.print("{");
		writer.printf("\"question\": \"%s\"", question);
		writer.print("}");
		writer.close();
		
		
	}
	
	private void m4(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		//XML 반환 > 다중값
		
		/*
			<?xml version="1.0" encoding="UTF-8"?>
			<users>
				<user>
					<id>hong</id>
					<pw>1111</pw>
					<name>홍길동</name>
					<lv>1</lv>
				</user>
				<user>
					<id>dog</id>
					<pw>1111</pw>
					<name>강아지</name>
					<lv>1</lv>
				</user>
				<user>
					<id>cat</id>
					<pw>1111</pw>
					<name>고양이</name>
					<lv>2</lv>
				</user>
			<users>
			
		*/
		
		AjaxDAO dao = new AjaxDAO();
		ArrayList<UserDTO> users = dao.listUser();
		
		resp.setContentType("text/xml");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		writer.println("<users>");
		
		for (UserDTO dto : users) {
			writer.println("<user>");
				writer.printf("<id>%s</id>", dto.getId());
				writer.printf("<pw>%s</pw>", dto.getPw());
				writer.printf("<name>%s</name>", dto.getName());
				writer.printf("<lv>%s</lv>", dto.getLv());
			writer.println("</user>");
		}
		
		writer.println("</users>");
		
		writer.close();
		
	}
	
	private void m3(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		//XML 반환 > 단일값
		AjaxDAO dao = new AjaxDAO();
		
		String question= dao.getQuestion();
		
		/*
			
			<?xml version="1.0" encoding="UTF-8"?>
			<question id="q1">설문 제목</question>
			
		*/
		
		resp.setContentType("text/xml");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		writer.printf("<question id=\"q1\">%s</question>", question);
		
		writer.close();
		
	}
	
	private void m2(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		//텍스트 반환 + 다중값
		
		/* 
			hong,111,홍길동,1
			dog,111,강아지,1
			cat,111,고양이,2
		*/
		
		AjaxDAO dao = new AjaxDAO();
		
		ArrayList<UserDTO> list = dao.listUser();
		
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		//ArrayList > CSV
		for ( UserDTO dto : list) {
			writer.printf("%s,%s,%s,%s\r\n"
						, dto.getId()
						, dto.getPw()
						, dto.getName()
						, dto.getLv());
		}
		
		writer.close();
		
	}

	private void m1(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//텍스트 반환 + 단일값
		AjaxDAO dao = new AjaxDAO();
		
		String question= dao.getQuestion();
		
		//서버는 클라이언트에게 데이터를 돌려줄 떄 형식을 지정해야 한다.
		//- MIME > 응답 헤더 MIME을 기입한다.
		//- 브라우저(or ajax)는 응답 헤더의 MIME을 보고 자신이 돌려받은 데이터 형식을 인식한다.
	
		resp.setContentType("text/plain"); //("text/plain") > 텍스트파일이라고 알려줌
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter(); //throws IOException 구문 추가(예외미루기)
		writer.print(question);
		writer.close();
		
		
	}

}