package ipptest;

public class Student {

	private String studno;
	private String name;
	private String dept;
	private String tel;
	private String email;
	
	public Student() {
		super();
	}

	public Student(String studno, String name, String dept, String tel, String email) {
		super();
		this.studno = studno;
		this.name = name;
		this.dept = dept;
		this.tel = tel;
		this.email = email;
	}

	public String getStudno() {
		return studno;
	}

	public void setStudno(String studno) {
		this.studno = studno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
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
	
	
}
