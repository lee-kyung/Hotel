package kr.co.hotel.room;

import java.util.ArrayList;

public interface RoomMapper {
	public ArrayList<RdaeVO>room_write();
	public Integer getbunho(String code);
	public void room_write_ok(RoomVO rvo);
	public ArrayList<RoomVO>rooms(String code);
	public ArrayList<RoomVO>room_content(String code);
	
	public ArrayList<RoomVO>getRoom();
	public Integer getCnt(String checkin, RoomVO rvo);
	
	
	
	
	
	
	
}
