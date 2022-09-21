package kr.co.hotel.wedding;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class WeddingController {
	
	@Autowired
	@Qualifier("ws")
	private WeddingService service;
	
	
	@RequestMapping("/wedding/wedding_check")
	public String wedding_check(Model model) {
		return service.wedding_check(model);
	}
	
	@RequestMapping("/wedding/wed_hall_write")
	public String wed_hall_write() {
		return "/wedding/wed_hall_write";
	}
	
	@RequestMapping("/wedding/wed_hall_write_ok")
	public String wed_hall_write_ok(HttpServletRequest request) throws Exception
	{
		return service.wed_hall_write_ok(request); 
	}
	
	@RequestMapping("/wedding/wedding_hall")
	
	public String wedding_hall(HttpServletRequest request, Model model,WeddingVO wvo)
	{
		return service.wedding_hall(request,model, wvo); 
	}
	
	@RequestMapping("/wedding/wedding_reserve")
	public String wedding_reserve(HttpServletRequest request, Model model) {
		
		return service.wedding_reserve(request, model);
	}
	
	@RequestMapping("/wedding/weddingReserve_ok")
	public String weddingReserve_ok(WeddingResvVO wrvo, HttpSession session)
	{
		return service.weddingReserve_ok(wrvo, session);
	}
	
	@RequestMapping("/wedding/wresv_cal")
	public void wresv_cal(WeddingResvVO wrvo,PrintWriter out, HttpServletRequest request, Model model)
	{
		service.wresv_cal(wrvo, out, request, model);
	}
	
	@RequestMapping("/wedding/wed_resv_check")
	public String wed_resv_check(HttpServletRequest request, HttpSession session)
	{
		return service.wed_resv_check(request, session);
	}
	
	
	
}
