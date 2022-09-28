package kr.co.hotel.member;

public interface MemberMapper {

	public void member_input_ok(MemberVO mvo);

	public int userid_check(String userid);

	public void member_out(String userid);

}
