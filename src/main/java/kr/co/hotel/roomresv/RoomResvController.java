package kr.co.hotel.roomresv;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.room.RoomVO;

@Controller
public class RoomResvController {
	@Autowired
	@Qualifier("rrs")
	private RoomResvService service;
	
	@RequestMapping("/room/room_resv")
	public String room_resv(RoomVO rvo, Model model, HttpServletRequest request)
	{
		return service.room_resv(rvo, model, request);
	}
	
	@RequestMapping("/room/room_resvnext")
	public String room_resvnext(HttpServletRequest request, Model model)
	{	
		return service.room_resvnext(request, model);
	}
	
	@RequestMapping("/room/room_resv_ok")
	public String room_resv_ok(RoomResvVO rsvo, HttpSession session)
	{
		return service.room_resv_ok(rsvo, session);
	}
	
	@RequestMapping("/room/getRoomAvail")
	public void getRoomAvail(HttpServletRequest request, PrintWriter out, RoomVO rvo)
	{
		service.getRoomAvail(request,out,rvo);
	}

	@RequestMapping("/room/suUpdate")
	public void suUpdate(HttpServletRequest request, PrintWriter out)
	{
		service.suUpdate(request,out);
	}

	
	
}
