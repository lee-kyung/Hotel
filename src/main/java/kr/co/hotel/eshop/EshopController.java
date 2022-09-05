package kr.co.hotel.eshop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EshopController {
	@Autowired
	@Qualifier("es")
	private EshopService service;
	
	@RequestMapping("/eshop/eshop")
	public String eshop() {
		return "/eshop/eshop";
	}
	
	@RequestMapping("/eshop/product")
	public String product() {
		return "/eshop/product";
	}
	
	@RequestMapping("/eshop/voucher")
	public String voucher() {
		return "/eshop/voucher";
	}
}
