package kr.co.hotel.wedding;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.aop.framework.adapter.DefaultAdvisorAdapterRegistry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
@Qualifier("ws")
public class WeddingServiceImpl implements WeddingService{

	@Autowired
	private WeddingMapper mapper;

	@Override
	public String wed_hall_write_ok(HttpServletRequest request) 
	{
		String path=request.getRealPath("resources/img/wedding");
		int size=1024*1024*20;
		WeddingVO wvo=new WeddingVO();
		try
		{
			MultipartRequest multi=new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
			Enumeration file=multi.getFileNames();
			String fname="";
			while(file.hasMoreElements())
			{
				fname=fname+multi.getFilesystemName(file.nextElement().toString())+",";
			}
			wvo.setWed_hall(multi.getParameter("wed_hall"));
			wvo.setWed_title(multi.getParameter("wed_title"));
			wvo.setWed_min(Integer.parseInt(multi.getParameter("wed_min")));
			wvo.setWed_max(Integer.parseInt(multi.getParameter("wed_max")));
			wvo.setWed_content(multi.getParameter("wed_content"));
			wvo.setWed_txt(multi.getParameter("wed_txt"));
			wvo.setWed_txt2(multi.getParameter("wed_txt2"));
			wvo.setWed_fname(multi.getParameter("wed_fname"));
			wvo.setWed_size(Integer.parseInt(multi.getParameter("wed_size")));
			wvo.setWed_food(multi.getParameter("wed_food"));
			wvo.setWed_direct(multi.getParameter("wed_direct"));
			wvo.setWed_type(multi.getParameter("wed_type"));
			
		}
		catch(Exception e)
		{
			
		}
		
		mapper.wed_hall_write_ok(wvo);
		return "/wedding/wedding_hall";
	}
}
