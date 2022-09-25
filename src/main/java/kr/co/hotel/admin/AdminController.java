package kr.co.hotel.admin;

import javax.servlet.http.HttpServletRequest;

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

	@RequestMapping("/admin/memberlist")
	public String memberlist(Model model)
	{
		return service.memberlist(model);
	}
	
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

}






















