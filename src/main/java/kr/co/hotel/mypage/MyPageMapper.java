package kr.co.hotel.mypage;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;

import kr.co.hotel.diningresv.DiningResvVO;
import kr.co.hotel.eshop.GumaeVO;
import kr.co.hotel.member.MemberVO;
import kr.co.hotel.roomresv.RoomResvVO;
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

	public int getWeddingChong(int pcnt, String userid);

	public ArrayList<WeddingResvVO> wedding_resv(String userid, int start, int pcnt);

	public ArrayList<WeddingResvVO> wedding_resv_search(String userid, String cal_in, String cal_out);

	public void weddingR_state_change(String wresv_id, String state);

	public void Wstate_complete_change(Date date);

	public int getDineChong(int pcnt, String userid);

	public ArrayList<DiningResvVO> dine_resv(String userid, int start, int pcnt);

	public ArrayList<DiningResvVO> dine_resv_search(String userid, String cal_in, String cal_out);

	public void dineR_state_change(String dr_id, String dr_state);

	public void Dstate_complete_change(Date date);

	public int getEshopGChong(int pcnt, String userid);

	public ArrayList<GumaeVO> eshop_gumae(String userid, int start, int pcnt);

	public ArrayList<GumaeVO> eshop_gumae_search(String userid, String cal_in, String cal_out);

	public void eshopG_state_change(String id, String state);

	public int getroomChong(int pcnt, String userid);

	public ArrayList<RoomResvVO> room_resv(String userid, int start, int pcnt);

	public ArrayList<RoomResvVO> room_resv_search(String userid, String cal_in, String cal_out);

	public void roomR_state_change(String id, String bstate);

	public void Rstate_complete_change(Date date);

	public ArrayList<RoomResvVO> roomR_Recent(String userid);

	public ArrayList<DiningResvVO> dineR_Recent(String userid);

	public ArrayList<WeddingResvVO> weddingR_Recent(String userid);

	public ArrayList<GumaeVO> eshopG_Recent(String userid);

	public WeddingResvVO wedding_content(String userid, String wresv_id);

	public RoomResvVO room_content(String userid, String id);

	public DiningResvVO dine_content(String userid, String dr_id);

	public GumaeVO eshop_content(String userid, String id);





}
