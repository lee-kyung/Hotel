package kr.co.hotel.dining;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface DiningService {

	public String dining_write(Model model);
	public String dining_write_ok(HttpServletRequest request)  throws Exception;
	public String dining_list(Model model);
	/*public String dining_content(HttpServletRequest request, Model model);*/
	public String dining_update(HttpServletRequest request, Model model);
	public String dining_update_ok(DiningVO dvo, HttpServletRequest request);
	public String dining_delete(HttpServletRequest request);	
}
