package kr.co.hotel.admin;

import java.util.ArrayList;

import kr.co.hotel.diningresv.DiningResvVO;
import kr.co.hotel.eshop.GumaeVO;
import kr.co.hotel.member.MemberVO;
import kr.co.hotel.roomresv.RoomResvVO;
import kr.co.hotel.wedding.WeddingResvVO;


public interface AdminMapper {
	public ArrayList<MemberVO> memberlist();
	public ArrayList<RoomResvVO> getroombk();
	public ArrayList<DiningResvVO> getdiningresv();
	public ArrayList<WeddingResvVO> getweddingresv(); 
	public ArrayList<GumaeVO> getgumae(); 
	
	
	public ArrayList<RoomResvVO> rlist(String sel,String sword,int start,int pcnt);
	public int getRChong(int pcnt,String sel,String sword);
	
	public ArrayList<WeddingResvVO> wlist(String sel,String sword,int start,int pcnt,String oby);
	public int getWChong(int pcnt,String sel,String sword);
	
	public ArrayList<DiningResvVO> dlist(String sel,String sword,int start,int pcnt);
	public int getDChong(int pcnt,String sel,String sword);
	
	public ArrayList<GumaeVO> glist(String sel,String sword,int start,int pcnt);
	public int getGChong(int pcnt,String sel,String sword);
}
