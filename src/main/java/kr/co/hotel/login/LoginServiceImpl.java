package kr.co.hotel.login;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import kr.co.hotel.member.MemberVO;

@Service
@Qualifier("ls")
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginMapper mapper;

	@Override
	public String login_ok(MemberVO mvo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		mvo=mapper.login_ok(mvo);
		if(mvo != null) {
			String userid=mvo.getUserid();
			session.setAttribute("userid", userid);
			session.setAttribute("name", mvo.getName());
			
			/* 비회원 장바구니를 회원 장바구니로 옮기기 (※중복제크必) */
			/*Cookie cookie = WebUtils.getCookie(request, "cookieid");
			if(cookie != null) {	// cookie값이 있다면
				String cookievalue=cookie.getValue();
				int chk1=mapper.checkCart(cookievalue);
				int chk2=mapper.checkCart_userid(userid, cookievalue);
				
				if(chk1 != 0) {	// 비회원일 때 장바구니에 상품을 넣었는데
					if(chk2 == 0)	// 회원 장바구니에 중복되는 상품이 없다면
						mapper.cart_userid_change(userid, cookievalue);	// userid만 바꾸기
					else if((chk2 != 0) && (chk1 > chk2)) {	// 일부 중복되는 상품이 있다면
							mapper.cart_del_duplicate(userid, cookievalue);	// 중복되는 상품은 지우고,
							mapper.cart_userid_change(userid, cookievalue);	// 아닌 상품은 userid만 바꾸기
						}
						else if(chk1 == chk2)	// 전부 중복되는 상품이라면
							mapper.cart_del(cookievalue);
				}
				cookie.setPath("/");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}*/
			return "redirect:/main/index";	
		}
		else
			return "redirect:/login/login";
	}
	
	@Override
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/index";
	}
}
