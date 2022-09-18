/*package kr.co.hotel.wedding;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

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
		
		mapper.wed_hall_write_ok(wvo);
		
		return "redirect:/wedding/wedding_hall?id=9";
	}

	@Override
	public String wedding_hall(HttpServletRequest request, Model model,WeddingVO wvo) 
	{
		String id=request.getParameter("id");
		wvo=mapper.wedding_hall(id);
		String[] img=wvo.getWed_fname().split(",");
		model.addAttribute("img", img);
		model.addAttribute("wvo", wvo);
		
		ArrayList<WeddingVO> list=mapper.getHall();
		model.addAttribute("list", list);
		return "/wedding/wedding_hall";
	}


	@Override
	public String wedding_check(Model model, HttpServletRequest request) 
	{
		ArrayList<WeddingVO> list=mapper.getHall();
		model.addAttribute("list", list);
		return null;

	}

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
		
		ArrayList<WeddingResvVO> hlist=mapper.gethall_name();
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
	public void getcheck(WeddingResvVO wrvo, HttpServletRequest request, Model model) 
	{
		Integer cnt=mapper.getcheck(wrvo);
		
		model.addAttribute("cnt", cnt);
		
/*		String wresv_cday=request.getParameter("wresv_cday");
		String wresv_time=request.getParameter("wresv_time");
		
		wrvo=mapper.getcheck(wresv_cday, wresv_time);
		model.addAttribute("wrvo", wrvo);
*/		
/*	}

	@Override
	public void wresv_cal(WeddingResvVO wrvo,PrintWriter out, HttpServletRequest request, Model model,WeddingResvTimeVO wrtvo) 
	{
		
		
	//	ArrayList<String> list=mapper.wresv_cal(wrvo);
		
	//	System.out.println(list);
	//	out.print(list);
		
		ArrayList<WeddingResvVO> list=mapper.wresv_cal(wrvo);
		System.out.println(list.size());
		String str="";
		for(int i=0; i<list.size(); i++)
		{
			wrvo=list.get(i);
			str=str+"<div style='color:red; text-decoration:line-through;'>"+wrvo.getWresv_time()+"</div>";
		}
		
		
		
		String wresv_cday=request.getParameter("wresv_cday");
		ArrayList<WeddingResvTimeVO> list2=mapper.wresv_cal2(wresv_cday);
		String str2="";
		for(int i=0; i<list2.size(); i++)
		{
			wrtvo=list2.get(i);
			
			str=str+"<div id='aa' class='time2' name='wresv_time' onclick='time(this)' >"+wrtvo.getWt_time()+"</div>";
			str2=str2+"<div id='aa' class='time2' name='wresv_time' onclick='time(this)' >"+wrtvo.getWt_time()+"</div>";
		}
		
		
		if(list.size()==0)
		{
			out.print(str2);
		}
		else
		{
			out.print(str);
		}
	}
	
	
}*/