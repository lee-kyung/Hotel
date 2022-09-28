package kr.co.hotel.room;

import java.util.ArrayList;

public interface RoomMapper {
	public ArrayList<RdaeVO>room_write();
	public Integer getbunho(String code);
	public void room_write_ok(RoomVO rvo);
	
	public ArrayList<RoomVO>rooms(String code);
	public ArrayList<RoomVO>room_content(String code);
	public RoomVO get_room(String rcode);

	public ArrayList<RoomVO>room_list();
	
	public RoomVO room_update(String id);
	public void room_update_ok(RoomVO rvo);
	
	public void room_disable(String id);
	
	public void room_delete(String id);
	public String getrpimg(String id);
	
	
	
}
