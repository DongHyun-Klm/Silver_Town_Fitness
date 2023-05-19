package com.stf.page.model.dto;

public class Teacher_career {
	
	private int teacher_table_index;
	private int teacher_index;
	private int teacher_career;

	public Teacher_career() {
	}

	public Teacher_career(int teacher_table_index, int teacher_index, int teacher_career) {
		this.teacher_table_index = teacher_table_index;
		this.teacher_index = teacher_index;
		this.teacher_career = teacher_career;
	}

	public int getTeacher_table_index() {
		return teacher_table_index;
	}

	public void setTeacher_table_index(int teacher_table_index) {
		this.teacher_table_index = teacher_table_index;
	}

	public int getTeacher_index() {
		return teacher_index;
	}

	public void setTeacher_index(int teacher_index) {
		this.teacher_index = teacher_index;
	}

	public int getTeacher_career() {
		return teacher_career;
	}

	public void setTeacher_career(int teacher_career) {
		this.teacher_career = teacher_career;
	}

	@Override
	public String toString() {
		return "Teacher_career [teacher_table_index=" + teacher_table_index + ", teacher_index=" + teacher_index
				+ ", teacher_career=" + teacher_career + "]";
	}
	
	
	
	
}
