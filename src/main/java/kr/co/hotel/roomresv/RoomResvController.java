package kr.co.hotel.roomresv;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

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
	public String room_resv(RoomVO rvo, Model model)
	{
		return service.room_resv(rvo,model);
	}
	
	@RequestMapping("/room/getRoom")
	public void getRoom(HttpServletRequest reqeust, Model model)
	{
	
	}
	
	@RequestMapping("/room/room_resvnext")
	public String room_resvnext(HttpServletRequest request, Model model)
	{	
		return service.room_resvnext(request, model);
	}
	
	
	

}
