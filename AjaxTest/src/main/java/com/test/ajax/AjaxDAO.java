package com.test.ajax;

import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.test.util.DBUtil;

import oracle.net.aso.l;

public class AjaxDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public AjaxDAO() {
		this.conn = DBUtil.open();
	}

	public SurveyDTO getSurvey(int seq) {
		
		try {
			
			String sql = "select * from tblSurvey where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				SurveyDTO dto = new SurveyDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setQuestion(rs.getString("question"));
				dto.setItem1(rs.getString("item1"));
				dto.setItem2(rs.getString("item2"));
				dto.setItem3(rs.getString("item3"));
				dto.setItem4(rs.getString("item4"));
				dto.setCnt1(rs.getInt("cnt1"));
				dto.setCnt2(rs.getInt("cnt2"));
				dto.setCnt3(rs.getInt("cnt3"));
				dto.setCnt4(rs.getInt("cnt4"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.getSurvey");
			e.printStackTrace();
		}
		
		
		return null;
	}

	public String getQuestion() {
		
		try {
			
			String sql = "select question from tblSurvey where seq = 1";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getString("question");
			}
			
			
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.getQuestion");
			e.printStackTrace();
		}
		
		
		return null;
	}

	public int check(String id) {
		
		try {
			
			String sql = "select count(*) as cnt from tblUser where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.check");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public ArrayList<UserDTO> listUser() {
		
		try {
			String sql = "select * from tblUser";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<UserDTO> list = new ArrayList<UserDTO>();
			
			//rs > (복사) > list
			while (rs.next()) {
				
				//레코드 1줄 > UserDTO 1개
				UserDTO dto = new UserDTO();
				
				//한개씩 가져오기
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setLv(rs.getString("lv"));
				
				//list에 담기
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.listUser");
			e.printStackTrace();
		}
		
		return null;
	}

}
