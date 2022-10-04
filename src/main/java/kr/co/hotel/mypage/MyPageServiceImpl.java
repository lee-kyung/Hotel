package kr.co.hotel.mypage;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.transform.ErrorListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.diningresv.DiningResvVO;
import kr.co.hotel.eshop.GumaeVO;
import kr.co.hotel.member.MemberVO;
import kr.co.hotel.roomresv.RoomResvVO;
import kr.co.hotel.wedding.WeddingResvVO;


@Service
@Qualifier("ms2")
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageMapper mapper;
	
	@Override
	public void myprofile_pwd_ok(HttpSession session, HttpServletRequest request, PrintWriter out) 
	{
		String userid=session.getAttribute("userid").toString();
		String pwd=request.getParameter("pwd");
		int cnt=mapper.myprofile_pwd_ok(userid, pwd);		
		out.print(cnt);
	}

	@Override
	public String myprofile(HttpSession session, Model model) 
	{
		String userid=session.getAttribute("userid").toString();
		MemberVO mvo=mapper.myprofile(userid);
		model.addAttribute("mvo", mvo);
		return "/mypage/myprofile";
	}

	@Override
	public String myprofile_edit(Model model, HttpSession session) 
	{
		String userid=session.getAttribute("userid").toString();
		MemberVO mvo=mapper.myprofile(userid);
		model.addAttribute("mvo", mvo);
		
		return "/mypage/myprofile_edit";
	}

	@Override
	public String myprofile_edit_ok(MemberVO mvo, HttpSession session) 
	{
		String userid=session.getAttribute("userid").toString();
		mvo.setUserid(userid);
		mapper.myprofile_edit_ok(mvo);
		return "redirect:/mypage/myprofile";
	}

	@Override
	public String mypwd_change_ok(HttpSession session, HttpServletRequest request) 
	{
		String userid=session.getAttribute("userid").toString();
		String prepwd=request.getParameter("prepwd");
//		String dbpwd=mapper.getPwd(userid);
		String newpwd=request.getParameter("newpwd1");
		
		mapper.mypwd_change_ok(newpwd, userid);
			
		return "redirect:/mypage/mypage";

	}

	@Override
	public String mypage(Model model, HttpSession session) 
	{
		int y;
		LocalDate today=LocalDate.now();
		y=today.getYear();	
		
		int room=mapper.getRoomcount(y);
		int dine=mapper.getDinecount(y);
		int eshop=mapper.getEshopcount(y);
		
		model.addAttribute("room", room);
		model.addAttribute("dine", dine);
		model.addAttribute("eshop", eshop);
		
		
		Date date=Date.valueOf(LocalDate.now());
		mapper.Wstate_complete_change(date);
		mapper.Rstate_complete_change(date);
		mapper.Dstate_complete_change(date);
		
		
		// 최근내역
		String userid=session.getAttribute("userid").toString();
		ArrayList<RoomResvVO> rlist=mapper.roomR_Recent(userid);
		ArrayList<DiningResvVO> dlist=mapper.dineR_Recent(userid);
		ArrayList<WeddingResvVO> wlist=mapper.weddingR_Recent(userid);
		ArrayList<GumaeVO> glist=mapper.eshopG_Recent(userid);
		
		model.addAttribute("rlist", rlist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("wlist", wlist);
		model.addAttribute("glist", glist);
		
		/* [카카오로그인] 회원은 비밀번호 체크X */
		String kid=userid.substring(0, 3);
		if(kid.equals("kid"))
			model.addAttribute("kid", kid);

		return "/mypage/mypage";
	}

	@Override
	public String wedding_resv(Model model, HttpSession session, HttpServletRequest request) 
	{
		String userid=session.getAttribute("userid").toString();

		// 페이지
		int page, start;
		int pcnt;

		if(request.getParameter("pcnt")==null)
			pcnt=10;
		else
			pcnt=Integer.parseInt(request.getParameter("pcnt"));
		
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		start=(page-1)*pcnt;
		
		int pstart, pend;
		
		pstart=page/10;
		
		if(page%10==0)
			pstart--;
		
		pstart=pstart*10+1;
		pend=pstart+9;
		
		int chong=mapper.getWeddingChong(pcnt, userid);
		
		if(chong<pend)
			pend=chong;

		
		ArrayList<WeddingResvVO> wlist=mapper.wedding_resv(userid, start, pcnt);
		
		model.addAttribute("wlist", wlist);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		model.addAttribute("pcnt", pcnt);
		

		return "/mypage/wedding_resv";
	}

	@Override
	public void wedding_resv_search(HttpSession session, HttpServletRequest request, PrintWriter out) 
	{
		String userid=session.getAttribute("userid").toString();
		String cal_in=request.getParameter("cal_in");
		String cal_out=request.getParameter("cal_out");

		
		ArrayList<WeddingResvVO> wlist=mapper.wedding_resv_search(userid, cal_in, cal_out);

		String str="";
		str=str+"<table border='1' id='second_t'>";
		str=str+"<tr><td width=\"190\">"+URLEncoder.encode("예약번호")+"</td><td>"+URLEncoder.encode("상담일")+"</td><td>"+URLEncoder.encode("상담 시간")+"</td><td>"+URLEncoder.encode("예식 희망일")+"</td><td>"+URLEncoder.encode("희망하는 웨딩홀")+"</td><td>"+URLEncoder.encode("예약한 날")+"</td><td width='120px;'>"+URLEncoder.encode("현 상태")+"</td></tr>";
		for(int i=0; i<wlist.size(); i++)
		{
			WeddingResvVO wrvo=wlist.get(i);
			str=str+" <tr><td><a href='wedding_content?wresv_id="+wrvo.getWresv_id()+"'>"+wrvo.getWresv_code()+"</a></td><td>"+wrvo.getWresv_cday()+"</td><td>"+wrvo.getWresv_time()+"</td><td>"+wrvo.getWresv_wday()+"</td><td>"+wrvo.getWresv_hall()+"</td><td>"+wrvo.getWresv_day()+"</td>";
			if(wrvo.getState()==0)
			{
				str=str+"<td>"+URLEncoder.encode("결제완료")+"</td></tr>";				
			}
			else if(wrvo.getState()==1)
			{
				str=str+"<td style='color:red;'>"+URLEncoder.encode("예약취소")+"</td></tr>";				
			}
			else
			{
				str=str+"<td style='color:#887159;'>"+URLEncoder.encode("상담완료")+"</td></tr>";	
			}
			
		}
		str=str+"</table>";
		
		str=str.replace("+", " ");
		
		out.print(str);
	}

	@Override
	public String weddingR_state_change(HttpServletRequest request) 
	{
		String wresv_id=request.getParameter("wresv_id");
		String state=request.getParameter("state");
		mapper.weddingR_state_change(wresv_id, state);
		

		return "redirect:/mypage/wedding_content?wresv_id="+wresv_id;

	}
	
	@Override
	public String dine_resv(Model model, HttpSession session, HttpServletRequest request) 
	{
		
		String userid=session.getAttribute("userid").toString();

		// 페이지
		int page, start;
		int pcnt;

		if(request.getParameter("pcnt")==null)
			pcnt=10;
		else
			pcnt=Integer.parseInt(request.getParameter("pcnt"));
		
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		start=(page-1)*pcnt;
		
		int pstart, pend;
		
		pstart=page/10;
		
		if(page%10==0)
			pstart--;
		
		pstart=pstart*10+1;
		pend=pstart+9;
		
		int chong=mapper.getDineChong(pcnt, userid);
		
		if(chong<pend)
			pend=chong;

		
		ArrayList<DiningResvVO> dlist=mapper.dine_resv(userid, start, pcnt);
		
		model.addAttribute("dlist", dlist);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		model.addAttribute("pcnt", pcnt);
		

		return "/mypage/dine_resv";
	}

	@Override
	public void dine_resv_search(HttpSession session, HttpServletRequest request, PrintWriter out) 
	{
		String userid=session.getAttribute("userid").toString();
		String cal_in=request.getParameter("cal_in");
		String cal_out=request.getParameter("cal_out");

		
		ArrayList<DiningResvVO> dlist=mapper.dine_resv_search(userid, cal_in, cal_out);

		String str="";
		str=str+"<table border='1' id='second_t'>";
		str=str+"<tr><td width=\"190\">"+URLEncoder.encode("예약번호")+"</td><td>"+URLEncoder.encode("식사 날짜")+"</td><td>"+URLEncoder.encode("식사 유형")+"</td><td>"+URLEncoder.encode("식사 시간")+"</td><td width=\"300px\">"+URLEncoder.encode("예약 인원")+"</td><td>"+URLEncoder.encode("총 금액")+"</td><td>"+URLEncoder.encode("예약한 날")+"</td><td width='120px;'>"+URLEncoder.encode("현 상태")+"</td></tr>";
		for(int i=0; i<dlist.size(); i++)
		{
			DiningResvVO dvo=dlist.get(i);
			str=str+" <tr><td><a href='dine_content?dr_id="+dvo.getDr_id()+"'>"+dvo.getBid()+"</a></td><td>"+dvo.getDr_date()+"</td><td>"+dvo.getDine_type()+"</td><td>"+dvo.getDr_time()+"</td>";
			
			str=str+"<td>"+URLEncoder.encode("성인 ")+dvo.getAdult()+URLEncoder.encode("인,")+URLEncoder.encode("어린이 ")+dvo.getChild()+URLEncoder.encode("인, ")+URLEncoder.encode("유아 ")+dvo.getBaby()+URLEncoder.encode("인")+"</td>";
			
			/*
			   if(dvo.getAdult()!="0" && dvo.getChild()=="0" && dvo.getBaby()=="0")
				{
					str=str+"<td>"+URLEncoder.encode("성인 ")+dvo.getAdult()+URLEncoder.encode("인")+"</td>";
				}
				else if(dvo.getAdult()!="0" && dvo.getChild()!="0" && dvo.getBaby()=="0")
				{
					str=str+"<td>"+URLEncoder.encode("성인 ")+dvo.getAdult()+URLEncoder.encode("인")+URLEncoder.encode("어린이 ")+dvo.getChild()+URLEncoder.encode("인")+"</td>";
				}
				else if(dvo.getAdult()!="0" && dvo.getChild()=="0" && dvo.getBaby()!="0")
				{
					str=str+"<td>"+URLEncoder.encode("성인 ")+dvo.getAdult()+URLEncoder.encode("인")+URLEncoder.encode("유아 ")+dvo.getBaby()+URLEncoder.encode("인")+"</td>";
				}
				else
				{
					str=str+"<td>"+URLEncoder.encode("성인 ")+dvo.getAdult()+URLEncoder.encode("인")+"%20"+URLEncoder.encode("어린이 ")+dvo.getChild()+URLEncoder.encode("인")+"%20%20"+URLEncoder.encode("유아 ")+dvo.getBaby()+URLEncoder.encode("인")+"</td>";
				}
			*/
			
			str=str+"</td><td>"+dvo.getDr_total()+URLEncoder.encode("원")+"</td><td>"+dvo.getWriteday()+"</td>";
			
			if(dvo.getDr_state()==0)
			{
				str=str+"<td >"+URLEncoder.encode("예약완료")+"</td></tr>";				
			}
			else if(dvo.getDr_state()==1)
			{
				str=str+"<td style='color:#887159;'>"+URLEncoder.encode("사용완료")+"</td></tr>";				
			}
			else
			{
				str=str+"<td style='color:red;'>"+URLEncoder.encode("취소완료")+"</td></tr>";	
			}
			
		}
		str=str+"</table>";
		
		str=str.replace("+", " ");
		str=str.replace("%2C", ", ");
		
		out.print(str);
	}
	
	@Override
	public String dineR_state_change(HttpServletRequest request) 
	{
		String dr_id=request.getParameter("dr_id");
		String dr_state=request.getParameter("dr_state");
		mapper.dineR_state_change(dr_id, dr_state);
		
	
		return "redirect:/mypage/dine_content?dr_id="+dr_id;

	}

	@Override
	public String eshop_gumae(Model model, HttpSession session, HttpServletRequest request) 
	{
		String userid=session.getAttribute("userid").toString();

		// 페이지
		int page, start;
		int pcnt;

		if(request.getParameter("pcnt")==null)
			pcnt=10;
		else
			pcnt=Integer.parseInt(request.getParameter("pcnt"));
		
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		start=(page-1)*pcnt;
		
		int pstart, pend;
		
		pstart=page/10;
		
		if(page%10==0)
			pstart--;
		
		pstart=pstart*10+1;
		pend=pstart+9;
		
		int chong=mapper.getEshopGChong(pcnt, userid);
		
		if(chong<pend)
			pend=chong;
		
		ArrayList<GumaeVO> glist=mapper.eshop_gumae(userid, start, pcnt);
		
		model.addAttribute("glist", glist);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		model.addAttribute("pcnt", pcnt);
		
		return "/mypage/eshop_gumae";
	}

	@Override
	public void eshop_gumae_search(HttpSession session, HttpServletRequest request, PrintWriter out) 
	{
		String userid=session.getAttribute("userid").toString();
		String cal_in=request.getParameter("cal_in");
		String cal_out=request.getParameter("cal_out");

		
		ArrayList<GumaeVO> glist=mapper.eshop_gumae_search(userid, cal_in, cal_out);

		String str="";
		str=str+"<table border='1' id='second_t'>";
		str=str+"<tr><td width=\"190px;\">"+URLEncoder.encode("주문번호")+"</td><td>"+URLEncoder.encode("상품명")+"</td><td width=\"100px;\">"+URLEncoder.encode("추가상품")+"</td><td width=\"150px;\">"+URLEncoder.encode("총 결제금액")+"</td><td width=\"150px\">"+URLEncoder.encode("구매한 날 ")+"</td><td width='120px;'>"+URLEncoder.encode("현 상태")+"</td></tr>";
		for(int i=0; i<glist.size(); i++)
		{
			GumaeVO gvo=glist.get(i);
			str=str+" <tr><td><a href='eshop_content?id="+gvo.getId()+"&jumuncode="+gvo.getJumuncode()+"'>"+gvo.getJumuncode()+"</a></td><td>"+URLEncoder.encode(gvo.getTitle())+"</td><td>"+URLEncoder.encode("외 ")+(gvo.getCnt()-1)+URLEncoder.encode("개")+"</td><td>"+gvo.getTotal_price()+URLEncoder.encode("원")+"</td><td>"+gvo.getBuyday()+"</td>";
			
			if(gvo.getState()==0)
			{
				str=str+"<td>"+URLEncoder.encode("결제완료")+"</td></tr>";				
			}
			else if(gvo.getState()==1)
			{
				str=str+"<td>"+URLEncoder.encode("취소진행중")+"</td></tr>";				
			}
			else if(gvo.getState()==2)
			{
				str=str+"<td style='color:red;'>"+URLEncoder.encode("취소완료")+"</td></tr>";	
			}
			else if(gvo.getState()==3 && gvo.getBname() !=null)
			{
				str=str+"<td style='color:#887159;'>"+URLEncoder.encode("배송완료")+"</td></tr>";	
			}
			else
			{
				str=str+"<td style='color:#887159;'>"+URLEncoder.encode("사용완료")+"</td></tr>";	
			}
		}
		str=str+"</table>";
		
		str=str.replace("+", " ");
		str=str.replace("%2C ", ", ");
		
		out.print(str);
		
	}

	@Override
	public String eshopG_state_change(HttpServletRequest request) 
	{
		String jumuncode=request.getParameter("jumuncode");
		String state=request.getParameter("state");
		String id=request.getParameter("id");
		mapper.eshopG_state_change(jumuncode, state);
		
		return "redirect:/mypage/eshop_content?id="+id+"&jumuncode="+jumuncode;

		
	}

	@Override
	public String room_resv(Model model, HttpSession session, HttpServletRequest request) 
	{
		String userid=session.getAttribute("userid").toString();

		// 페이지
		int page, start;
		int pcnt;

		if(request.getParameter("pcnt")==null)
			pcnt=10;
		else
			pcnt=Integer.parseInt(request.getParameter("pcnt"));
		
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		start=(page-1)*pcnt;
		
		int pstart, pend;
		
		pstart=page/10;
		
		if(page%10==0)
			pstart--;
		
		pstart=pstart*10+1;
		pend=pstart+9;
		
		int chong=mapper.getroomChong(pcnt, userid);
		
		if(chong<pend)
			pend=chong;

		
		ArrayList<RoomResvVO> rlist=mapper.room_resv(userid, start, pcnt);
		
		model.addAttribute("rlist", rlist);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		model.addAttribute("pcnt", pcnt);
		

		return "/mypage/room_resv";
	}

	@Override
	public void room_resv_search(HttpSession session, HttpServletRequest request, PrintWriter out) 
	{
		String userid=session.getAttribute("userid").toString();
		String cal_in=request.getParameter("cal_in");
		String cal_out=request.getParameter("cal_out");
	
		ArrayList<RoomResvVO> rlist=mapper.room_resv_search(userid, cal_in, cal_out);

		String str="";
		str=str+"<table border='1' id='second_t'>";
		str=str+"<tr><td width=\"190px;\">"+URLEncoder.encode("예약번호")+"</td><td>"+URLEncoder.encode("객실명")+"</td><td>"+URLEncoder.encode("체크인")+"</td><td>"+URLEncoder.encode("체크아웃")+"</td><td>"+URLEncoder.encode("예약인원")+"</td><td>"+URLEncoder.encode("총 결제금액")+"</td><td>"+URLEncoder.encode("예약한 날")+"</td><td width='120px;'>"+URLEncoder.encode("현 상태")+"</td></tr>";
		for(int i=0; i<rlist.size(); i++)
		{
			RoomResvVO rvo=rlist.get(i);
			str=str+" <tr><td><a href='room_content?id="+rvo.getId()+"'>"+rvo.getBid()+"</a></td><td>"+rvo.getRname()+"</td><td>"+rvo.getCheckin()+"</td><td>"+rvo.getCheckout()+"</td><td>"+rvo.getBinwon()+URLEncoder.encode("인")+"</td><td>"+rvo.getBtotal()+URLEncoder.encode("원")+"</td><td>"+rvo.getBkdate()+"</td>";
			
			if(rvo.getBstate()==1)
			{
				str=str+"<td>"+URLEncoder.encode("예약완료")+"</td></tr>";				
			}
			else if(rvo.getBstate()==2)
			{
				str=str+"<td style='color:#887159;'>"+URLEncoder.encode("사용완료")+"</td></tr>";	
			}
			else
			{
				str=str+"<td style='color:red;'>"+URLEncoder.encode("취소완료")+"</td></tr>";	
			}
		}
		str=str+"</table>";
		
		str=str.replace("+", " ");
		
		out.print(str);
		
	}

	@Override
	public String roomR_state_change(HttpServletRequest request) 
	{
		String id=request.getParameter("id");
		String bstate=request.getParameter("bstate");
		mapper.roomR_state_change(id, bstate);
		
		return "redirect:/mypage/room_content?id="+id;
	
	}

	@Override
	public String wedding_content(HttpServletRequest request, Model model, HttpSession session) 
	{
		String userid=session.getAttribute("userid").toString();
		String wresv_id=request.getParameter("wresv_id");
		WeddingResvVO wvo=mapper.wedding_content(userid, wresv_id);
		model.addAttribute("wvo", wvo);
		
		return "/mypage/wedding_content";
	}
	
	@Override
	public String room_content(HttpServletRequest request, Model model, HttpSession session) 
	{
		String userid=session.getAttribute("userid").toString();
		String id=request.getParameter("id");
		RoomResvVO rvo=mapper.room_content(userid, id);
		model.addAttribute("rvo", rvo);
		return "/mypage/room_content";
	}
	
	@Override
	public String dine_content(HttpServletRequest request, Model model, HttpSession session) 
	{
		String userid=session.getAttribute("userid").toString();
		String dr_id=request.getParameter("dr_id");
		DiningResvVO dvo=mapper.dine_content(userid, dr_id);
		model.addAttribute("dvo", dvo);
		return "/mypage/dine_content";
	}
	
	@Override
	public String eshop_content(HttpServletRequest request, Model model, HttpSession session) 
	{
		String userid=session.getAttribute("userid").toString();
		String id=request.getParameter("id");
		String jumuncode=request.getParameter("jumuncode");
//		System.out.println(jumuncode);
		ArrayList<GumaeVO> glist =mapper.eshop_content_list(userid, jumuncode);
		GumaeVO gvo=mapper.eshop_content_info(userid, id);
		model.addAttribute("gvo", gvo);
		model.addAttribute("glist", glist);
		return "/mypage/eshop_content";
	}
	
	@Override
	public String rdwg_check(HttpServletRequest request, Model model) {
		model.addAttribute("err", request.getParameter("err"));
		return "/mypage/rdwg_check";
	}

	@Override
	public String rdwg_info(HttpServletRequest request, Model model) {
		String bjcode=request.getParameter("bjcode");
		String c=bjcode.substring(0, 1);
		
		Date date=Date.valueOf(LocalDate.now());
		mapper.Wstate_complete_change(date);
		mapper.Rstate_complete_change(date);
		mapper.Dstate_complete_change(date);
		
		model.addAttribute("gubun", c);
		
		if(c.equals("r")) {
			RoomResvVO rvo=mapper.getRinfo(bjcode);
			if(rvo != null) {
				model.addAttribute("rvo", rvo);
				return "/mypage/rdwg_info";
			}
			else
				return "redirect:/mypage/rdwg_check?err=1";
		}			
		else if(c.equals("d")) {
			DiningResvVO dvo=mapper.getDinfo(bjcode);
			if(dvo != null) {
				model.addAttribute("dvo", dvo);
				return "/mypage/rdwg_info";
			}
			else
				return "redirect:/mypage/rdwg_check?err=1";
		}	
		else if(c.equals("w")) {
			WeddingResvVO wvo=mapper.getWinfo(bjcode);
			if(wvo != null) {
				model.addAttribute("wvo", wvo);
				return "/mypage/rdwg_info";
			}
			else
				return "redirect:/mypage/rdwg_check?err=1";
		}	
		else if(c.equals("e")) {
			ArrayList<GumaeVO> glist=mapper.getEinfo(bjcode);
			if(glist.size() != 0) {
				model.addAttribute("glist", glist);
				model.addAttribute("gvo", glist.get(0));
				model.addAttribute("buyday", glist.get(0).getBuyday().substring(0,10));
				return "/mypage/rdwg_info";
			}
			else
				return "redirect:/mypage/rdwg_check?err=2";
		}
		else
			return "redirect:/mypage/rdwg_check?err=3";	
	}

	@Override
	public String bjcancel(HttpServletRequest request) {
		String bjcode=request.getParameter("bjcode");
		String c=bjcode.substring(0, 1);
		
		if(c.equals("r"))
			mapper.chgRinfo(bjcode);
		else if(c.equals("d"))
			mapper.chgDinfo(bjcode);
		else if(c.equals("w"))
			mapper.chgWinfo(bjcode);
		else if(c.equals("e"))
			mapper.chgEinfo(bjcode);
		
		return "redirect:/main/index";
	}
}
