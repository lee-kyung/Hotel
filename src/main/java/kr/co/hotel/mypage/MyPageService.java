package kr.co.hotel.mypage;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel.member.MemberVO;

public interface MyPageService {

	public void myprofile_pwd_ok(HttpSession session, HttpServletRequest request, PrintWriter out);

	public String myprofile(HttpSession session, Model model);

	public String myprofile_edit(Model model, HttpSession session);

	public String myprofile_edit_ok(MemberVO mvo, HttpSession session);

	public String mypwd_change_ok(HttpSession session, HttpServletRequest request);

}
