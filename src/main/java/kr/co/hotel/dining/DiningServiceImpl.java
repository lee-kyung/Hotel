package kr.co.hotel.dining;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
@Qualifier("ds")
public class DiningServiceImpl implements DiningService{
	
	@Autowired
	private DiningMapper mapper;
	
	@Override
	public String dining_write(Model model)
	{
		ArrayList<DiningVO> list=mapper.dining_write();
		model.addAttribute("list", list);
		return "/dining/dining_write";
	}
	@Override
	public String dining_write_ok(HttpServletRequest request) throws Exception
	{
		String path="C:\\Users\\EZEZ\\git\\hotel\\src\\main\\webapp\\resources\\img\\dining";
		int size=1024*1024*20;
		DiningVO dvo=new DiningVO();
		//String dine_time=request.getParameter("dine_time");
	 
		  MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		  // 폼값 가져오기 => DiningVO에 넣기
		  dvo.setDcode(multi.getParameter("dcode"));
		  dvo.setDine_pimg(multi.getFilesystemName("dine_pimg"));
		  dvo.setDine_cimg(multi.getFilesystemName("dine_cimg"));
		  dvo.setDine_type(multi.getParameter("dine_type"));
		  dvo.setDine_adult(Integer.parseInt(multi.getParameter("dine_adult")));
		  dvo.setDine_child(Integer.parseInt(multi.getParameter("dine_child")));
		  dvo.setDine_halin(Integer.parseInt(multi.getParameter("dine_halin")));
		 /*dvo.setDine_time(multi.getParameter("dine_time"));*/
		 /*dvo.setDine_su(Integer.parseInt(multi.getParameter("dine_su")));*/
	   
		//System.out.println(dine_time);
		mapper.dining_write_ok(dvo);
		return "redirect:/dining/dining";

}
}