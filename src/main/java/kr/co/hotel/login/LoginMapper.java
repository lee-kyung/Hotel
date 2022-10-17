package kr.co.hotel.login;

import kr.co.hotel.member.MemberVO;

public interface LoginMapper {
	public MemberVO login_ok(MemberVO mvo);
	
	public Integer checkCart(String cookievalue);
	public void cart_chgUserid(String userid, String cookievalue);
	public void cart_delDupli();
	public void cart_addSu();
	
	public MemberVO kuser_info(MemberVO mvo);
	public Integer getKid();
	public void kmem_in(MemberVO mvo);

	public String userid_search_ok(MemberVO mvo);

	public String pwd_search_ok(MemberVO mvo);
}
