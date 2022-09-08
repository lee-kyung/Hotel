package kr.co.hotel.weddingresv;

import java.time.LocalDate;
import java.util.ArrayList;

public interface WeddingResvMapper {

	public ArrayList<WeddingResvTimeVO> gettime();

	public ArrayList<WeddingResvTimeVO> gethall_name();

	
	
	
	
	
	public WeddingResvVO getcheck(String wresv_tid, String wresv_cday, String wt_time);

	public void weddingReserve_ok(LocalDate dday, WeddingResvVO wrvo);

	
	
}
