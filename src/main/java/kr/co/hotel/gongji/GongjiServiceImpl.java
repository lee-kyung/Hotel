package kr.co.hotel.gongji;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.wedding.WeddingResvVO;

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
	public String gongji_list(Model model, HttpServletRequest request) 
	{
		
		// 페이지
			int page, start;
			int pcnt;

			if(request.getParameter("pcnt")==null)
				pcnt=10;
			else
				pcnt=Integer.parseInt(request.getParameter("pcnt"));
				
			if(request.getParameter("page")==null)
				page=1;
			else
				page=Integer.parseInt(request.getParameter("page"));
			
			start=(page-1)*pcnt;
			
			int pstart, pend;
				
			pstart=page/10;
				
			if(page%10==0)
				pstart--;
				
			pstart=pstart*10+1;
			pend=pstart+9;
				
			int chong=mapper.getGongjiChong(pcnt);
				
			if(chong<pend)
				pend=chong;
	
			model.addAttribute("page", page);
			model.addAttribute("pstart", pstart);
			model.addAttribute("pend", pend);
			model.addAttribute("chong", chong);
			model.addAttribute("pcnt", pcnt);
				
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
