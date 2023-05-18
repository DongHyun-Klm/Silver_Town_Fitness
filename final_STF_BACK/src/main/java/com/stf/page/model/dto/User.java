package com.stf.page.model.dto;

public class User {
	
	private int user_index;
	private int user_lecture_cnt;
	private String user_name;
	private String user_img;
	private String user_birth;
	private String user_sex;
	private String user_id;
	private String user_password;
	private String user_nick;
	private String user_number;
	private String user_email;

	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(int user_index, int user_lecture_cnt, String user_name, String user_img, String user_birth,
			String user_sex, String user_id, String user_password, String user_nick, String user_number,
			String user_email) {
		super();
		this.user_index = user_index;
		this.user_lecture_cnt = user_lecture_cnt;
		this.user_name = user_name;
		this.user_img = user_img;
		this.user_birth = user_birth;
		this.user_sex = user_sex;
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_nick = user_nick;
		this.user_number = user_number;
		this.user_email = user_email;
	}

	public int getUser_index() {
		return user_index;
	}

	public void setUser_index(int user_index) {
		this.user_index = user_index;
	}

	public int getUser_lecture_cnt() {
		return user_lecture_cnt;
	}

	public void setUser_lecture_cnt(int user_lecture_cnt) {
		this.user_lecture_cnt = user_lecture_cnt;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getUser_number() {
		return user_number;
	}

	public void setUser_number(String user_number) {
		this.user_number = user_number;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	@Override
	public String toString() {
		return "User [user_index=" + user_index + ", user_lecture_cnt=" + user_lecture_cnt + ", user_name=" + user_name
				+ ", user_img=" + user_img + ", user_birth=" + user_birth + ", user_sex=" + user_sex + ", user_id="
				+ user_id + ", user_password=" + user_password + ", user_nick=" + user_nick + ", user_number="
				+ user_number + ", user_email=" + user_email + "]";
	}
	
	
	
	
	
}
