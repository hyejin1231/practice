package jspbook.ch07;

public class LoginBean {

	private String userid;
	private String passwd;
	
	final String _userid="myuser";
	final String _passwd ="1234";
	
	public boolean checkUser() {
		if(userid.equals(_userid) && passwd.equals(_passwd)) {
			return true;
		} else {
			return false;
		}
	}

	public LoginBean() {
		super();
	}

	public LoginBean(String userid, String passwd) {
		super();
		this.userid = userid;
		this.passwd = passwd;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	
	
	
}
