package kr.co.hotel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:/main/index";
	}
	
	@RequestMapping("/main/index")
	public String index() {
		return "/main/index";
	}

	@RequestMapping("/info/info")
	public String info() {
		return "/info/info";
	}
/*	
	@RequestMapping("/room/rooms")
	public String rooms() {
		return "/room/rooms";
	}*/
	
	@RequestMapping("/dining/dining")
	public String about() {
		return "/dining/dining";
	}
	
	@RequestMapping("/wedding/wedding")
	public String wedding() {
		return "/wedding/wedding";
	}
	
	@RequestMapping("/etc/contact")
	public String contact() {
		return "/etc/contact";
	}
	
	@RequestMapping("/etc/basic")
	public String basic() {
		return "/etc/basic";
	}
	
	@RequestMapping("/etc/elements")
	public String elements() {
		return "/etc/elements";
	}
}
