package com.stf.page.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.stf.page.model.dto.Teacher;
import com.stf.page.model.service.InstructorService;

import io.swagger.annotations.Api;

@RestController
@RequestMapping("/api")
@Api(tags = "강사 컨트롤러")
public class InstructorRestController {

	@Autowired
	private InstructorService instructorService;

	// 종목별 강사 조회
	@GetMapping("/instructor/{exercise_index}")
	public ResponseEntity<List<Teacher>> list_all(@PathVariable int exercise_index) {
		List<Teacher> list = instructorService.selectList(exercise_index); 
		if (list == null || list.size() == 0) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
	
}

