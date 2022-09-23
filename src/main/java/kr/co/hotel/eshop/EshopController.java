package kr.co.hotel.eshop;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	
	@RequestMapping("/eshop/error")
	public String error() {
		return "/eshop/error";
	}
	
	/* pdae테이블의 내용을 읽어오기 위한 용도 */
	@RequestMapping("/eshop/pro_write")
	public String pro_write(Model model) {
		return service.pro_write(model);
	}
	
	/* pso테이블의 내용을 읽어오기 위한 용도 */
	@RequestMapping("/eshop/getso")
	public void getso(HttpServletRequest request, PrintWriter out) {
		service.getso(request, out);
	}
	
	@RequestMapping("/eshop/getpcode")
	public void getpcode(HttpServletRequest request, PrintWriter out) {
		service.getpcode(request, out);
	}
	
	@RequestMapping("/eshop/pro_write_ok")
	public String pro_write_ok(HttpServletRequest request) {
		return service.pro_write_ok(request);
	}
	
	@RequestMapping("/eshop/pro_list")
	public String pro_list(HttpServletRequest request, Model model, HttpSession session) {
		return service.pro_list(request, model, session);
	}
	
	@RequestMapping("/eshop/pro_content")
	public String pro_content(HttpServletRequest request, Model model, HttpSession session) {
		return service.pro_content(request, model, session);
	}
	
	@RequestMapping("/eshop/wish_add")
	public void wish_add(HttpSession session, HttpServletRequest request, PrintWriter out) {
		service.wish_add(session, request, out);
	}
	
	@RequestMapping("/eshop/wish_del")
	public void wish_del(HttpSession session, HttpServletRequest request, PrintWriter out) {
		service.wish_del(session, request, out);
	}
	
	@RequestMapping("/eshop/cart_add")
	public void cart_add(HttpSession session, HttpServletRequest request, HttpServletResponse response, PrintWriter out) {
		service.cart_add(session, request, out, response);
	}
	
	@RequestMapping("/eshop/cart")
	public String cart(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) {
		return service.cart(session, model, request, response);
	}
	
	@RequestMapping("/eshop/wishcart_del")
	public String wishcart_del(HttpServletRequest request) {
		return service.wishcart_del(request);
	}
	
	@RequestMapping("/eshop/pro_gumae")
	public String pro_gumae(HttpServletRequest request, Model model, HttpSession session) {
		return service.pro_gumae(request, model, session);
	}
	
	@RequestMapping("/eshop/wish")
	public String wish(HttpSession session, Model model, HttpServletRequest request) {
		return service.wish(session, model, request);
	}
	
	@RequestMapping("/eshop/move_cart")
	public String move_cart(HttpSession session, HttpServletRequest request) {
		return service.move_cart(session, request);
	}
	
	@RequestMapping("/eshop/pro_gumae_ok")
	public String pro_gumae_ok(GumaeVO gvo, HttpSession session, HttpServletRequest request) {
		return service.pro_gumae_ok(gvo, session, request);
	}
}
