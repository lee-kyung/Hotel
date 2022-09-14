package kr.co.hotel.diningresv;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.hotel.dining.DiningVO;

public interface DiningResvService {
	
	public String dining_reserve(HttpServletRequest request, Model model);

	/*public String getprev(HttpServletRequest request, Model model);*/
	
	public String dining_reserve_next(HttpServletRequest request, Model model);
	
	


}
