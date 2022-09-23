package kr.co.hotel.mypage;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;

import kr.co.hotel.member.MemberVO;
import kr.co.hotel.wedding.WeddingResvVO;

public interface MyPageMapper {

	public int myprofile_pwd_ok(String userid, String pwd);

	public MemberVO myprofile(String userid);

	public void myprofile_edit_ok(MemberVO mvo);

//	public String getPwd(String userid);

	public void mypwd_change_ok(String newpwd, String userid);

	public int getRoomcount(int y);

	public int getDinecount(int y);

	public int getEshopcount(int y);

	public ArrayList<WeddingResvVO> wedding_resv(String userid);

	public ArrayList<WeddingResvVO> wedding_resv_search(String userid, String cal_in, String cal_out);

	public void weddingR_state_change(String wresv_id, String state);

	public void state_complete_change(Date date);


}
