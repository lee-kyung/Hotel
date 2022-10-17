package kr.co.hotel.room;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	// 객실 타입관련
	@RequestMapping("/room/rooms")
	public String rooms(Model model,HttpServletRequest request)
	{
		return service.rooms(model,request);
	}
	
	@RequestMapping("/room/room_content")
	public String room_content(Model model,HttpServletRequest request) 
	{
		return service.room_content(model,request);
	}
	
	@RequestMapping("/room/roomtest")
	public String roomtest(Model model,HttpServletRequest request)
	{
		return service.roomtest(model,request);
	}
	
	@RequestMapping("/room/room_list")
	public String room_list(Model model) 
	{
		return service.room_list(model);
	}
	
	@RequestMapping("/room/room_update")
	public String room_update(HttpServletRequest request, Model model)
	{
		return service.room_update(request, model);
	}
	
	@RequestMapping("/room/room_update_ok")
	public String room_update_ok(RoomVO rvo, HttpServletRequest request) throws Exception
	{
		return service.room_update_ok(rvo, request);
	}
	
	@RequestMapping("/room/room_disable")
	public String room_disable(HttpServletRequest request)
	{
		return service.room_disable(request);
	}
	
	@RequestMapping("/room/room_enable")
	public String room_enable(HttpServletRequest request)
	{
		return service.room_enable(request);
	}
	
	@RequestMapping("/room/room_delete")
	public String room_delete(HttpServletRequest request)
	{
		return service.room_delete(request);
	}
	
	
	
	
}