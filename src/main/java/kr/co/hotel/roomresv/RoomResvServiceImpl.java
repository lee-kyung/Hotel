package kr.co.hotel.roomresv;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String room_resv(RoomVO rvo, Model model, HttpServletRequest request) {
		// System.out.println(rvo.getRcode());

		ArrayList<RoomVO> list=mapper.room_resv();
		model.addAttribute("list",list);
		
	/*	String checkin=request.getParameter("checkin");
		String checkout=request.getParameter("checkout");
		String rcode=request.getParameter("rcode");
		
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("rcode",rcode);
		
		//int cnt=mapper.getRoomCnt(checkin,rcode);
		model.addAttribute("cnt",cnt);
		*/

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
		
		String[] imsi=checkin.split("-");
		int y=Integer.parseInt(imsi[0]);
		int m=Integer.parseInt(imsi[1]);
		int d=Integer.parseInt(imsi[2]);

		String[] imsi2=checkout.split("-");
		int y1=Integer.parseInt(imsi2[0]);
		int m1=Integer.parseInt(imsi2[1]);
		int d1=Integer.parseInt(imsi2[2]);
		
		
		// 투숙일 구하기
		LocalDate startD=LocalDate.of(y, m, d); // 체크인 날짜
		LocalDate endD=LocalDate.of(y1, m1, d1); // 체크아웃 날짜
		
		Period period = Period.between(startD, endD);
		int suk=period.getDays();
		
	//	System.out.println("투숙일:"+suk);
		
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("adult", adult);
		model.addAttribute("child", child);
		model.addAttribute("suk", suk);
		model.addAttribute("rvo",rvo);
		
		
		return "/room/room_resvnext";
	}
	
	
	@Override
	public String room_resv_ok(RoomResvVO rsvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		rsvo.setUserid(userid); // rsvo에 userid 가져와서 넣기
		
		// 예약번호 생성 => bk+4자리
		Integer number=mapper.getBid(userid);
		number++;
	//	System.out.println(number);
		String num=number.toString();
		
		if(num.length()==1)
			num="000"+num;
		else if(num.length()==2)
			num="00"+num;
		else if(num.length()==3)
			num="0"+num;	
		
		String bid=userid+'r'+num;
	//	System.out.println(bid);
		rsvo.setBid(bid);
		
		mapper.room_resv_ok(rsvo);
		
		return "redirect:/room/rooms";
	}
	@Override
	public void getRoomAvail(HttpServletRequest request, PrintWriter out, RoomVO rvo) {
		String checkin=request.getParameter("checkin");
		
		ArrayList<RoomVO> list=mapper.getCnt(checkin);

		String str="";		
	
		for(int i=0;i<list.size();i++)
		{
			RoomVO rvo2=list.get(i);
			str=str+rvo2.getRcode()+","+rvo2.getCnt()+",";
		}

		out.print(str);
		//out.print(cnt);
		
	}
	@Override
	public void suUpdate(HttpServletRequest request, PrintWriter out) {
		String rcode=request.getParameter("rcode");
		String checkin=request.getParameter("checkin");
		String checkout=request.getParameter("checkout");
		
		mapper.suUpdate(rcode,checkin,checkout);
		
		out.print("0");
		
	}
	
	
}
