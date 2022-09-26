package kr.co.hotel.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.hotel.roomresv.RoomResvVO;

public interface AdminService {
	public String admin(Model model);
	public String memberlist(Model model);
	public String roomlist(Model model, HttpServletRequest request);
	public String wedlist(Model model, HttpServletRequest request);
	public String dinelist(Model model, HttpServletRequest request);
	public String gumaelist(Model model, HttpServletRequest request);
	public String estatechange(HttpServletRequest request);

}
