package ipptest;

public class Product {

	private String pname;
	private String pcode;
	
	
	public Product() {
		super();
	}
	public Product(String pcode, String pname) {
		super();
		this.pname = pname;
		this.pcode = pcode;
	}
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	
	
}
