package kr.co.hotel.diningresv;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel.dining.DiningVO;
import kr.co.hotel.room.RoomVO;

public interface DiningResvService {
	
	public String dining_reserve(HttpServletRequest request, Model model,HttpSession session);
	
	public void getDTresv(HttpServletRequest request, PrintWriter out);

	/*public String getprev(HttpServletRequest request, Model model);*/
	
	/*public void getDineAvail(HttpServletRequest request, PrintWriter out,DiningVO dvo);*/
	
	public String dining_reserve_next(HttpServletRequest request, Model model, HttpSession session);
	
	//old
	public String dining_reserve_next_old(HttpServletRequest request, Model model);
	//
	public String dining_reserve_ok(DiningResvVO drvo, HttpSession session);

	public String dining_reserve_check(HttpServletRequest request, Model model);
/*
	// 펜션에서 가져옴
	public void getcheck(HttpServletRequest request, Model model);
	public void getEmpty(HttpServletRequest request, DiningVO dvo, Model model);*/




	
	


}
