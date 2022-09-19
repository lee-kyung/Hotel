package kr.co.hotel.login;

import kr.co.hotel.member.MemberVO;

public interface LoginMapper {
	public MemberVO login_ok(MemberVO mvo);
	
	/*public Integer checkCart(String cookievalue);
	public Integer checkCart_userid(String userid, String cookievalue);
	public void cart_userid_change(String userid, String cookievalue);
	public void cart_del(String cookievalue);
	public void cart_del_duplicate(String userid, String cookievalue);*/
}
