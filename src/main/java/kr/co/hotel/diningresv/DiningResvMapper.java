package kr.co.hotel.diningresv;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.hotel.dining.DiningVO;
import kr.co.hotel.room.RoomVO;

public interface DiningResvMapper {

	public ArrayList<DiningVO> dining_reserve();
	
	public ArrayList<DiningResvVO> getDresv(String start, String end);
	
	public ArrayList<DiningResvVO> getDTresv(String dd, String dt);
	
	/*public ArrayList<DiningVO> getDineAvail(String dine_type);*/
	
	public DiningVO dining_reserve_next(String dine_type);
	
	// old
	public DiningVO dining_reserve_next_old(String id);
	//
	
	public void dining_reserve_ok(DiningResvVO drvo);
	
	public Integer getBid(); 

	public DiningResvVO dining_reserve_check(String bid);
	
/*	public void getcheck(String y, String m, String d);
	public void getEmpty(String dday, String bang_id);*/
}
