package kr.co.hotel.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@Autowired
	@Qualifier("as")
	private AdminService service;
	
	@RequestMapping("/admin/admin")
	public String admin(Model model)
	{
		return service.admin(model);
	}

	@RequestMapping("/admin/memberlist")
	public String memberlist(Model model)
	{
		return service.memberlist(model);
	}
}
