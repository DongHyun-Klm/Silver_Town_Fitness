package com.stf.page.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stf.page.model.dao.ReviewDao;
import com.stf.page.model.dto.Teacher_review;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reviewDao;
	
	
	public List<Teacher_review> selectList(int excercise_index){
		return reviewDao.selectList(excercise_index);
	}
	
	// 강사 리뷰 작성
	public void insertBoard(Teacher_review review) {
		reviewDao.insertBoard(review);
	}
	

}
