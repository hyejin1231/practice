package ipptest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

	// JDBC 
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String uid = "ipp";
	String upw = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt= null;
	   
	
	// OPEN 
	public void open() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	// INSERT 
	public int add(Student student) {
		open();
		String sql = "insert into student values(?,?,?,?,?)";
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student.getStudno());
			pstmt.setString(2, student.getName());
			pstmt.setString(3, student.getDept());
			pstmt.setString(4, student.getTel());
			pstmt.setString(5, student.getEmail());
			
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close();
		return cnt;
		
	}
	
	// SELECT 
	public List<Student> listAll() {
		open();
		List<Student> datas = new ArrayList<Student>();
		String sql = "select * from student";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Student s = new Student();
				s.setStudno(rs.getString("studno"));
				s.setName(rs.getString("name"));
				s.setDept(rs.getString("dept"));
				s.setTel(rs.getString("tel"));
				s.setEmail(rs.getString("email"));
				datas.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		close();
		return datas;
	}
	
	// CLOSE 
	public void close() {
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}

























