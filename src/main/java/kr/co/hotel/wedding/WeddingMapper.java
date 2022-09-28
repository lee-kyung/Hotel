package kr.co.hotel.wedding;

import java.util.ArrayList;


public interface WeddingMapper {

	public void wed_write_ok(WeddingVO wvo);

	public WeddingVO wedding_hall(String id);

	public ArrayList<WeddingVO> getHall();
	
	public ArrayList<WeddingResvTimeVO> gettime();

	public ArrayList<WeddingResvVO> gethall_name();

	public void weddingReserve_ok(WeddingResvVO wrvo);

	public ArrayList<WeddingResvVO> wresv_cal(WeddingResvVO wrvo);

	public ArrayList<WeddingResvTimeVO> wresv_cal2(String wresv_cday);

	public Integer getWresv_code();

	public WeddingResvVO wed_resv_check(String wresv_code);

	public ArrayList<WeddingVO> wed_list();

	public WeddingVO wed_content(String id);


	
	
	
}
