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
	
	@RequestMapping("/room/rooms")
	public String rooms() {
		return "/room/rooms";
	}
	
	@RequestMapping("/dining/dining")
	public String about() {
		return "/dining/dining";
	}
	
	@RequestMapping("/wedding/wedding")
	public String wedding() {
		return "/wedding/wedding";
	}
	
	@RequestMapping("/wedding/single_wedding")
	public String single_wedding() {
		return "/wedding/single_wedding";
	}
	
	@RequestMapping("/eshop/product")
	public String product() {
		return "/eshop/product";
	}
	
	@RequestMapping("/etc/contact")
	public String contact() {
		return "/etc/contact";
	}
	
	@RequestMapping("/etc/basic")
	public String basic() {
		return "/etc/basic";
	}
}
