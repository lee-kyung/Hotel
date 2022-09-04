package kr.co.hotel.weddingresv;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WeddingResvController {

	@Autowired
	@Qualifier("wrs")
	private WeddingResvService service;
	
	@RequestMapping("/wedding/wedding_reserve")
	public String wedding_reserve(HttpServletRequest request) {
		
		return service.wedding_reserve(request);
	}
}
