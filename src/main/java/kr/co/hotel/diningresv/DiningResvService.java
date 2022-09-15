package kr.co.hotel.diningresv;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel.dining.DiningVO;

public interface DiningResvService {
	
	public String dining_reserve(HttpServletRequest request, Model model);

	/*public String getprev(HttpServletRequest request, Model model);*/
	
	public String dining_reserve_next(HttpServletRequest request, Model model);

	public String dining_reserve_ok(HttpServletRequest request, HttpSession session);

	String dining_reserve_ok(HttpServletRequest request, HttpSession session, DiningResvVO drvo);
	
	


}
