package kr.co.hotel.diningresv;

import java.util.ArrayList;

import kr.co.hotel.dining.DiningVO;

public interface DiningResvMapper {
	
	/*public ArrayList<DiningVO> getTime();*/

	public ArrayList<DiningVO> dining_reserve();
	public DiningVO dining_reserve_next(String id);

}
