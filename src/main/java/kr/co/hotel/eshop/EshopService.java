package kr.co.hotel.eshop;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface EshopService {
	public String pro_write(Model model);
	public void getso(HttpServletRequest request, PrintWriter out);
	public void getpcode(HttpServletRequest request, PrintWriter out);
	public String pro_write_ok(HttpServletRequest request);
	public String pro_list(HttpServletRequest request, Model model, HttpSession session);
	
	public String pro_content(HttpServletRequest request, Model model, HttpSession session);
	public void wish_add(HttpSession session, HttpServletRequest request, PrintWriter out);
	public void wish_del(HttpSession session, HttpServletRequest request, PrintWriter out);
	public void cart_add(HttpSession session, HttpServletRequest request, PrintWriter out, HttpServletResponse response);
}
