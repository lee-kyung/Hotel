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
	
	@RequestMapping("/mypage/room_resv")
	public String room_resv()
	{
		return "/mypage/room_resv";
	}
	
	@RequestMapping("/mypage/dine_resv")
	public String dine_resv()
	{
		return "/mypage/dine_resv";
	}
	
	@RequestMapping("/mypage/eshop_resv")
	public String eshop_resv()
	{
		return "/mypage/eshop_resv";
	}
	
	@RequestMapping("/mypage/wedding_resv")
	public String wedding_resv(Model model, HttpSession session, HttpServletRequest request, WeddingResvVO wvo)
	{
		return service.wedding_resv(model, session, request, wvo);
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
	
}
