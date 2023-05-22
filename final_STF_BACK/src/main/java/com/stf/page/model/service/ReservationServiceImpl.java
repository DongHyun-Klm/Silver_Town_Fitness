package com.stf.page.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stf.page.model.dao.ReservationDao;
import com.stf.page.model.dto.Regist;
import com.stf.page.model.dto.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	ReservationDao Rdao;

	@Override
	public List<Reservation> selectRList(String id) {
		return Rdao.selectRList(id);
	}

	@Override
	public List<Reservation> selectList(String id) {
		return Rdao.selectList(id);
	}
	
	@Override
	public List<Reservation> selectDList(String id) {
		return Rdao.selectDList(id);
	}

	@Override
	public void deleteReservation(int index) {
		Rdao.deleteReservation(index);
	}


	@Override
	public void insertReservation(Regist regist) {
		Rdao.insertReservation(regist);
	}
	
	
}
