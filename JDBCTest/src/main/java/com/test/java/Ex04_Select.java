package com.test.java;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class Ex04_Select {
	
	public static void main(String[] args) {
		
		//Ex04_Select.java
		//m1();
		//m2();
		//m3();
		//m4();
		m5();
		
		
	}//main

	private static void m5() {
		
		//tblInsa + tblBonus
		//요구사항] 특정 직원에게 보너스를 지급하시오.
		//1. 모든 직원 명단 출력(번호, 이름, 부서, 직위)
		//2. 사용자 > 직원 선택(번호 입력)
		//3. 사용자 > 보너스 금액 입력
		//4. 보너스 지급
		//5. 지급된 내역을 출력
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		Scanner scan = new Scanner(System.in);
		
		try {
			
			conn = DBUtil.open("localhost", "hr", "java1234");
			stat = conn.createStatement();
			
			String sql = "select num, name, buseo, jikwi from tblInsa order by num asc";
			
			rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				System.out.printf("%s. %s(%s, %s)\n"
									, rs.getString("num")
									, rs.getString("name")
									, rs.getString("buseo")
									, rs.getString("jikwi"));
			}
			
			rs.close();
			
			System.out.print("직원 번호: ");
			String num = scan.nextLine();
			
			System.out.print("보너스: ");
			String bonus = scan.nextLine();
			
			
			sql = String.format("insert into tblBonus (seq, num, bonus) values (seqBonus.nextVal, %s, %s)", num, bonus);
			
			stat.executeUpdate(sql);
			
			
			sql = "select i.name as name, b.bonus as bonus, i.num as num from tblInsa i inner join tblBonus b on i.num = b.num where b.seq = (select max(seq) from tblBonus)";
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				System.out.printf("%s, %s, %s\n"
								, rs.getString("num")
								, rs.getString("name")
								, rs.getString("bonus"));
			}
			
			rs.close();
			stat.close();
			conn.close();
			
			
			
		} catch (Exception e) {
			System.out.println("Ex04_Select.m5");
			e.printStackTrace();
		}

	}

	private static void m4() {
		
		//부서 입력 > 해당 부서의 직원 명단(직원명, 지역, 급여) 출력
		
		Scanner scan = new Scanner(System.in);
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.open("localhost", "hr", "java1234");
			stat = conn.createStatement();
			
			String sql = "select distinct buseo from tblInsa order by buseo asc";
			
			rs = stat.executeQuery(sql);
			
			System.out.println("[부서명을 입력하세요.]");
			
			while (rs.next()) {
				System.out.println("-" + rs.getString("buseo"));
			}
			
			System.out.print("부서명: ");
			String buseo = scan.nextLine();
			
			
			rs.close();
			//stat.close(); //명령문 종료
			//conn.close(); //접속 종료
			//두번째 SQL 쿼리 못날림
			
			//stat = conn.createStatement();//stat.close();했다면 다시 열기
			
			sql = String.format("select name, jikwi, city, basicpay from tblInsa where buseo = '%s'", buseo);
			
			rs = stat.executeQuery(sql);
			
			System.out.println("[이름]\t[직위]\t[지역]\t[급여]");
			
			while (rs.next()) {
				System.out.printf("%s\t%s\t%s\t%,d원\n"
								, rs.getString("name")
								, rs.getString("jikwi")
								, rs.getString("city")
								, rs.getInt("basicpay"));
			}
			
			rs.close();
			stat.close();
			conn.close();
			
			
		} catch (Exception e) {
			System.out.println("Ex04_Select.m4");
			e.printStackTrace();
		}
		
	}

	private static void m3() {
		
		//다중값 반환
		//- N행 N열
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.open("localhost", "server", "java1234");
			stat = conn.createStatement();
			
			String sql = "select name from tblAddress order by name";
			
			rs = stat.executeQuery(sql);
			
			//ResultSet.next가 호출되지 않았음
//			rs.next();
//			System.out.println(rs.getString("name"));//강아지
//			rs.next();
//			System.out.println(rs.getString("name"));
//			rs.next();
//			System.out.println(rs.getString("name"));
//			rs.next();
//			System.out.println(rs.getString("name"));
//			rs.next();
//			System.out.println(rs.getString("name"));
//			//결과 집합을 모두 소모했음
//			rs.next();
//			System.out.println(rs.getString("name"));
			
			
			while (rs.next()) {
				System.out.println(rs.getString("name"));
			}

			
			rs.close();
			stat.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("Ex04_Select.m3");
			e.printStackTrace();
		}
		
	}

	private static void m2() {
		
		//다중값 반환
		//- 1행 N열
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.open("localhost", "server", "java1234");
			stat = conn.createStatement();
			
			String sql = "select * from tblAddress where seq = 5";
			
			rs = stat.executeQuery(sql);
			
			//System.out.println(rs.next());
			if (rs.next()) {
				
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String gender = rs.getString("gender");
				
				System.out.println(name);
				System.out.println(age);
				System.out.println(gender);
				
			} else {
				System.out.println("데이터가 없습니다.");
			}
			
			rs.close();
			stat.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("Ex04_Select.m2");
			e.printStackTrace();
		}
		
		
	}

	private static void m1() {
		
		//단일값 반환
		//- 1행 1열
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.open("localhost", "server", "java1234");
			stat = conn.createStatement();
			
			String sql = "select count(*) as cnt from tblAddress"; 
			
			stat.executeQuery(sql);
			
			rs = stat.executeQuery(sql);
			
			//ResultSet rs == 커서(cursor) > 파일 읽기, Interator, Stream, 향상된 for, 커서
			
			rs.next(); //커서를 다음 레코드로 이동
			
			//현재 커서가 가르키고 있는 레코드의 원하는 컬럼을 가져오기
			//- rs.get자료형(컬럼);
			//String count = rs.getString(1); //컬럼 순서 (first column is 1)
			//String count = rs.getString("cnt"); //컬럼명
			
			int count = rs.getInt("cnt");
			
			
			System.out.println(count);
			
			rs.close();
			stat.close();
			conn.close();
			
			
			
			
		} catch (Exception e) {
			System.out.println("Ex04_Select.m1");
			e.printStackTrace();
		}
		
		
		
	}

}










