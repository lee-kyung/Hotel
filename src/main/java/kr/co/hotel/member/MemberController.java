package kr.co.hotel.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.format.Printer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@Qualifier("ms")
	@Autowired
	
	private MemberService service;
	
	@RequestMapping("/member/member_input")
	public String member_input()
	{
		return "/member/member_input";
	}
	
	@RequestMapping("/member/member_input_ok")
	public String member_input_ok(MemberVO mvo, HttpServletRequest request)
	{
		return service.member_input_ok(mvo, request);
	}
	
	@RequestMapping("/member/userid_check")
	public void userid_check(HttpServletRequest request, PrintWriter out)
	{
		service.userid_check(request, out);
	}
	
	@RequestMapping("/member/mypage")
	public String mypage()
	{
		return "/member/mypage";
	}
	
	@RequestMapping("/member/myprofile_pwd")
	public String myprofile_pwd()
	{
		return "/member/myprofile_pwd";
	}
	
	@RequestMapping("/member/myprofile")
	public String myprofile(HttpSession session, Model model)
	{
		return service.myprorile(session, model);
	}
	
	@RequestMapping("/member/myprofile_pwd_ok")
	public void myprofile_pwd_ok(HttpSession session, HttpServletRequest request, PrintWriter out)
	{
		service.myprofile_pwd_ok(session, request, out);
	}
	
	@RequestMapping("/member/mypwd_change")
	public String mypwd_change()
	{
		return "/member/mypwd_change";
	}
}
