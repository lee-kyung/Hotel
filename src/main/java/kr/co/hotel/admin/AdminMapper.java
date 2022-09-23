package kr.co.hotel.admin;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

import kr.co.hotel.diningresv.DiningResvVO;
import kr.co.hotel.eshop.GumaeVO;
import kr.co.hotel.member.MemberVO;
import kr.co.hotel.roomresv.RoomResvVO;
import kr.co.hotel.wedding.WeddingResvVO;


public interface AdminMapper {
	public ArrayList<MemberVO> memberlist();

// admin첫 화면에서 최신 5개 예약 보이게 
	public ArrayList<RoomResvVO> getroombk();
	public ArrayList<DiningResvVO> getdiningresv();
	public ArrayList<WeddingResvVO> getweddingresv(); 
	public ArrayList<GumaeVO> getgumae(); 
	
// 회원목록 각각 페이지에서 보이게
	public ArrayList<RoomResvVO> rlist(String sel,String sword,int start,int pcnt);
	public int getRChong(int pcnt,String sel,String sword);
	
	public ArrayList<WeddingResvVO> wlist(String sel,String sword,int start,int pcnt,String oby);
	public int getWChong(int pcnt,String sel,String sword);
	
	public ArrayList<DiningResvVO> dlist(String sel,String sword,int start,int pcnt);
	public int getDChong(int pcnt,String sel,String sword);
	
	public ArrayList<GumaeVO> glist(String sel,String sword,int start,int pcnt);
	public int getGChong(int pcnt,String sel,String sword);
	
// 상태 변경
	public void bstatechange(Date date);
	
}
