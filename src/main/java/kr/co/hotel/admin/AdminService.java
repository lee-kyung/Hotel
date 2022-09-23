package kr.co.hotel.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface AdminService {
	public String admin(Model model);
	public String memberlist(Model model);
	public String roombk(Model model, HttpServletRequest request);

}
