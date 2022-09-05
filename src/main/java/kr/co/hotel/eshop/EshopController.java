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
	
	@RequestMapping("/eshop/product")
	public String product() {
		return "/eshop/product";
	}
}
