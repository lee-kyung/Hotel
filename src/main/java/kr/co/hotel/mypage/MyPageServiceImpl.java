package kr.co.hotel.mypage;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.member.MemberVO;
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
		mapper.state_complete_change(date);
		
		
		return "/mypage/mypage";
	}

	@Override
	public String wedding_resv(Model model, HttpSession session, HttpServletRequest request, WeddingResvVO wvo) 
	{
		String userid=session.getAttribute("userid").toString();
		ArrayList<WeddingResvVO> wlist=mapper.wedding_resv(userid);
		
		model.addAttribute("wlist", wlist);

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		return "/mypage/wedding_resv";
	}

	@Override
	public void wedding_resv_search(HttpSession session, HttpServletRequest request, PrintWriter out) 
	{
		String userid=session.getAttribute("userid").toString();
		String cal_in=request.getParameter("cal_in");
		String cal_out=request.getParameter("cal_out");

		
		ArrayList<WeddingResvVO> wslist=mapper.wedding_resv_search(userid, cal_in, cal_out);

		String str="";
		str=str+"<table border='1' id='second_t'>";
		str=str+"<tr><td>"+URLEncoder.encode("예약번호")+"</td><td>"+URLEncoder.encode("상담일")+"</td><td>"+URLEncoder.encode("상담 시간")+"</td><td>"+URLEncoder.encode("예식 희망일")+"</td><td>"+URLEncoder.encode("희망하는 웨딩홀")+"</td><td>"+URLEncoder.encode("예약한 날")+"</td><td width='120px;'></td></tr>";
		for(int i=0; i<wslist.size(); i++)
		{
			WeddingResvVO wrvo=wslist.get(i);
			str=str+" <tr><td>"+wrvo.getWresv_code()+"</td><td>"+wrvo.getWresv_cday()+"</td><td>"+wrvo.getWresv_time()+"</td><td>"+wrvo.getWresv_wday()+"</td><td>"+wrvo.getWresv_hall()+"</td><td>"+wrvo.getWresv_day()+"</td>";
			if(wrvo.getState()==0)
			{
				str=str+"<td><input type=\"button\" id=\"btn3\" value=\""+URLEncoder.encode("예약취소")+"\" onclick=\"location='weddingR_state_change?state=1&wresv_id=${wvo.wresv_id}'\"></td></tr>";				
			}
			else if(wrvo.getState()==1)
			{
				str=str+"<td><input type=\"button\" class=\"btn4\" value=\""+URLEncoder.encode("예약취소")+"\"></td></tr>";				
			}
			else
			{
				str=str+"<td><input type=\"button\" class=\"btn4\" value=\""+URLEncoder.encode("상담완료")+"\"></td></tr>";	
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
		
		return "redirect:/mypage/wedding_resv";
	}

}
