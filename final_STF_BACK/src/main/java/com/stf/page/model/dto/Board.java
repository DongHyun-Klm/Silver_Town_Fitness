package com.stf.page.model.dto;

public class Board {
	
	private int board_index;
	private int user_index;
	private String board_title;
	private String board_content;
	private String board_date;
	private int board_cnt;
	private String board_img;

	public Board() {
	}

	public Board(int board_index, int user_index, String board_title, String board_content, String board_date,
			int board_cnt, String board_img) {
		this.board_index = board_index;
		this.user_index = user_index;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_cnt = board_cnt;
		this.board_img = board_img;
	}

	public int getBoard_index() {
		return board_index;
	}

	public void setBoard_index(int board_index) {
		this.board_index = board_index;
	}

	public int getUser_index() {
		return user_index;
	}

	public void setUser_index(int user_index) {
		this.user_index = user_index;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_date() {
		return board_date;
	}

	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}

	public int getBoard_cnt() {
		return board_cnt;
	}

	public void setBoard_cnt(int board_cnt) {
		this.board_cnt = board_cnt;
	}

	public String getBoard_img() {
		return board_img;
	}

	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}

	@Override
	public String toString() {
		return "Board [board_index=" + board_index + ", user_index=" + user_index + ", board_title=" + board_title
				+ ", board_content=" + board_content + ", board_date=" + board_date + ", board_cnt=" + board_cnt
				+ ", board_img=" + board_img + "]";
	}
	
	
	
	
}
