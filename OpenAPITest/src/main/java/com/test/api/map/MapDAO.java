package com.test.api.map;

import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.test.util.DBUtil;

public class MapDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MapDAO() {
		this.conn = DBUtil.open();
	}

	public ArrayList<MapDTO> list() {
		
		try {
			
			String sql = "select * from tblMarker";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<MapDTO> list = new ArrayList<MapDTO>();
			
			while (rs.next()) {
				//레코드 1줄 > DTO 1개
				MapDTO dto = new MapDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				list.add(dto);
			}
			
			return list;
			
			
		} catch (Exception e) {
			System.out.println("MapDAO.list");
			e.printStackTrace();
		}
		
		
		return null;
	}
	
}
