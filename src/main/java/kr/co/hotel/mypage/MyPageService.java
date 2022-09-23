package kr.co.hotel.mypage;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel.member.MemberVO;
import kr.co.hotel.wedding.WeddingResvVO;

public interface MyPageService {

	public void myprofile_pwd_ok(HttpSession session, HttpServletRequest request, PrintWriter out);

	public String myprofile(HttpSession session, Model model);

	public String myprofile_edit(Model model, HttpSession session);

	public String myprofile_edit_ok(MemberVO mvo, HttpSession session);

	public String mypwd_change_ok(HttpSession session, HttpServletRequest request);

	public String mypage(Model model, HttpSession session);

	public String wedding_resv(Model model, HttpSession session, HttpServletRequest request, WeddingResvVO wvo);

	public void wedding_resv_search(HttpSession session, HttpServletRequest request, PrintWriter out);

	public String weddingR_state_change(HttpServletRequest request);

}
