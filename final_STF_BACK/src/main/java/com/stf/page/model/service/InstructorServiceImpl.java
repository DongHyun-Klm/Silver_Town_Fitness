package com.stf.page.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stf.page.model.dao.InstructorDao;
import com.stf.page.model.dto.Teacher_career;

@Service
public class InstructorServiceImpl implements InstructorService{

	@Autowired
	private InstructorDao instructorDao;
	
	// 종목 강사 조회
	public List<Teacher_career> selectList(String exercise){
		return instructorDao.selectList(exercise); 
	}
	z
	// 강사 이력 조회
	public Teacher_career selectCareer(String exercise) {
		return instructorDao.selectCareer(exercise);
	}
	

}
