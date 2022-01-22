package ipptest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

	// JDBC 드라이버 관련 변수 
	   String driver = "oracle.jdbc.OracleDriver";
	   String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	   String uid = "ipp";
	   String upw = "1234";

	   Connection conn = null;
	   PreparedStatement pstmt= null;
	   
	
	// open
	  public void open() {
		  try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	  }
	  
	
	// insert 
	public int add(Customer customer) {
		open();
		String sql = "insert into custom_01 values(?,?,?,?,?)";
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, customer.getP_id());
			pstmt.setString(2, customer.getP_pw());
			pstmt.setString(3, customer.getC_name());
			pstmt.setString(4, customer.getC_email());
			pstmt.setString(5, customer.getC_tel());
			
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		close();
		return cnt;
		
		
	}
	
	// list 
	public List<Customer> getAll() {
		open();
		List<Customer> datas = new ArrayList<Customer>();
		String sql = "select * from custom_01";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Customer c = new Customer();
				c.setP_id(rs.getString("p_id"));
				c.setP_pw(rs.getString("p_pw"));
				c.setC_name(rs.getString("c_name"));
				c.setC_email(rs.getString("c_email"));
				c.setC_tel(rs.getString("c_tel"));
				datas.add(c);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		close();
		return datas;
	
	}
	
	// close
		  public void close() {
			  try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			  
		  }
	
}



























