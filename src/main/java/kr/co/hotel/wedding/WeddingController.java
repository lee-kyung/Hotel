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
	
	@RequestMapping("/wedding/wed_write")
	public String wed_write() {
		return "/wedding/wed_write";
	}
	
	@RequestMapping("/wedding/wed_write_ok")
	public String wed_write_ok(HttpServletRequest request) throws Exception
	{
		return service.wed_write_ok(request); 
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
	public String wed_resv_check(HttpServletRequest request, HttpSession session, Model model)
	{
		return service.wed_resv_check(request, session, model);
	}
	
	@RequestMapping("/wedding/wed_list")
	public String wed_list(Model model)
	{
		return service.wed_list(model);
	}
	
	@RequestMapping("/wedding/wed_content")
	public String wed_content(HttpServletRequest request, Model model)
	{
		return service.wed_content(request, model);
	}
	
	@RequestMapping("/wedding/wed_update")
	public String wed_update(HttpServletRequest request, Model model)
	{
		return service.wed_update(request, model);
	}
	
	@RequestMapping("/wedding/wed_update_ok")
	public String wed_update_ok(HttpServletRequest request, WeddingVO wvo) throws Exception
	{
		return service.wed_update_ok(request, wvo);
	}
	
	@RequestMapping("/wedding/wed_delete")
	public String wed_delete(HttpServletRequest request)
	{
		return service.wed_delete(request);
	}
	
}
