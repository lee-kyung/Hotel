package kr.co.hotel.wedding;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


public interface WeddingService {

	public String wed_hall_write_ok(HttpServletRequest request) throws Exception;

	public String wedding_hall(HttpServletRequest request, Model model, WeddingVO wvo);

	public String wedding_check(Model model, HttpServletRequest request);
	
	public String wedding_reserve(HttpServletRequest request, Model model, WeddingResvVO wrvo, PrintWriter out);

	public String weddingReserve_ok(HttpServletRequest request, WeddingResvVO wrvo);

	public void getcheck(WeddingResvVO wrvo, HttpServletRequest request, Model model);

	public void wresv_cal(WeddingResvVO wrvo,PrintWriter out, HttpServletRequest request, Model model,WeddingResvTimeVO wrtvo);

}
