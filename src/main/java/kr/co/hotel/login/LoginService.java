package kr.co.hotel.login;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel.member.MemberVO;

public interface LoginService {
	public String login(HttpServletRequest request, Model model);
	public String login_ok(MemberVO mvo, HttpSession session, HttpServletRequest request, HttpServletResponse response);
	public String logout(HttpSession session);
	public void userid_search_ok(MemberVO mvo, PrintWriter out);
	public void pwd_search_ok(MemberVO mvo, PrintWriter out);
}
