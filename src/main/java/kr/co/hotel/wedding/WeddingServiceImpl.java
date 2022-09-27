package kr.co.hotel.wedding;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.aop.framework.adapter.DefaultAdvisorAdapterRegistry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Service
@Qualifier("ws")
public class WeddingServiceImpl implements WeddingService{

	@Autowired
	private WeddingMapper mapper;

	@Override
	public String wed_hall_write_ok(HttpServletRequest request) throws Exception 
	{
		String path=request.getRealPath("resources/img/wedding");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		
		String wed_hall=multi.getParameter("wed_hall");
		String wed_title=multi.getParameter("wed_title");
		String wed_min=multi.getParameter("wed_min");
		String wed_max=multi.getParameter("wed_max");
		String wed_txt=multi.getParameter("wed_txt");
		String wed_txt2=multi.getParameter("wed_txt2");
		String wed_size=multi.getParameter("wed_size");
		String wed_food=multi.getParameter("wed_food");
		String wed_direct=multi.getParameter("wed_direct");
		String wed_type=multi.getParameter("wed_type");
		String wed_price=multi.getParameter("wed_price");
	
		Enumeration file=multi.getFileNames();
		
		String fnames="";
			
		while(file.hasMoreElements())
		{
			String fname=file.nextElement().toString();
			fnames=fnames+multi.getFilesystemName(fname)+",";
		}
			
		
		fnames=fnames.replace("null,", "");
		System.out.println(fnames);
		
		WeddingVO wvo=new WeddingVO();
		wvo.setWed_hall(wed_hall);
		wvo.setWed_title(wed_title);
		wvo.setWed_min(Integer.parseInt(wed_min));
		wvo.setWed_max(Integer.parseInt(wed_max));
		wvo.setWed_txt(wed_txt);
		wvo.setWed_txt2(wed_txt2);
		wvo.setWed_fname(fnames);
		wvo.setWed_size(Integer.parseInt(wed_size));
		wvo.setWed_food(wed_food);
		wvo.setWed_direct(wed_direct);
		wvo.setWed_type(wed_type);
		wvo.setWed_price(Integer.parseInt(wed_price));
		
		mapper.wed_hall_write_ok(wvo);
		
		return "redirect:/wedding/wedding_hall?id=15";
	}

	@Override
	public String wedding_hall(HttpServletRequest request, Model model,WeddingVO wvo) 
	{
		String id=request.getParameter("id");
		wvo=mapper.wedding_hall(id);
		wvo.setWed_title(wvo.getWed_title().replace("\r\n", "<br>"));
		wvo.setWed_txt(wvo.getWed_txt().replace("\r\n", "<br>"));
		wvo.setWed_txt2(wvo.getWed_txt2().replace("\r\n", "<br>"));
		String[] img=wvo.getWed_fname().split(",");
		model.addAttribute("img", img);
		
		model.addAttribute("wvo", wvo);
		
		ArrayList<WeddingVO> list=mapper.getHall();
		model.addAttribute("list", list);
		return "/wedding/wedding_hall";
	}


	@Override
	public String wedding_check(Model model) 
	{
		ArrayList<WeddingVO> list=mapper.getHall();
		model.addAttribute("list", list);
		return null;

	}

	@Override
	public String wedding_reserve(HttpServletRequest request, Model model) 
	{
/*		
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
		
		LocalDate day=LocalDate.of(y, m, 1);
		
		int yoil=day.getDayOfWeek().getValue();
		if(yoil==7)
			yoil=0;
		
		int chong=day.lengthOfMonth();
		
		int ju=(int)Math.ceil((yoil+chong)/7.0);
		
		
		request.setAttribute("yoil", yoil);
		request.setAttribute("chong", chong);
		request.setAttribute("ju", ju);
		request.setAttribute("y", y);
		request.setAttribute("m", m);
*/		
	
		ArrayList<WeddingResvTimeVO> tlist=mapper.gettime();
		model.addAttribute("tlist", tlist);
		
		ArrayList<WeddingResvVO> hlist=mapper.gethall_name();
		model.addAttribute("hlist", hlist);
		
		
		
		
/*		
		LocalDate today=LocalDate.now();
		
		int y2,m2,d2;
		
		if(request.getParameter("y")==null)	
			y2=today.getYear();
		else
			y2=Integer.parseInt(request.getParameter("y"));
		
		
		if(request.getParameter("m")==null)
			m2=today.getMonthValue();
		else
			m2=Integer.parseInt(request.getParameter("m"));
		
		
		if(request.getParameter("day")==null)
		{
			d2=today.getDayOfMonth();
		}
		else
		{
			d2=Integer.parseInt(request.getParameter("day"));
		}
		
		
		LocalDate day2=LocalDate.of(y2, m2, 30);
		
		System.out.println("today="+today);
		System.out.println("day2="+day2);
		
		if(today.isBefore(day2))
		{
			request.setAttribute("tt", "1");	
		}
		else
		{
			request.setAttribute("tt", "0");
		}
		*/
		
		
		
		return "/wedding/wedding_reserve";
	}
	
	

	@Override	
	public String weddingReserve_ok(WeddingResvVO wrvo, HttpSession session) 
	{
	
		if(session.getAttribute("userid").toString() != null)
		{
			String userid=session.getAttribute("userid").toString();
			wrvo.setUserid(userid); // wrvo에 userid 가져와서 넣기
		}
		else
		{
			String userid="guest";
			wrvo.setUserid(userid);	// wrvo에 userid 가져와서 넣기
		}
		
		/*주문번호 생성하기 -> 구매날짜(8자리)+난수(4자리)+찐숫자(4자리)*/
		Date today=new Date();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyyMMdd");
		String now=dateFormat.format(today);
		
		String rand=RandomStringUtils.random(4, false, true);
		
		Integer n=mapper.getWresv_code();
		n++;
		String num=n.toString();
		switch(num.length())
		{
			case  1 : num="000"+num; break;
			case  2 : num="00"+num; break;
			case  3 : num="0"+num; break;
		}
		
		
		
		String wresv_code='w'+now+rand+num;

		wrvo.setWresv_code(wresv_code);
		
		mapper.weddingReserve_ok(wrvo);
		
		return "redirect:/wedding/wed_resv_check?wresv_code="+wresv_code;
	}

/*	@Override
	public void getcheck(WeddingResvVO wrvo, HttpServletRequest request, Model model) 
	{
		Integer cnt=mapper.getcheck(wrvo);
		
		model.addAttribute("cnt", cnt);
	
	}*/

	@Override
	public void wresv_cal(WeddingResvVO wrvo,PrintWriter out,HttpServletRequest request, Model model) 
	{
		
		String wresv_cday=request.getParameter("wresv_cday");
		model.addAttribute("wresv_cday", wresv_cday);
		request.setAttribute("wresv_cday", wresv_cday);
		System.out.println("wresv_cday="+wresv_cday);
		
		
		ArrayList<WeddingResvVO> list=mapper.wresv_cal(wrvo);
		System.out.println(list.size());
		String str="";
		for(int i=0; i<list.size(); i++)
		{
			wrvo=list.get(i);
			str=str+wrvo.getWresv_time()+",";
			
		}
	
			out.print(str);
			
	}

	@Override
	public String wed_resv_check(HttpServletRequest request, HttpSession session, Model model) 
	{
	//	String userid=session.getAttribute("userid").toString();
		String wresv_code=request.getParameter("wresv_code");
		WeddingResvVO wrvo=mapper.wed_resv_check(wresv_code);
		model.addAttribute("wrvo", wrvo);
		return "/wedding/wed_resv_check";
	}
	
	
}
