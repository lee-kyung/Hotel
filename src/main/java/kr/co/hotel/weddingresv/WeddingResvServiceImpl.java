package kr.co.hotel.weddingresv;

import java.time.LocalDate;

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
	public String wedding_reserve(HttpServletRequest request, Model model, WeddingResvVO wrvo) 
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
		
		return "/wedding/wedding_reserve";
	}
}
