package kr.co.hotel.roomresv;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.hotel.room.RoomVO;

public interface RoomResvService {
	public String room_resv(RoomVO rvo, Model model);
	
	public String room_resvnext(HttpServletRequest request, Model model);
	
}
