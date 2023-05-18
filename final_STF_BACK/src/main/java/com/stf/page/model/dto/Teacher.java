package com.stf.page.model.dto;

public class Teacher {
	
	private int teacher_index;
	private String teacher_name;
	private String teacher_sex;
	private int teacher_follower;
	private String teacher_exercise;
	private String teacher_img;

	public Teacher() {
		// TODO Auto-generated constructor stub
	}

	public Teacher(int teacher_index, String teacher_name, String teacher_sex, int teacher_follower,
			String teacher_exercise, String teacher_img) {
		super();
		this.teacher_index = teacher_index;
		this.teacher_name = teacher_name;
		this.teacher_sex = teacher_sex;
		this.teacher_follower = teacher_follower;
		this.teacher_exercise = teacher_exercise;
		this.teacher_img = teacher_img;
	}

	public int getTeacher_index() {
		return teacher_index;
	}

	public void setTeacher_index(int teacher_index) {
		this.teacher_index = teacher_index;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getTeacher_sex() {
		return teacher_sex;
	}

	public void setTeacher_sex(String teacher_sex) {
		this.teacher_sex = teacher_sex;
	}

	public int getTeacher_follower() {
		return teacher_follower;
	}

	public void setTeacher_follower(int teacher_follower) {
		this.teacher_follower = teacher_follower;
	}

	public String getTeacher_exercise() {
		return teacher_exercise;
	}

	public void setTeacher_exercise(String teacher_exercise) {
		this.teacher_exercise = teacher_exercise;
	}

	public String getTeacher_img() {
		return teacher_img;
	}

	public void setTeacher_img(String teacher_img) {
		this.teacher_img = teacher_img;
	}

	@Override
	public String toString() {
		return "Teacher [teacher_index=" + teacher_index + ", teacher_name=" + teacher_name + ", teacher_sex="
				+ teacher_sex + ", teacher_follower=" + teacher_follower + ", teacher_exercise=" + teacher_exercise
				+ ", teacher_img=" + teacher_img + "]";
	}
	
	
	
	
}
