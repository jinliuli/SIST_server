package com.test.java;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	
	private static Connection conn;
	
	public static Connection open() {
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "server";
		String pw = "java1234";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(url, id, pw);
			conn.setAutoCommit(false); //자동커밋 설정
			
			return conn;
			
		} catch (Exception e) {
			System.out.println("DButil.open");
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	public boolean close() {
		
		try {
			
			if (conn != null) {
				conn.close();
				return conn.isClosed();
				
			}
			
			
		} catch (Exception e) {
			System.out.println("DButil.close");
			e.printStackTrace();
		}
		
		return false; //이상?
		
	}

}
