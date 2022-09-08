package kr.co.hotel.diningresv;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.dining.DiningVO;

@Controller
public class DiningResvController {
	
	@Autowired
	@Qualifier("drs")
	private DiningResvService service;
	
	@RequestMapping("/dining/dining_reserve")
	public String reserve(HttpServletRequest request, Model model, DiningVO dvo, PrintWriter out)
	{
		return service.dining_reserve(request, model, dvo, out);
	}


}
