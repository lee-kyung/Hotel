package kr.co.hotel.login;

import kr.co.hotel.member.MemberVO;

public interface LoginMapper {
	public MemberVO login_ok(MemberVO mvo);
	
	public Integer checkCart(String cookievalue);
	public void cart_chgUserid(String userid, String cookievalue);
	public void cart_delDupli();
}
