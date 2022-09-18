package kr.co.hotel.member;

public interface MemberMapper {

	public void member_input_ok(MemberVO mvo);

	public int userid_check(String userid);

	public MemberVO myprofile(String userid);

	public int myprofile_pwd_ok(String userid, String pwd);

}
