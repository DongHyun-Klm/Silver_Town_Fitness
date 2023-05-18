package com.stf.page.model.dto;

public class Exercise {
	
	private int exercise_index;
	private String exercise_intro;
	private String exercise_img;
	private String exercise_force;

	public Exercise() {
		// TODO Auto-generated constructor stub
	}

	public Exercise(int exercise_index, String exercise_intro, String exercise_img, String exercise_force) {
		super();
		this.exercise_index = exercise_index;
		this.exercise_intro = exercise_intro;
		this.exercise_img = exercise_img;
		this.exercise_force = exercise_force;
	}

	public int getExercise_index() {
		return exercise_index;
	}

	public void setExercise_index(int exercise_index) {
		this.exercise_index = exercise_index;
	}

	public String getExercise_intro() {
		return exercise_intro;
	}

	public void setExercise_intro(String exercise_intro) {
		this.exercise_intro = exercise_intro;
	}

	public String getExercise_img() {
		return exercise_img;
	}

	public void setExercise_img(String exercise_img) {
		this.exercise_img = exercise_img;
	}

	public String getExercise_force() {
		return exercise_force;
	}

	public void setExercise_force(String exercise_force) {
		this.exercise_force = exercise_force;
	}

	@Override
	public String toString() {
		return "Exercise [exercise_index=" + exercise_index + ", exercise_intro=" + exercise_intro + ", exercise_img="
				+ exercise_img + ", exercise_force=" + exercise_force + "]";
	}
	
	
	
	
}
