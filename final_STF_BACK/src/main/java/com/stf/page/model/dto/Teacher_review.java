package com.stf.page.model.dto;

public class Teacher_review {
	
	private int review_index;
	private int user_index;
	private int teacher_index;
	private String review_title;
	private String review_content;
	private double review_grade;

	public Teacher_review() {
	}

	public Teacher_review(int review_index, int user_index, int teacher_index, String review_title,
			String review_content, double review_grade) {
		this.review_index = review_index;
		this.user_index = user_index;
		this.teacher_index = teacher_index;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_grade = review_grade;
	}

	public int getReview_index() {
		return review_index;
	}

	public void setReview_index(int review_index) {
		this.review_index = review_index;
	}

	public int getUser_index() {
		return user_index;
	}

	public void setUser_index(int user_index) {
		this.user_index = user_index;
	}

	public int getTeacher_index() {
		return teacher_index;
	}

	public void setTeacher_index(int teacher_index) {
		this.teacher_index = teacher_index;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public double getReview_grade() {
		return review_grade;
	}

	public void setReview_grade(double review_grade) {
		this.review_grade = review_grade;
	}

	@Override
	public String toString() {
		return "Teacher_review [review_index=" + review_index + ", user_index=" + user_index + ", teacher_index="
				+ teacher_index + ", review_title=" + review_title + ", review_content=" + review_content
				+ ", review_grade=" + review_grade + "]";
	}
	
	
	
	
}
