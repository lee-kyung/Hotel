package kr.co.hotel.mypage;

import kr.co.hotel.member.MemberVO;

public interface MyPageMapper {

	public int myprofile_pwd_ok(String userid, String pwd);

	public MemberVO myprofile(String userid);

}
