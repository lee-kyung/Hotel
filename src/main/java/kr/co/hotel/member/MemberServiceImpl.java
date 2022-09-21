package kr.co.hotel.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;

	@Override
	public String member_input_ok(MemberVO mvo, HttpServletRequest request) 
	{
		String phone=request.getParameter("phone");
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		mvo.setPhone(phone+"-"+phone1+"-"+phone2);
		
		String birth=request.getParameter("birth");
		String birth1=request.getParameter("birth1");
		String birth2=request.getParameter("birth2");
		mvo.setBirth(birth+"-"+birth1+"-"+birth2);
		
		String email_id=request.getParameter("email_id");
		String email_juso=request.getParameter("email_juso");
		mvo.setEmail(email_id+"@"+email_juso);
		
		mapper.member_input_ok(mvo);
		return "/login/login";
	}

	@Override
	public void userid_check(HttpServletRequest request, PrintWriter out) 
	{
		String userid=request.getParameter("userid");
		int cnt=mapper.userid_check(userid);
		out.print(cnt);
	}

}
