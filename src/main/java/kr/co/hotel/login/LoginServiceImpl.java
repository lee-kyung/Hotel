package kr.co.hotel.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.hotel.member.MemberVO;

@Service
@Qualifier("ls")
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginMapper mapper;

	@Override
	public String login_ok(MemberVO mvo, HttpSession session) {
		mvo=mapper.login_ok(mvo);
		if(mvo != null) {
			session.setAttribute("userid", mvo.getUserid());
			session.setAttribute("name", mvo.getName());
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
