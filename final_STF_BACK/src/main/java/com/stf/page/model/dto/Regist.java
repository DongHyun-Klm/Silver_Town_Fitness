package com.stf.page.model.dto;

public class Regist {
	
	private int reservation_index;
	private String user_id;
	private int lecture_index;

	public Regist() {
	}

	public Regist(int reservation_index, String user_id, int lecture_index) {
		this.reservation_index = reservation_index;
		this.user_id = user_id;
		this.lecture_index = lecture_index;
	}

	public int getReservation_index() {
		return reservation_index;
	}

	public void setReservation_index(int reservation_index) {
		this.reservation_index = reservation_index;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getLecture_index() {
		return lecture_index;
	}

	public void setLecture_index(int lecture_index) {
		this.lecture_index = lecture_index;
	}

	@Override
	public String toString() {
		return "regist [reservation_index=" + reservation_index + ", user_id=" + user_id + ", lecture_index="
				+ lecture_index + "]";
	}

	
}