package com.stf.page.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.stf.page.model.dto.Exercise;
import com.stf.page.model.dto.Program;
import com.stf.page.model.service.LectureService;

@RestController
@RequestMapping("/api")
public class LectureRestController {

	private static final String SUCCESS = "succes";
	private static final String FAIL = "fail";

	@Autowired
	private LectureService lectureService;

	@GetMapping("/lecture/{exercise}")
	public ResponseEntity<Exercise> list_info(@PathVariable int exercise){
		Exercise exercise1 = lectureService.selectExercise(exercise);
		if(exercise1 == null) return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		return new ResponseEntity<Exercise>(exercise1, HttpStatus.OK);
	}
	
	@GetMapping("/lecture/list/{exercise}")
	public ResponseEntity<List<Program>> list_lecture(@PathVariable int exercise){
		List<Program> list = lectureService.exerciseList(exercise);
		if(list == null || list.size() == 0) return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		return new ResponseEntity<List<Program>>(list, HttpStatus.OK);
	}
	

}
