package kr.co.hotel.admin;

import java.util.ArrayList;

import kr.co.hotel.diningresv.DiningResvVO;
import kr.co.hotel.member.MemberVO;
import kr.co.hotel.roomresv.RoomResvVO;
import kr.co.hotel.wedding.WeddingResvVO;


public interface AdminMapper {
	public ArrayList<MemberVO> memberlist();
	public ArrayList<RoomResvVO> getroombk();
	public ArrayList<DiningResvVO> getdiningresv();
	public ArrayList<WeddingResvVO> getweddingresv();
	public int getRChong(int pcnt,String sel,String sword); 

	public ArrayList<RoomResvVO> roombk(String sel,String sword,int start,int pcnt);
}
