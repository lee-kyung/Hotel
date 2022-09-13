package kr.co.hotel.weddingresv;

import java.time.LocalDate;
import java.util.ArrayList;

public interface WeddingResvMapper {

	public ArrayList<WeddingResvTimeVO> gettime();

	public ArrayList<WeddingResvTimeVO> gethall_name();

	public void weddingReserve_ok(WeddingResvVO wrvo);

	public Integer getcheck(WeddingResvVO wrvo);

	
	
}
