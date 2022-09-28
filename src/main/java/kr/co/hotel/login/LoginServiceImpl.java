package kr.co.hotel.login;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.util.WebUtils;

import kr.co.hotel.member.MemberVO;

@Service
@Qualifier("ls")
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginMapper mapper;
	
	@Override
	public String login(HttpServletRequest request, Model model) {
		if(request.getParameter("ck") != null) {
			String ck=request.getParameter("ck");
			model.addAttribute("ck", ck);
		}
		if(request.getParameter("p") != null) {
			String p=request.getParameter("p");
			model.addAttribute("p", p);
		}
		return "/login/login";
	}

	@Override
	public String login_ok(MemberVO mvo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {	
		mvo=mapper.login_ok(mvo);
		int ck;

		if(mvo != null) {
			String userid=mvo.getUserid();
			session.setAttribute("userid", userid);
			session.setAttribute("name", mvo.getName());
			session.setAttribute("email", mvo.getEmail());
			session.setAttribute("phone", mvo.getPhone());
			session.setAttribute("joinday", mvo.getJoinday());
			session.setAttribute("juk", mvo.getJuk());
			
			/* 비회원 장바구니를 회원 장바구니로 옮기기 (+중복삭제) */
			Cookie cookie = WebUtils.getCookie(request, "cookieid");
			if(cookie != null) {
				String cookievalue=cookie.getValue();
				int chk=mapper.checkCart(cookievalue);
				
				if(chk != 0) {
					mapper.cart_chgUserid(userid, cookievalue);
					mapper.cart_addSu();
					mapper.cart_delDupli();
				}
				cookie.setPath("/");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			if(request.getParameter("ck") != null) {
				ck=Integer.parseInt(request.getParameter("ck"));
				if(ck==1)
					return "redirect:/wedding/wedding_reserve";
				else if(ck==2)
					return "redirect:/room/room_resv";
				else if(ck == 3)
					return "redirect:/eshop/cart?p="+request.getParameter("p");	
				else
					return "redirect:/main/index";
			}

			return "redirect:/main/index";
		}
		else
			return "redirect:/login/login?ck=4";
	}
	
	@Override
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/index";
	}

	@Override
	public void userid_search_ok(MemberVO mvo, PrintWriter out) 
	{
		String userid=mapper.userid_search_ok(mvo);
		
		if(userid==null)
			userid="0";
		
		System.out.println(userid);
		out.print(userid);
	}

	@Override
	public void pwd_search_ok(MemberVO mvo, PrintWriter out) 
	{
		String pwd=mapper.pwd_search_ok(mvo);
		if(pwd==null)
			pwd="0";
		System.out.println(pwd);
		out.print(pwd);
		
	}

}
