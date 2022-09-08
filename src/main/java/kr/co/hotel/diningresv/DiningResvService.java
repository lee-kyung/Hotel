package kr.co.hotel.diningresv;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface DiningResvService {
	
	public String dining_reserve(HttpServletRequest request, Model model, DiningResvVO drvo);


}
