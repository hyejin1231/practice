package com.lec.jsp;

public class D {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "root";
	public static final String USERPW = "1234";
	
	// 게시글 관련 쿼리문
	public static final String SQL_WRITE_INSERT = 
			"INSERT INTO test_write"
					+ "(wr_subject, wr_content, wr_name) "
					+ "VALUES"
					+ "(?, ?, ?)";
	
	public static final String SQL_WRITE_SELECT = 
			"SELECT * FROM test_write ORDER BY wr_uid DESC";
	
	public static final String SQL_WRITE_SELECT_BY_ID = 
			"SELECT * FROM test_write WHERE wr_uid=?";
	
	public static final String SQL_WRITE_INC_VIEWCNT = 
			"UPDATE test_write SET wr_viewcnt = wr_viewcnt + 1 WHERE wr_uid = ?";
	
	public static final String SQL_WRITE_DELETE_BY_ID = 
			"DELETE FROM test_write WHERE wr_uid = ?";

	public static final String SQL_WRITE_UPDATE =
			"UPDATE test_write SET wr_subject = ?, wr_content = ? WHERE wr_uid = ?";

}
