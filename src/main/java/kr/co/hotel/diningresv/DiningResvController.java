package kr.co.hotel.diningresv;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String dining_reserve(HttpServletRequest request, Model model)
	{
		return service.dining_reserve(request, model);
	}

    @RequestMapping("/dining/dining_reserve_next")
    public String dining_reserve_next(HttpServletRequest request, Model model)
    {
    	return service.dining_reserve_next(request,model);
    }
    @RequestMapping("/dining/dining_reserve_ok")
    public String dining_reserve_ok(DiningResvVO drvo)
    {
    	return service.dining_reserve_ok(drvo);
    }



}
