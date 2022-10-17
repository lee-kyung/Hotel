package kr.co.hotel.room;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface RoomService {
	public String room_write(Model model);
	public void getbunho(HttpServletRequest request, PrintWriter out);
	public String room_write_ok(HttpServletRequest request);
	public String rooms(Model model,HttpServletRequest request);
	public String room_content(Model model,HttpServletRequest request);
	public String roomtest(Model model, HttpServletRequest request);
	public String room_list(Model model);
	public String room_update(HttpServletRequest request, Model model);
	public String room_update_ok(RoomVO rvo, HttpServletRequest request) throws Exception;
	public String room_disable(HttpServletRequest request);
	public String room_enable(HttpServletRequest request);
	public String room_delete(HttpServletRequest request);
	

	
}
