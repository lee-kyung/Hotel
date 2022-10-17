package kr.co.hotel.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.roomresv.RoomResvVO;

@Controller
public class AdminController {
	@Autowired
	@Qualifier("as")
	private AdminService service;
	
	@RequestMapping("/admin/admin")
	public String admin(Model model)
	{
		return service.admin(model);
	}
// member관련
	@RequestMapping("/admin/memberlist")
	public String memberlist(Model model, HttpServletRequest request)
	{
		return service.memberlist(model, request);
	}
	@RequestMapping("/admin/mstatechange")
	public String mstatechange(HttpServletRequest request)
	{
		return service.mstatechange(request);
	}
	@RequestMapping("/admin/meminfo")
	public String meminfo(Model model, HttpServletRequest request)
	{
		return service.meminfo(model, request);
	}

// 관리관련 
	@RequestMapping("/admin/roomlist")
	public String roomlist(Model model, HttpServletRequest request)
	{
		return service.roomlist(model, request);
	}
	
	@RequestMapping("/admin/wedlist")
	public String wedlist(Model model, HttpServletRequest request)
	{
		return service.wedlist(model, request);
	}
	
	@RequestMapping("/admin/dinelist")
	public String dinelist(Model model, HttpServletRequest request)
	{
		return service.dinelist(model, request);
	}
	
	@RequestMapping("/admin/gumaelist")
	public String gumaelist(Model model, HttpServletRequest request)
	{
		return service.gumaelist(model, request);
	}
	
	@RequestMapping("/admin/estatechange")
	public String estatechange(HttpServletRequest request)
	{
		return service.estatechange(request);
	}
	
/*예약건당 상세뷰*/
	@RequestMapping("/admin/roombkview")
	public String roombkview(Model model, HttpServletRequest request)
	{
		return service.roombkview(model,request);
	}
	
	@RequestMapping("/admin/wedbkview")
	public String wedbkview(Model model, HttpServletRequest request)
	{
		return service.wedbkview(model, request);
	}

	@RequestMapping("/admin/dinebkview")
	public String dinebkview(Model model, HttpServletRequest request)
	{
		return service.dinebkview(model, request);
	}
	
	@RequestMapping("/admin/gumaeview")
	public String gumaeview(Model model, HttpServletRequest request)
	{
		return service.gumaeview(model, request);	
	}
	
	
	
}






















