package kr.co.hotel.eshop;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface EshopService {
	public String pro_write(Model model);
	public void getso(HttpServletRequest request, PrintWriter out);
	public void getpcode(HttpServletRequest request, PrintWriter out);
	public String pro_write_ok(HttpServletRequest request);
	public String pro_list(HttpServletRequest request, Model model);
	
	public String pro_content(HttpServletRequest request, Model model);
}
