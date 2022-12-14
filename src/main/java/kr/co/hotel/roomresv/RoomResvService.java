package kr.co.hotel.roomresv;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel.room.RoomVO;

public interface RoomResvService {
	public String room_resv(RoomVO rvo, Model model, HttpServletRequest request);
	public String room_resvnext(HttpServletRequest request, Model model, HttpSession session);
	public String room_resv_ok(RoomResvVO rsvo, HttpSession session);
	public void getRoomAvail(HttpServletRequest request, PrintWriter out,RoomVO rvo);
	public String room_bkconfirm(HttpServletRequest request, Model model);

}
