package com.stf.page.model.dto;

public class Notice {
	
	private int notice_index;
	private String notice_title;
	private String notice_content;
	private String notice_date;
	private int notice_cnt;
	private String notice_manager;

	public Notice() {
	}

	public Notice(int notice_index, String notice_title, String notice_content, String notice_date, int notice_cnt,
			String notice_manager) {
		this.notice_index = notice_index;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_cnt = notice_cnt;
		this.notice_manager = notice_manager;
	}

	public int getNotice_index() {
		return notice_index;
	}

	public void setNotice_index(int notice_index) {
		this.notice_index = notice_index;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

	public int getNotice_cnt() {
		return notice_cnt;
	}

	public void setNotice_cnt(int notice_cnt) {
		this.notice_cnt = notice_cnt;
	}

	public String getNotice_manager() {
		return notice_manager;
	}

	public void setNotice_manager(String notice_manager) {
		this.notice_manager = notice_manager;
	}

	@Override
	public String toString() {
		return "Notice [notice_index=" + notice_index + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_date=" + notice_date + ", notice_cnt=" + notice_cnt + ", notice_manager="
				+ notice_manager + "]";
	}
	
	
	
	
	
}
