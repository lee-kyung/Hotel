package kr.co.hotel.wedding;

public class WeddingResvTimeVO {

	private int wt_id, wt_state;
	private String wt_time;
	
	// wedding 테이블의 wed_hall 추가
	private String wed_hall;
	
	
	
	
	public String getWed_hall() {
		return wed_hall;
	}
	public void setWed_hall(String wed_hall) {
		this.wed_hall = wed_hall;
	}
	public int getWt_id() {
		return wt_id;
	}
	public void setWt_id(int wt_id) {
		this.wt_id = wt_id;
	}
	public int getWt_state() {
		return wt_state;
	}
	public void setWt_state(int wt_state) {
		this.wt_state = wt_state;
	}
	public String getWt_time() {
		return wt_time;
	}
	public void setWt_time(String wt_time) {
		this.wt_time = wt_time;
	}
	
	
}
