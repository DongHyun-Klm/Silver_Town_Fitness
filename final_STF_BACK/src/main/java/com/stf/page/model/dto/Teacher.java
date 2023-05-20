package com.stf.page.model.dto;

public class Teacher {
	
	private int teacher_index;
	private String teacher_name;
	private String teacher_sex;
	private int teacher_follower;
	private int exercise_index;
	private String teacher_img;
	private String teacher_career;

	public Teacher() {
	}

	public Teacher(int teacher_index, String teacher_name, String teacher_sex, int teacher_follower, int exercise_index,
			String teacher_img, String teacher_career) {
		super();
		this.teacher_index = teacher_index;
		this.teacher_name = teacher_name;
		this.teacher_sex = teacher_sex;
		this.teacher_follower = teacher_follower;
		this.exercise_index = exercise_index;
		this.teacher_img = teacher_img;
		this.teacher_career = teacher_career;
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

	public int getExercise_index() {
		return exercise_index;
	}

	public void setExercise_index(int exercise_index) {
		this.exercise_index = exercise_index;
	}

	public String getTeacher_img() {
		return teacher_img;
	}

	public void setTeacher_img(String teacher_img) {
		this.teacher_img = teacher_img;
	}

	public String getTeacher_career() {
		return teacher_career;
	}

	public void setTeacher_career(String teacher_career) {
		this.teacher_career = teacher_career;
	}

	@Override
	public String toString() {
		return "Teacher [teacher_index=" + teacher_index + ", teacher_name=" + teacher_name + ", teacher_sex="
				+ teacher_sex + ", teacher_follower=" + teacher_follower + ", exercise_index=" + exercise_index
				+ ", teacher_img=" + teacher_img + ", teacher_career=" + teacher_career + "]";
	}

	

	
}
