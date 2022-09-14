package kr.co.hotel.roomresv;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.room.RoomVO;

@Service
@Qualifier("rrs")
public class RoomResvServiceImpl implements RoomResvService {
	@Autowired
	private RoomResvMapper mapper;

	@Override
	public String room_resv(RoomVO rvo, Model model) {
		// System.out.println(rvo.getRcode());

		ArrayList<RoomVO> list=mapper.room_resv();
		model.addAttribute("list",list);
		return "/room/room_resv";
	}
	@Override
	public String room_resvnext(HttpServletRequest request, Model model) {
		String checkin=request.getParameter("checkin");
		String checkout=request.getParameter("checkout");
		String adult=request.getParameter("adult");
		String child=request.getParameter("child");
		String rcode=request.getParameter("rcode");
		 
		RoomVO rvo=mapper.room_resvnext(rcode);
		
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("adult", adult);
		model.addAttribute("child", child);
		model.addAttribute("rvo",rvo);
		
		return "/room/room_resvnext";
	}


	
	
}
