package kr.co.hotel.room;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoomController {
	@Autowired
	@Qualifier("rs")
	private RoomService service;
	
	@RequestMapping("/room/room_write")
	public String room_write(Model model)
	{
		return service.room_write(model);
	}
	
	@RequestMapping("/room/getbunho")
	public void getbunho(HttpServletRequest request,PrintWriter out) {
		service.getbunho(request, out);
	}

	@RequestMapping("/room/room_write_ok")
	public String room_write_ok(HttpServletRequest request)
	{
		return service.room_write_ok(request);
	}
	
	
	
	
	
	
	
	
	
	
	
}