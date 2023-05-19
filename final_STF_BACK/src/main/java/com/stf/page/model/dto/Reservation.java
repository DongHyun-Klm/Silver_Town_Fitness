package com.stf.page.model.dto;

public class Reservation {
	
	private int reservation_index;
	private int user_index;
	private int lecture_index;
	

	public Reservation() {
	}


	public Reservation(int reservation_index, int user_index, int lecture_index) {
		this.reservation_index = reservation_index;
		this.user_index = user_index;
		this.lecture_index = lecture_index;
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


	@Override
	public String toString() {
		return "Reservation [reservation_index=" + reservation_index + ", user_index=" + user_index + ", lecture_index="
				+ lecture_index + "]";
	}
	
	
	
}
