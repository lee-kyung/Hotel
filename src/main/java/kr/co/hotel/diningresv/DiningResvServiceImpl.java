package kr.co.hotel.diningresv;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
	public String getprev(HttpServletRequest request, Model model)
	    {
	    	LocalDate today=LocalDate.now(); //오늘날짜
	    	int y,m;
	    	if(request.getParameter("y")==null) // reserve.jsp를 제일 처음 부를때는 null값임
	    		y=today.getYear();
	    	else
	    	    y=Integer.parseInt(request.getParameter("y"));
	    	
	    	if(request.getParameter("m")==null)
	    		m=today.getMonthValue();
	    	else
	    	    m=Integer.parseInt(request.getParameter("m"));
	    	
	    	LocalDate xday=LocalDate.of(today.getYear(), today.getMonthValue(), 1); // 오늘기준 1일의날짜
	    	LocalDate dday=LocalDate.of(y, m, 1); // 현재 달력기준 1일의 날짜
	    	
	    	if(xday.isBefore(dday))  // 오늘기준 보다 달력의 기준이 이전일 경우(같을경우도 포함)
	    	{
	    		request.setAttribute("prev", "1");
	    	}
	    	else 
	    	{
	    	      	request.setAttribute("prev", "0");
	    	}
	    	
			return "/dining/getprev";
	    	
	    }
	/*@Override
	public void getEmpty(String dday, String )*/
	

}
