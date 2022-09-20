package kr.co.hotel.diningresv;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.dining.DiningVO;

@Service
@Qualifier("drs")
public class DiningResvServiceImpl implements DiningResvService{
	
	@Autowired
	private DiningResvMapper mapper;
	
	@Override
	public String dining_reserve(HttpServletRequest request, Model model, HttpSession session)
	{
		String userid=session.getAttribute("userid").toString();
		DiningResvVO drvo=new DiningResvVO();
		drvo.setUserid(session.getAttribute("userid").toString());
	//  1일의 요일, 총일수, 몇주를 구해서 request영역에 저장
		
		int y,m;
    	if(request.getParameter("y")==null)
    	{
    		LocalDate today=LocalDate.now(); // 현재 날짜 정보를 가져온다..
    		y=today.getYear(); // 년도
    		m=today.getMonthValue(); // 월
    	}
    	else
    	{
    		y=Integer.parseInt(request.getParameter("y"));
    		m=Integer.parseInt(request.getParameter("m"));
    	}
    	
    	// 해당월의 1일에 대한 날짜객체를 생성
    	LocalDate dday=LocalDate.of(y, m, 1);
    	
    	// 1일의 요일
    	int yoil=dday.getDayOfWeek().getValue();  // 1~7까지  (7:일요일)
    	if(yoil==7)
    		yoil=0;
    	// 해당월의 총일수
    	int chong=dday.lengthOfMonth(); // 총일수
    	
    	// 몇 주인가
    	int ju=(int)Math.ceil((yoil+chong)/7.0);
        
    	// 년,월은 request영역, 일은 pageContext => 스크립트릿변수
    	
        
    	request.setAttribute("yoil", yoil);
    	request.setAttribute("chong", chong);
    	request.setAttribute("ju", ju);
    	request.setAttribute("y", y);
    	request.setAttribute("m", m); 
		
    	/*ArrayList<DiningVO> dlist=mapper.getTime();*/
    	ArrayList<DiningVO> dlist=mapper.dining_reserve();
    	model.addAttribute("dlist", dlist);
    	
		return "/dining/dining_reserve";
	}
	/*public void getcheck(String y, String m, String d, HttpServletRequest request)
    {
    	int yy=Integer.parseInt(y);
    	int mm=Integer.parseInt(m);
    	int dd=Integer.parseInt(d);
    	
    	LocalDate today=LocalDate.now(); // 오늘날짜
    	LocalDate dday=LocalDate.of(yy, mm, dd);
    	
    	if(today.isBefore(dday))
    	{
    		request.setAttribute("tt", "1");
    	}
    	else if(today.isEqual(dday))
    	{
    		request.setAttribute("tt", "1");
    	}
    	else
    	{
    		request.setAttribute("tt", "0");
    	}
  
        mapper.getcheck(y,m,d,request);
    }*/
	@Override
	public String dining_reserve_next(HttpServletRequest request, Model model)
	{		
		// jsp에 보내줘야 될내용 => 년,월,일, 방의 정보
    	int y=Integer.parseInt(request.getParameter("y"));
    	int mm=Integer.parseInt(request.getParameter("m"));
    	int dd=Integer.parseInt(request.getParameter("d"));
    	String id=request.getParameter("id");
    	String dine_type=request.getParameter("dine_type");
    	String adult=request.getParameter("adult");
    	String child=request.getParameter("child");
    	String baby=request.getParameter("baby");
    	
    	// 입실일
    	String ymd=y+"-"+mm+"-"+dd;
    	
    	DiningVO dvo=mapper.dining_reserve_next("id");
    	// request영역에 필요한 값 담기
    	request.setAttribute("ymd", ymd);
    	
    	
    	model.addAttribute("dine_type", dine_type);
    	model.addAttribute("adult", adult);
    	model.addAttribute("child", child);
    	model.addAttribute("baby", baby);
    	
    	model.addAttribute("dvo", dvo);
		return "/dining/dining_reserve_next";
	}
	@Override
	public String dining_reserve_ok(DiningResvVO drvo)
	{		
		mapper.dining_reserve_ok(drvo);
		return "redirect:/dining/dining_reserve";
	}
	@Override
	public String dining_reserve_check(HttpSession session, Model model)
	{
		String userid=session.getAttribute("userid").toString();
		ArrayList<DiningResvVO> list=mapper.dining_reserve_check(userid);
		model.addAttribute("list", list);
		return "/dining/dining_reserve_check";
	}



	
	

}
