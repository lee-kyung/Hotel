package kr.co.hotel.wedding;

import java.util.ArrayList;

public interface WeddingMapper {

	public void wed_hall_write_ok(WeddingVO wvo);

	public ArrayList<WeddingVO> wedding_hall(String id);

	public WeddingVO content(String id);
}
