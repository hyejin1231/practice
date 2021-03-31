package com.lec.beans;

public class WriteDTO {

	private int wr_uid;
	private String wr_subject;
	private String wr_content;
	private String wr_name;
	private int wr_viewcnt;
	private String wr_regdate;
	
	public WriteDTO() {
		super();
	}

	public WriteDTO(int wr_uid, String wr_subject, String wr_content, String wr_name, int wr_viewcnt,
			String wr_regdate) {
		super();
		this.wr_uid = wr_uid;
		this.wr_subject = wr_subject;
		this.wr_content = wr_content;
		this.wr_name = wr_name;
		this.wr_viewcnt = wr_viewcnt;
		this.wr_regdate = wr_regdate;
	}

	public int getWr_Uid() {
		return wr_uid;
	}

	public void setWr_Uid(int wr_uid) {
		this.wr_uid = wr_uid;
	}

	public String getWr_subject() {
		return wr_subject;
	}

	public void setWr_subject(String wr_subject) {
		this.wr_subject = wr_subject;
	}

	public String getWr_content() {
		return wr_content;
	}

	public void setWr_content(String wr_content) {
		this.wr_content = wr_content;
	}

	public String getWr_name() {
		return wr_name;
	}

	public void setWr_name(String wr_name) {
		this.wr_name = wr_name;
	}

	public int getWr_viewcnt() {
		return wr_viewcnt;
	}

	public void setWr_viewcnt(int wr_viewcnt) {
		this.wr_viewcnt = wr_viewcnt;
	}

	public String getWr_regdate() {
		return wr_regdate;
	}

	public void setWr_regdate(String wr_regdate) {
		this.wr_regdate = wr_regdate;
	}
	
	
	
}
