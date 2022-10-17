package kr.co.hotel.mypage;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.member.MemberVO;
import kr.co.hotel.wedding.WeddingResvVO;

@Controller
public class MyPageController {

	@Autowired
	@Qualifier("ms2")
	private MyPageService service;
	
	@RequestMapping("/mypage/mypage")
	public String mypage(Model model, HttpSession session)
	{
		return service.mypage(model, session);
	}
	
	@RequestMapping("/mypage/myprofile_pwd")
	public String myprofile_pwd()
	{
		return "/mypage/myprofile_pwd";
	}
	
	@RequestMapping("/mypage/myprofile_pwd_ok")
	public void myprofile_pwd_ok(HttpSession session, HttpServletRequest request, PrintWriter out)
	{
		service.myprofile_pwd_ok(session, request, out);
	}

	@RequestMapping("/mypage/myprofile")
	public String myprofile(HttpSession session, Model model)
	{
		return service.myprofile(session, model);
	}
	
	@RequestMapping("/mypage/myprofile_edit")
	public String myprofile_edit(Model model, HttpSession session)
	{
		return service.myprofile_edit(model, session);
	}
	
	@RequestMapping("/mypage/myprofile_edit_ok")
	public String myprofile_edit_ok(MemberVO mvo, HttpSession session)
	{
		return service.myprofile_edit_ok(mvo, session);
	}
	
	@RequestMapping("/mypage/mypwd_change")
	public String mypwd_change()
	{
		return "/mypage/mypwd_change";
	}
	
	@RequestMapping("/mypage/mypwd_change_ok")
	public String mypwd_change_ok(HttpSession session, HttpServletRequest request)
	{
		return service.mypwd_change_ok(session, request);
	}
	
	@RequestMapping("/mypage/wedding_resv")
	public String wedding_resv(Model model, HttpSession session, HttpServletRequest request)
	{
		return service.wedding_resv(model, session, request);
	}
	
	@RequestMapping("/mypage/wedding_resv_search")
	public void wedding_resv_search(HttpSession session, HttpServletRequest request, PrintWriter out)
	{
		service.wedding_resv_search(session, request, out);
	}
	
	@RequestMapping("/mypage/weddingR_state_change")
	public String weddingR_state_change(HttpServletRequest request)
	{
		return service.weddingR_state_change(request);
	}
	
	@RequestMapping("/mypage/dine_resv")
	public String dine_resv(Model model, HttpSession session, HttpServletRequest request)
	{
		return service.dine_resv(model, session, request);
	}

	@RequestMapping("/mypage/dine_resv_search")
	public void dine_resv_search(HttpSession session, HttpServletRequest request, PrintWriter out)
	{
		service.dine_resv_search(session, request, out);
	}
	
	@RequestMapping("/mypage/dineR_state_change")
	public String dineR_state_change(HttpServletRequest request)
	{
		return service.dineR_state_change(request);
	}
		
	
	@RequestMapping("/mypage/eshop_gumae")
	public String eshop_gumae(Model model, HttpSession session, HttpServletRequest request)
	{
		return service.eshop_gumae(model, session, request);
	}

	@RequestMapping("/mypage/eshop_gumae_search")
	public void eshop_gumae_search(HttpSession session, HttpServletRequest request, PrintWriter out)
	{
		service.eshop_gumae_search(session, request, out);
	}
	
	@RequestMapping("/mypage/eshopG_state_change")
	public String eshopG_state_change(HttpServletRequest request)
	{
		return service.eshopG_state_change(request);
	}
	
	@RequestMapping("/mypage/room_resv")
	public String room_resv(Model model, HttpSession session, HttpServletRequest request)
	{
		return service.room_resv(model, session, request);
	}
	
	@RequestMapping("/mypage/room_resv_search")
	public void room_resv_search(HttpSession session, HttpServletRequest request, PrintWriter out)
	{
		service.room_resv_search(session, request, out);
	}
	
	@RequestMapping("/mypage/roomR_state_change")
	public String roomR_state_change(HttpServletRequest request)
	{
		return service.roomR_state_change(request);
	}
	
	@RequestMapping("/mypage/wedding_content")
	public String wedding_content(HttpServletRequest request, Model model, HttpSession session)
	{
		return service.wedding_content(request, model, session);
	}
	
	@RequestMapping("/mypage/room_content")
	public String room_content(HttpServletRequest request, Model model, HttpSession session)
	{
		return service.room_content(request, model, session);
	}
	
	@RequestMapping("/mypage/dine_content")
	public String dine_content(HttpServletRequest request, Model model, HttpSession session)
	{
		return service.dine_content(request, model, session);
	}
	
	@RequestMapping("/mypage/eshop_content")
	public String eshop_content(HttpServletRequest request, Model model, HttpSession session)
	{
		return service.eshop_content(request, model, session);
	}
	
	@RequestMapping("/mypage/rdwg_check")
	public String rdwg_check(HttpServletRequest request, Model model) {
		return service.rdwg_check(request, model);
	}
	
	@RequestMapping("/mypage/rdwg_info")
	public String rdwg_info(HttpServletRequest request, Model model) {
		return service.rdwg_info(request, model);
	}
	
	@RequestMapping("/mypage/bjcancel")
	public String bjcancel(HttpServletRequest request) {
		return service.bjcancel(request);
	}
}
