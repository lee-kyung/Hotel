package kr.co.hotel.wedding;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;


public interface WeddingService {

	public String wed_write_ok(HttpServletRequest request) throws Exception;

	public String wedding_hall(HttpServletRequest request, Model model, WeddingVO wvo);

	public String wedding_check(Model model);
	
	public String wedding_reserve(HttpServletRequest request, Model model);

	public String weddingReserve_ok(WeddingResvVO wrvo, HttpSession session);

	public void wresv_cal(WeddingResvVO wrvo,PrintWriter out, HttpServletRequest request, Model model);

	public String wed_resv_check(HttpServletRequest request, HttpSession session, Model model);

	public String wed_list(Model model);

	public String wed_content(HttpServletRequest request, Model model);

	public String wed_update(HttpServletRequest request, Model model);

	public String wed_update_ok(HttpServletRequest request, WeddingVO wvo) throws Exception;

	public String wed_delete(HttpServletRequest request);

}
