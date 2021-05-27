package jspbook.ch07;

public class AddPd {
	
	//pdname, pdcode, pdcom
	private String pdname;
	private String pdcode;
	private String pdcom;
	public AddPd() {
		super();
	}
	public AddPd(String pdname, String pdcode, String pdcom) {
		super();
		this.pdname = pdname;
		this.pdcode = pdcode;
		this.pdcom = pdcom;
	}
	public String getPdname() {
		return pdname;
	}
	public void setPdname(String pdname) {
		this.pdname = pdname;
	}
	public String getPdcode() {
		return pdcode;
	}
	public void setPdcode(String pdcode) {
		this.pdcode = pdcode;
	}
	public String getPdcom() {
		return pdcom;
	}
	public void setPdcom(String pdcom) {
		this.pdcom = pdcom;
	}
	
	
	
	
}
