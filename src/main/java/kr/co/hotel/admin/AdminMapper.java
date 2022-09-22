package kr.co.hotel.admin;

import java.util.ArrayList;

import kr.co.hotel.diningresv.DiningResvVO;
import kr.co.hotel.member.MemberVO;
import kr.co.hotel.roomresv.RoomResvVO;
import kr.co.hotel.wedding.WeddingVO;

public interface AdminMapper {
	public ArrayList<MemberVO> memberlist();
	public ArrayList<RoomResvVO> getroombk();
	public ArrayList<DiningResvVO> getdiningresv();
	public ArrayList<WeddingVO> getweddingresv();
	
}
