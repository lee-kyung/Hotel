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
	public String dining_reserve(HttpServletRequest request, Model model)
	{
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
	@Override
	public String dining_reserve_next(HttpServletRequest request, Model model)
	{		
		// jsp에 보내줘야 될내용 => 년,월,일, 방의 정보
    	int y=Integer.parseInt(request.getParameter("y"));
    	int mm=Integer.parseInt(request.getParameter("m"));
    	int dd=Integer.parseInt(request.getParameter("d"));
    	String id=request.getParameter("id");
    	// 입실일
    	String ymd=y+"-"+mm+"-"+dd;
    	
    	DiningVO dvo=mapper.dining_reserve_next("id");
    	// request영역에 필요한 값 담기
    	request.setAttribute("ymd", ymd);
    	
    	model.addAttribute("dvo", dvo);
		return "/dining/dining_reserve_next";
	}
	@Override
	public String dining_reserve_ok(HttpServletRequest request, HttpSession session)
	{
		String dr_date=request.getParameter("dr_date");
		
		return "/dining/dining_reserve_next_ok";
	}
	
	

}
