package kr.co.hotel.weddingresv;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
@Qualifier("wrs")
public class WeddingResvServiceImpl implements WeddingResvService{

	@Autowired
	private WeddingResvMapper mapper;

	@Override
	public String wedding_reserve(HttpServletRequest request, Model model, WeddingResvVO wrvo, PrintWriter out) 
	{
		
		int y, m;
		if(request.getParameter("y")==null)
		{
			LocalDate today=LocalDate.now();
			y=today.getYear();	
			m=today.getMonthValue();
		}
		else
		{
			y=Integer.parseInt(request.getParameter("y"));
			m=Integer.parseInt(request.getParameter("m"));
		}
		
		LocalDate dday=LocalDate.of(y, m, 1);
		
		int yoil=dday.getDayOfWeek().getValue();
		if(yoil==7)
			yoil=0;
		
		int chong=dday.lengthOfMonth();
		
		int ju=(int)Math.ceil((yoil+chong)/7.0);
		
		request.setAttribute("yoil", yoil);
		request.setAttribute("chong", chong);
		request.setAttribute("ju", ju);
		request.setAttribute("y", y);
		request.setAttribute("m", m);
		
	
		ArrayList<WeddingResvTimeVO> tlist=mapper.gettime();
		model.addAttribute("tlist", tlist);
		
		ArrayList<WeddingResvTimeVO> hlist=mapper.gethall_name();
		model.addAttribute("hlist", hlist);
		
		return "/wedding/wedding_reserve";
	}

	@Override	
	public String weddingReserve_ok(HttpServletRequest request, WeddingResvVO wrvo) 
	{
				
		mapper.weddingReserve_ok(wrvo);
		return "redirect:/wedding/wedding_reserve";
	}

	@Override
	public void getcheck(WeddingResvVO wrvo, HttpServletRequest request, PrintWriter out) 
	{
		Integer cnt=mapper.getcheck(wrvo);
		
		out.print(cnt);
		
/*		String wresv_cday=request.getParameter("wresv_cday");
		String wresv_time=request.getParameter("wresv_time");
		
		wrvo=mapper.getcheck(wresv_cday, wresv_time);
		model.addAttribute("wrvo", wrvo);
*/		
	}
	
	
}
