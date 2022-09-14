package kr.co.hotel.dining;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiningController {
	@Autowired
	@Qualifier("ds")
	private DiningService service;
	
	@RequestMapping("/dining/dining_write")
	public String dining_write(Model model)
	{
		return service.dining_write(model);
	}
	@RequestMapping("/dining/dining_write_ok")
	public String dining_write_ok(HttpServletRequest request)
	{
		return service.dining_write_ok(request);
	}

}
