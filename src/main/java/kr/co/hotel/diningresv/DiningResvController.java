package kr.co.hotel.diningresv;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiningResvController {
	
	@Autowired
	@Qualifier("drs")
	private DiningResvService service;
	
	@RequestMapping("/dining/dining_reserve")
	public String reserve(HttpServletRequest request)
	{
		return service.dining_reserve(request);
	}
	@RequestMapping("/dining/getCalendar")
	public String getCalendar(HttpServletRequest request)
	{
		return service.getCalendar(request);
	}

}
