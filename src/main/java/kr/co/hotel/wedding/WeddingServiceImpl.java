package kr.co.hotel.wedding;

import java.io.IOException;
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
		
		ArrayList<WeddingVO> list=mapper.wedding_hall_name();
		model.addAttribute("list", list);
		return "/wedding/wedding_hall";
	}

	
}
