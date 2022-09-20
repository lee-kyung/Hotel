package kr.co.hotel.diningresv;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.co.hotel.dining.DiningVO;

public interface DiningResvMapper {

	public ArrayList<DiningVO> dining_reserve();
	public DiningVO dining_reserve_next(String id);
	public void dining_reserve_ok(DiningResvVO drvo);
	public void getcheck(String y, String m, String d, HttpServletRequest request);

}
