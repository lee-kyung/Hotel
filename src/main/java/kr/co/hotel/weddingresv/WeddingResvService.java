package kr.co.hotel.weddingresv;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface WeddingResvService {

	public String wedding_reserve(HttpServletRequest request, Model model, WeddingResvVO wrvo, PrintWriter out);

	public String weddingReserve_ok(HttpServletRequest request, WeddingResvVO wrvo);

	public void getcheck(WeddingResvVO wrvo, HttpServletRequest request, PrintWriter out);

}
