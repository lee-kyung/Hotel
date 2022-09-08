package kr.co.hotel.eshop;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	/* pdae테이블의 내용을 읽어오기 위한 용도 */
	@RequestMapping("/eshop/pro_write")
	public String pro_write(Model model) {
		return service.pro_write(model);
	}
	
	@RequestMapping("/eshop/getso")
	public void getso(HttpServletRequest request, PrintWriter out) {
		service.getso(request, out);
	}
}
