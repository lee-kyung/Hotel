package kr.co.hotel.login;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.member.MemberVO;

@Controller
public class LoginController {
	@Autowired
	@Qualifier("ls")
	private LoginService service;
	
	@RequestMapping("/login/login")
	public String login(HttpServletRequest request, Model model) {
		return service.login(request, model);
	}
	
	@RequestMapping("/login/login_ok")
	public String login_ok(MemberVO mvo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		return service.login_ok(mvo, session, request, response);
	}
	
	@RequestMapping("/login/logout")
	public String logout(HttpSession session) {
		return service.logout(session);
	}
	
	@RequestMapping("/login/klogin_ok")
	public String klogin_ok(MemberVO mvo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		return service.klogin_ok(mvo, session, request, response);
	}
	
	@RequestMapping("/login/find_IdPw")
	public String find_IdPw()
	{
		return "/login/find_IdPw";
	}
	
	@RequestMapping("/login/userid_search_ok")
	public void userid_search_ok(MemberVO mvo, PrintWriter out)
	{
		service.userid_search_ok(mvo, out);
	}
	
	@RequestMapping("/login/pwd_search_ok")
	public void pwd_search_ok(MemberVO mvo, PrintWriter out)
	{
		service.pwd_search_ok(mvo, out);
	}
}
