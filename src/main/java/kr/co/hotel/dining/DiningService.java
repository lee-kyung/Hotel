package kr.co.hotel.dining;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface DiningService {

	public String dining_write(Model model);
	public String dining_write_ok(HttpServletRequest request);
}
