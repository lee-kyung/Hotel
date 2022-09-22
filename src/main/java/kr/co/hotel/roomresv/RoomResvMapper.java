package kr.co.hotel.roomresv;

import java.util.ArrayList;

import kr.co.hotel.room.RoomVO;

public interface RoomResvMapper {
	public ArrayList<RoomVO> room_resv();
	public RoomVO room_resvnext(String rcode);
	public void room_resv_ok(RoomResvVO rsvo);
	public Integer getBid(String userid); 
	public ArrayList<RoomVO> getRoomAvail(String checkin, String adult);
	public RoomResvVO room_bkconfirm(String bid);
	
	/*public ArrayList<RoomVO> getRmax(String rcode);*/
/*	public ArrayList<RoomVO> getCnt(String checkin);*/
	

	
	
}