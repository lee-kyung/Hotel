package kr.co.hotel.mypage;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.member.MemberVO;


@Service
@Qualifier("ms2")
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageMapper mapper;
	
	@Override
	public void myprofile_pwd_ok(HttpSession session, HttpServletRequest request, PrintWriter out) 
	{
		String userid=session.getAttribute("userid").toString();
		String pwd=request.getParameter("pwd");
		int cnt=mapper.myprofile_pwd_ok(userid, pwd);
		out.print(cnt);
	}

	@Override
	public String myprofile(HttpSession session, Model model) 
	{
		String userid=session.getAttribute("userid").toString();
		MemberVO mvo=mapper.myprofile(userid);
		model.addAttribute("mvo", mvo);
		return "/mypage/myprofile";
	}

}
