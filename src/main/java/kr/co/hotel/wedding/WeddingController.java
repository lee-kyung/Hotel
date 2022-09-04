package kr.co.hotel.wedding;

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
	
	
}
