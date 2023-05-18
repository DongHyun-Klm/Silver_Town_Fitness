package com.stf.page.model.dto;

public class Program {
	
	private int lecture_index;
	private String lecture_name;
	private String lecture_start;
	private String lecture_end;
	private String lecture_event_1;
	private String lecture_event_2;
	private int lecture_month;
	private int lecture_max_cnt;
	private int lecture_cnt;
	private String lecture_place;
	private int exercise_index;
	private int teacher_index;
	

	public Program() {
		// TODO Auto-generated constructor stub
	}


	public Program(int lecture_index, String lecture_name, String lecture_start, String lecture_end,
			String lecture_event_1, String lecture_event_2, int lecture_month, int lecture_max_cnt, int lecture_cnt,
			String lecture_place, int exercise_index, int teacher_index) {
		super();
		this.lecture_index = lecture_index;
		this.lecture_name = lecture_name;
		this.lecture_start = lecture_start;
		this.lecture_end = lecture_end;
		this.lecture_event_1 = lecture_event_1;
		this.lecture_event_2 = lecture_event_2;
		this.lecture_month = lecture_month;
		this.lecture_max_cnt = lecture_max_cnt;
		this.lecture_cnt = lecture_cnt;
		this.lecture_place = lecture_place;
		this.exercise_index = exercise_index;
		this.teacher_index = teacher_index;
	}


	public int getLecture_index() {
		return lecture_index;
	}


	public void setLecture_index(int lecture_index) {
		this.lecture_index = lecture_index;
	}


	public String getLecture_name() {
		return lecture_name;
	}


	public void setLecture_name(String lecture_name) {
		this.lecture_name = lecture_name;
	}


	public String getLecture_start() {
		return lecture_start;
	}


	public void setLecture_start(String lecture_start) {
		this.lecture_start = lecture_start;
	}


	public String getLecture_end() {
		return lecture_end;
	}


	public void setLecture_end(String lecture_end) {
		this.lecture_end = lecture_end;
	}


	public String getLecture_event_1() {
		return lecture_event_1;
	}


	public void setLecture_event_1(String lecture_event_1) {
		this.lecture_event_1 = lecture_event_1;
	}


	public String getLecture_event_2() {
		return lecture_event_2;
	}


	public void setLecture_event_2(String lecture_event_2) {
		this.lecture_event_2 = lecture_event_2;
	}


	public int getLecture_month() {
		return lecture_month;
	}


	public void setLecture_month(int lecture_month) {
		this.lecture_month = lecture_month;
	}


	public int getLecture_max_cnt() {
		return lecture_max_cnt;
	}


	public void setLecture_max_cnt(int lecture_max_cnt) {
		this.lecture_max_cnt = lecture_max_cnt;
	}


	public int getLecture_cnt() {
		return lecture_cnt;
	}


	public void setLecture_cnt(int lecture_cnt) {
		this.lecture_cnt = lecture_cnt;
	}


	public String getLecture_place() {
		return lecture_place;
	}


	public void setLecture_place(String lecture_place) {
		this.lecture_place = lecture_place;
	}


	public int getExercise_index() {
		return exercise_index;
	}


	public void setExercise_index(int exercise_index) {
		this.exercise_index = exercise_index;
	}


	public int getTeacher_index() {
		return teacher_index;
	}


	public void setTeacher_index(int teacher_index) {
		this.teacher_index = teacher_index;
	}


	@Override
	public String toString() {
		return "Program [lecture_index=" + lecture_index + ", lecture_name=" + lecture_name + ", lecture_start="
				+ lecture_start + ", lecture_end=" + lecture_end + ", lecture_event_1=" + lecture_event_1
				+ ", lecture_event_2=" + lecture_event_2 + ", lecture_month=" + lecture_month + ", lecture_max_cnt="
				+ lecture_max_cnt + ", lecture_cnt=" + lecture_cnt + ", lecture_place=" + lecture_place
				+ ", exercise_index=" + exercise_index + ", teacher_index=" + teacher_index + "]";
	}
	
	
	
	
}
