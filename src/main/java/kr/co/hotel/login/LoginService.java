package kr.co.hotel.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.hotel.member.MemberVO;

public interface LoginService {
	public String login_ok(MemberVO mvo, HttpSession session);
	public String logout(HttpSession session);
}
