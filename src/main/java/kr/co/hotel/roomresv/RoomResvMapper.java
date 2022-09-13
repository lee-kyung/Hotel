package kr.co.hotel.roomresv;

<<<<<<< HEAD
public interface RoomResvMapper {
	
=======
import java.util.ArrayList;
>>>>>>> branch 'main' of https://github.com/ey0k/hotel.git

import kr.co.hotel.room.RoomVO;

public interface RoomResvMapper {
	public ArrayList<RoomVO> room_resv();
	public RoomVO room_resvnext(String rcode);
	
}
