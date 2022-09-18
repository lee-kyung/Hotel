package kr.co.hotel.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hotel.member.MemberVO;

public interface LoginService {
	public String login_ok(MemberVO mvo, HttpSession session, HttpServletRequest request, HttpServletResponse response);
	public String logout(HttpSession session);
}
