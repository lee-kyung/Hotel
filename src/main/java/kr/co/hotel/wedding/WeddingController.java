package kr.co.hotel.wedding;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

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
	public String wedding_check(Model model, HttpServletRequest request) {
		return service.wedding_check(model,request);
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
	public String wedding_reserve(HttpServletRequest request, Model model, WeddingResvVO wrvo, PrintWriter out) {
		
		return service.wedding_reserve(request, model, wrvo, out);
	}
	
	@RequestMapping("/wedding/weddingReserve_ok")
	public String weddingReserve_ok(HttpServletRequest request, WeddingResvVO wrvo)
	{
		return service.weddingReserve_ok(request, wrvo);
	}
	
	@RequestMapping("/wedding/getcheck")
	public void getcheck(WeddingResvVO wrvo, HttpServletRequest request, Model model)
	{
		service.getcheck(wrvo, request, model);
	}
	
	@RequestMapping("/wedding/wresv_cal")
	public void wresv_cal(WeddingResvVO wrvo,PrintWriter out, HttpServletRequest request, Model model,WeddingResvTimeVO wrtvo)
	{
		service.wresv_cal(wrvo, out, request,model, wrtvo);
	}
	
	
	
	
}
