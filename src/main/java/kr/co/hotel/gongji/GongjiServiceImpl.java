package kr.co.hotel.gongji;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
@Qualifier("gs")
public class GongjiServiceImpl implements GongjiService{

	@Autowired
	private GongjiMapper mapper;

	@Override
	public String gongji_write_ok(GongjiVO gvo, HttpServletRequest request) 
	{
		int gubun;
		if(gvo.getGubun()==0)
			gubun=0;
		else
			gubun=gvo.getGubun();
		
		mapper.gongji_write_ok(gvo);
		return "redirect:/info/gongji_list";
	}

	@Override
	public String gongji_list(Model model) 
	{
		ArrayList<GongjiVO> glist=mapper.gongji_list();
		model.addAttribute("glist", glist);
		
		return "/info/gongji_list";
	}

	@Override
	public String gongji_content(HttpServletRequest request, Model model) 
	{
		String id=request.getParameter("id");
		GongjiVO gvo=mapper.gongji_content(id);
		gvo.setContent(gvo.getContent().replace("\r\n", "<br>"));
		model.addAttribute("gvo", gvo);
		return "/info/gongji_content";
	}

	@Override
	public String gongji_update(HttpServletRequest request, Model model) 
	{
		String id=request.getParameter("id");
		GongjiVO gvo=mapper.gongji_content(id);
		model.addAttribute("gvo", gvo);
		
		return "/info/gongji_update";
	}

	@Override
	public String gongji_update_ok(GongjiVO gvo) 
	{
		int gubun;
		if(gvo.getGubun()==0)
			gubun=0;
		else
			gubun=gvo.getGubun();
		
		mapper.gongji_update_ok(gvo);
		
		return "redirect:/info/gongji_content?id="+gvo.getId();
	}

	@Override
	public String gongji_delete(HttpServletRequest request) 
	{
		String id=request.getParameter("id");
		mapper.gongji_delete(id);
		return "redirect:/info/gongji_list";
	}
	
	
}
