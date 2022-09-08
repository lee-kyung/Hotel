package kr.co.hotel.eshop;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface EshopService {
	public String pro_write(Model model);
	public void getso(HttpServletRequest request, PrintWriter out);
	
}
