package com.stf.page.model.dto;

public class Reservation {
	
	private int reservation_index;
	private int user_index;
	private int lecture_index;
	private String lecture_name;
	private String lecture_place;
	private String lecture_time1;
	private String lecture_time2;
	private String teacher_name;

	public Reservation() {
	}

	public Reservation(int reservation_index, int user_index, int lecture_index, String lecture_name,
			String lecture_place, String lecture_time1, String lecture_time2, String teacher_name) {
		this.reservation_index = reservation_index;
		this.user_index = user_index;
		this.lecture_index = lecture_index;
		this.lecture_name = lecture_name;
		this.lecture_place = lecture_place;
		this.lecture_time1 = lecture_time1;
		this.lecture_time2 = lecture_time2;
		this.teacher_name = teacher_name;
	}

	public int getReservation_index() {
		return reservation_index;
	}


	public void setReservation_index(int reservation_index) {
		this.reservation_index = reservation_index;
	}


	public int getUser_index() {
		return user_index;
	}


	public void setUser_index(int user_index) {
		this.user_index = user_index;
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


	public String getLecture_place() {
		return lecture_place;
	}


	public void setLecture_place(String lecture_place) {
		this.lecture_place = lecture_place;
	}


	public String getLecture_time1() {
		return lecture_time1;
	}


	public void setLecture_time1(String lecture_time1) {
		this.lecture_time1 = lecture_time1;
	}


	public String getLecture_time2() {
		return lecture_time2;
	}


	public void setLecture_time2(String lecture_time2) {
		this.lecture_time2 = lecture_time2;
	}
	
	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	@Override
	public String toString() {
		return "Reservation [reservation_index=" + reservation_index + ", user_index=" + user_index + ", lecture_index="
				+ lecture_index + ", lecture_name=" + lecture_name + ", lecture_place=" + lecture_place
				+ ", lecture_time1=" + lecture_time1 + ", lecture_time2=" + lecture_time2 + ", teacher_name="
				+ teacher_name + "]";
	}
	
	

}
