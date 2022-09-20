package kr.co.hotel.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MemberService {

	public String member_input_ok(MemberVO mvo, HttpServletRequest request);

	public void userid_check(HttpServletRequest request, PrintWriter out);

}
