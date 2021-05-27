package jspbook.ch07;

public class AddBean {
	
	private String username;
	private String tel;
	private String email;
	private String gender;
	public AddBean() {
		super();
	}
	public AddBean(String username, String tel, String email, String gender) {
		super();
		this.username = username;
		this.tel = tel;
		this.email = email;
		this.gender = gender;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
}
