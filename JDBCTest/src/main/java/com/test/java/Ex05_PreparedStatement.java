package com.test.java;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Scanner;

public class Ex05_PreparedStatement {
	
	public static void main(String[] args) {
		
		//Ex05_PreparedStatement.java
		
		//PreparedStatement
		//- 매개변수를 지원
		//- Statement > 정적 SQL
		//- PreparedDtatement > 동적 SQL
		
		
		Scanner scan = new Scanner(System.in);

		System.out.print("이름: ");
		String name = scan.nextLine();

		System.out.print("나이: ");
		String age = scan.nextLine();

		System.out.print("성별(m,f): ");
		String gender = scan.nextLine();

		System.out.print("전화번호: ");
		String tel = scan.nextLine();

		System.out.print("주소: ");
		String address = scan.nextLine();
		//address = address.replace("'", "''");
//		주소: 서울시 강남구 역삼동 한독's 빌딩
//		Ex03_Statement.m5
//		java.sql.SQLSyntaxErrorException: ORA-00917: missing comma
		
		
//		String sql = String.format(
//				"insert into tblAddress (seq, name, age, gender, tel, address, regdate)"
//						+ "values (seqAddress.nextVal, '%s', %s, '%s', '%s', '%s', default)", name, age, gender, tel, address);
		
		
		String sql = "insert into tblAddress (seq, name, age, gender, tel, address, regdate) values (seqAddress.nextVal, ?, ?, ?, ?, ?, default)";
		//인덱스에서 누락된 IN 또는 OUT 매개변수:: 1

		Connection conn = null;
		Statement stat = null;
		PreparedStatement pstat = null;

		try {

			conn = DBUtil.open("localhost", "server", "java1234");
			//stat = conn.createStatement();
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, name);
			pstat.setString(2, age);
			//pstat.setInt(2, 20);
			pstat.setString(3, gender);
			pstat.setString(4, tel);
			pstat.setString(5, address);
			//오라클에 들어가면 안되는 문자들을 알아서 처리해줌 !! 뒤에 코드와 같은 처리를 더 안정성있게 해줌 address = address.replace("'", "''");
			
			
			
			//System.out.println(stat.executeUpdate(sql));
			System.out.println(pstat.executeUpdate());
			
			
			//stat.close();
			pstat.close();
			conn.close();
			
			
		} catch (Exception e) {
			System.out.println("Ex03_Statement.m5");
			e.printStackTrace();
		}

	}

}
