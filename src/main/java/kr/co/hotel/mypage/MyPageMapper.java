package kr.co.hotel.mypage;

import kr.co.hotel.member.MemberVO;

public interface MyPageMapper {

	public int myprofile_pwd_ok(String userid, String pwd);

	public MemberVO myprofile(String userid);

	public void myprofile_edit_ok(MemberVO mvo);

//	public String getPwd(String userid);

	public void mypwd_change_ok(String newpwd, String userid);


}
