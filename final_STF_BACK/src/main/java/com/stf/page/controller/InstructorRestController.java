package com.stf.page.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.stf.page.model.dto.Board;
import com.stf.page.model.dto.Teacher_career;
import com.stf.page.model.service.BoardService;
import com.stf.page.model.service.InstructorService;

import io.swagger.annotations.Api;

@RestController
@RequestMapping("/api")
@Api(tags = "강사 컨트롤러")
public class InstructorRestController {

	private static final String SUCCESS = "succes";
	private static final String FAIL = "fail";

	@Autowired
	private InstructorService instructorService;

	// 종목 강사 조회
	@GetMapping("/instructor/{exercise_index}")
	public ResponseEntity<List<Teacher_career>> list_all(int exercise_index) {
		List<Teacher_career> list = instructorService.selectList(exercise_index); 
		if (list == null || list.size() == 0) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// 강사 이력 조회
	@GetMapping("/lecture")
	public  ResponseEntity<Teacher_career> career_list(int teacher_index) {
		Teacher_career list = instructorService.selectCareer(teacher_index); 
		if (list == null ) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
	
}

