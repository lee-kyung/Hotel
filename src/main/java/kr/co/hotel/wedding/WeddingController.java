package kr.co.hotel.wedding;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WeddingController {
	
	@Autowired
	@Qualifier("ws")
	private WeddingService service;
	
	@RequestMapping("/wedding/wedding_hall")
	public String wedding_hall() {
		return "/wedding/wedding_hall";
	}
	
	@RequestMapping("/wedding/wedding_check")
	public String wedding_check() {
		return "/wedding/wedding_check";
	}
	
	@RequestMapping("/wedding/wed_hall_write")
	public String wed_hall_write() {
		return "/wedding/wed_hall_write";
	}
	
	@RequestMapping("/wedding/wed_hall_write_ok")
	public String wed_hall_write_ok(HttpServletRequest request)
	{
		return service.wed_hall_write_ok(request); 
	}
	
	
}
