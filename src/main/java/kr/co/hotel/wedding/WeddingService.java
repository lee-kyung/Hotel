package kr.co.hotel.wedding;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface WeddingService {

	public String wed_hall_write_ok(HttpServletRequest request) throws Exception;

	public String wedding_hall(HttpServletRequest request, Model model, WeddingVO wvo);


}
