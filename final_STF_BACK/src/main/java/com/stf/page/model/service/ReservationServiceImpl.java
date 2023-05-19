package com.stf.page.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stf.page.model.dao.ReservationDao;
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
	public List<Reservation> selectDList(String id) {
		return Rdao.selectDList(id);
	}

	@Override
	public void insertReservation(Reservation reservation) {
		Rdao.insertReservation(reservation);
	}

	@Override
	public void deleteReservation(int index) {
		Rdao.deleteReservation(index);
	}

}
