package kr.co.hotel.roomresv;

import java.util.ArrayList;

import kr.co.hotel.room.RoomVO;

public interface RoomResvMapper {
	public ArrayList<RoomVO> room_resv();
	public RoomVO room_resvnext(String rcode);
	
}
