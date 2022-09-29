package kr.co.hotel.dining;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiningController {
	@Autowired
	@Qualifier("ds")
	private DiningService service;
	
	@RequestMapping("/dining/dining_write")
	public String dining_write(Model model)
	{
		return service.dining_write(model);
	}
	@RequestMapping("/dining/dining_write_ok")
	public String dining_write_ok(HttpServletRequest request) throws Exception
	{
		return service.dining_write_ok(request);
	}
	@RequestMapping("/dining/dining_list")
	public String dining_list(Model model)
	{
		return service.dining_list(model);
	}
	@RequestMapping("/dininig/dining_content")
	public String dininig_content(HttpServletRequest request, Model model)
	{
		return service.dining_content(request,model);
	}
	@RequestMapping("/dining/dining_update")
	public String dining_update(HttpServletRequest request, Model model)
	{
		return service.dining_update(request,model);
	}
	@RequestMapping("/dining/dining_update_ok")
	public String dining_update_ok(DiningVO dvo, HttpServletRequest request)
	{
		return service.dining_update_ok(dvo, request);
	}
	@RequestMapping("/dining/dining_delete")
	public String dinining_delete(HttpServletRequest request)
	{
		return service.dining_delete(request);
	}

}
