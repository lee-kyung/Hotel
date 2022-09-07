package kr.co.hotel.weddingresv;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface WeddingResvService {

	public String wedding_reserve(HttpServletRequest request, Model model, WeddingResvVO wrvo);

}
