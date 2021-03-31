package com.lec.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.lec.jsp.D;

public class WriteDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	public WriteDAO() {
		
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("WriteDAO 객체 생성 성공, 데이터베이스 연결");
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	// insert 
	public int insert(WriteDTO dto) throws SQLException {
		String wr_subject = dto.getWr_subject();
		String wr_content = dto.getWr_content();
		String wr_name = dto.getWr_name();
		
		return this.insert(wr_subject, wr_content, wr_name);
	}

	private int insert(String wr_subject, String wr_content, String wr_name) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_INSERT);
			pstmt.setString(1, wr_subject);
			pstmt.setString(2, wr_content);
			pstmt.setString(3, wr_name);
			
			cnt = pstmt.executeUpdate();
			
		}finally {
			close();
		}
		
		return cnt;
	}
	
	// DTO 배열로 변환 
	public WriteDTO [] createArray(ResultSet rs) throws SQLException {
		ArrayList<WriteDTO> list = new ArrayList<WriteDTO>();
		
		while(rs.next()) {
			int wr_uid = rs.getInt("wr_uid");
			String wr_subject = rs.getString("wr_subject");
			String wr_name = rs.getString("wr_name");
			String wr_content = rs.getString("wr_content");
			if(wr_content == null) wr_content = "";
			int wr_viewcnt = rs.getInt("wr_viewcnt");
			Date d = rs.getDate("wr_regdate");
			Time t = rs.getTime("wr_regdate");
			String wr_regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " " + new SimpleDateFormat("hh:mm:ss").format(t);
			
			WriteDTO dto = new WriteDTO(wr_uid, wr_subject, wr_content, wr_name, wr_viewcnt, wr_regdate);
			list.add(dto);
			
			
		}
		
		int size = list.size();
		WriteDTO [] arr = new WriteDTO[size];
		list.toArray(arr);
		return arr;
		
	}
	
	// select 
	public WriteDTO [] select() throws SQLException {
		WriteDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		}finally {
			close();
		}
		
		return arr;
	}
	
	// 특정 게시글 select 
	public WriteDTO [] selectByUid(int wr_uid) throws SQLException {
		WriteDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_ID);
			pstmt.setInt(1, wr_uid);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
		}finally {
			close();
		}
		
		return arr;
	}
	
	// 게시글 읽어오기 + 조회수 증가 
	public WriteDTO [] readByUid(int wr_uid) throws SQLException {
		int cnt = 0; 
		WriteDTO [] arr =null;
		
		try {
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(D.SQL_WRITE_INC_VIEWCNT);
			pstmt.setInt(1, wr_uid);
			cnt = pstmt.executeUpdate();
			
			pstmt.close();
			
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_ID);
			pstmt.setInt(1, wr_uid);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
			
			conn.commit();
		}catch (SQLException e) {
			conn.rollback();
			throw e;
		}finally {
			close();
		}
		
		
		return arr;
	}
	
	public int update(int wr_uid, String wr_subject, String wr_content) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_UPDATE);
			pstmt.setString(1, wr_subject);
			pstmt.setString(2, wr_content);
			pstmt.setInt(3, wr_uid);
			
			cnt = pstmt.executeUpdate();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	public int deleteByUid(int wr_uid) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_DELETE_BY_ID);
			pstmt.setInt(1, wr_uid);
			cnt = pstmt.executeUpdate();
			
		}finally {
			close();
		}
		
		return cnt;
	}
	

}


































