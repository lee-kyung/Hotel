package kr.co.hotel.gongji;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GongjiController {

	@Qualifier("gs")
	@Autowired
	private GongjiService service;
	
	@RequestMapping("/info/gongji_write")
	public String gongji_write()
	{
		return "/info/gongji_write";
	}
	
	@RequestMapping("/info/gongji_write_ok")
	public String gongji_write_ok(GongjiVO gvo, HttpServletRequest request)
	{
		return service.gongji_write_ok(gvo, request);
	}
	
	@RequestMapping("/info/gongji_list")
	public String gongji_list(Model model, HttpServletRequest request)
	{
		return service.gongji_list(model, request);
	}
	
	@RequestMapping("/info/gongji_content")
	public String gongji_content(HttpServletRequest request, Model model)
	{
		return service.gongji_content(request, model);
	}
	
	@RequestMapping("/info/gongji_update")
	public String gongji_update(HttpServletRequest request, Model model)
	{
		return service.gongji_update(request, model);
	}
	
	@RequestMapping("/info/gongji_update_ok")
	public String gongji_update_ok(GongjiVO gvo)
	{
		return service.gongji_update_ok(gvo);
	}
	
	@RequestMapping("/info/gongji_delete")
	public String gongji_delete(HttpServletRequest request)
	{
		return service.gongji_delete(request);
	}
	
	@RequestMapping("/info/faq_list")
	public String faq_list(Model model, HttpServletRequest request)
	{
		return service.faq_list(model, request);
	}
	
	@RequestMapping("/info/faq_write")
	public String faq_write()
	{
		return "/info/faq_write";
	}
	
	@RequestMapping("/info/faq_write_ok")
	public String faq_write_ok(FaqVO fvo)
	{
		return service.faq_write_ok(fvo);
	}
	
	@RequestMapping("/info/faq_update")
	public String faq_update(Model model, HttpServletRequest request)	 
	{
		return service.faq_update(model, request);
	}
	
	@RequestMapping("/info/faq_update_ok")
	public String faq_update_ok(FaqVO fvo)
	{
		return service.faq_update_ok(fvo);
	}
	
	@RequestMapping("/info/faq_delete")
	public String faq_delete(HttpServletRequest request)
	{
		return service.faq_delete(request);
	}
}
