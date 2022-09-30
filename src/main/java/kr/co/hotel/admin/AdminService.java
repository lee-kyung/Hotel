package kr.co.hotel.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.hotel.roomresv.RoomResvVO;

public interface AdminService {
	public String admin(Model model);
// member
	public String memberlist(Model model, HttpServletRequest request);
	public String mstatechange(HttpServletRequest request);
	public String meminfo(Model model, HttpServletRequest request);

// 그 외	
	public String roomlist(Model model, HttpServletRequest request);
	public String wedlist(Model model, HttpServletRequest request);
	public String dinelist(Model model, HttpServletRequest request);
	public String gumaelist(Model model, HttpServletRequest request);
	public String estatechange(HttpServletRequest request);
	public String roombkview(Model model, HttpServletRequest request);
	public String wedbkview(Model model, HttpServletRequest request);
	public String dinebkview(Model model, HttpServletRequest request);
	public String gumaeview(Model model, HttpServletRequest request);

}
