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

	public String wedding_resv(Model model, HttpSession session, HttpServletRequest request);

	public void wedding_resv_search(HttpSession session, HttpServletRequest request, PrintWriter out);

	public String weddingR_state_change(HttpServletRequest request);

	public String dine_resv(Model model, HttpSession session, HttpServletRequest request);

	public void dine_resv_search(HttpSession session, HttpServletRequest request, PrintWriter out);

	public String dineR_state_change(HttpServletRequest request);

	public String eshop_gumae(Model model, HttpSession session, HttpServletRequest request);

	public void eshop_gumae_search(HttpSession session, HttpServletRequest request, PrintWriter out);

	public String eshopG_state_change(HttpServletRequest request);

	public String room_resv(Model model, HttpSession session, HttpServletRequest request);

	public void room_resv_search(HttpSession session, HttpServletRequest request, PrintWriter out);

	public String roomR_state_change(HttpServletRequest request);

	public String wedding_content(HttpServletRequest request, Model model, HttpSession session);

	public String room_content(HttpServletRequest request, Model model, HttpSession session);

	public String dine_content(HttpServletRequest request, Model model, HttpSession session);

	public String eshop_content(HttpServletRequest request, Model model, HttpSession session);


}
