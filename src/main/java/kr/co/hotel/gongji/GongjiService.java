package kr.co.hotel.gongji;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface GongjiService {

	public String gongji_write_ok(GongjiVO gvo, HttpServletRequest request);

	public String gongji_list(Model model);

	public String gongji_content(HttpServletRequest request, Model model);

	public String gongji_update(HttpServletRequest request, Model model);

	public String gongji_update_ok(GongjiVO gvo);

	public String gongji_delete(HttpServletRequest request);

}
