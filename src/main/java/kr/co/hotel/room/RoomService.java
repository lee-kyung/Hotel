package kr.co.hotel.room;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface RoomService {
	public String room_write(Model model);
	public void getbunho(HttpServletRequest request, PrintWriter out);
	public String room_write_ok(HttpServletRequest request);
	public String rooms(Model model,HttpServletRequest request);
	public String room_content(Model model,HttpServletRequest request);
	public String room_resv(HttpServletRequest request, Model model);
	
	
}
