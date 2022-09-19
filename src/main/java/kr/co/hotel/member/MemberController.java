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
}
