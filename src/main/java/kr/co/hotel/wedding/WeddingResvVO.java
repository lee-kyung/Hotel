package kr.co.hotel.wedding;

public class WeddingResvVO {

	private int wresv_id, state;
	private String wresv_cday, wresv_day,wresv_wday,wresv_content, userid, wresv_time, wresv_hall, wresv_name, wresv_phone, wresv_inwon;
	
	// weddingtime 테이블의 wt_time
	private String wt_time;
	
	// wedding 테이블의 wed_hall 추가
	private String wed_hall;
	
	
	public String getWed_hall() {
		return wed_hall;
	}
	public void setWed_hall(String wed_hall) {
		this.wed_hall = wed_hall;
	}
	public String getWresv_hall() {
		return wresv_hall;
	}
	public void setWresv_hall(String wresv_hall) {
		this.wresv_hall = wresv_hall;
	}
	public String getWresv_time() {
		return wresv_time;
	}
	public void setWresv_time(String wresv_time) {
		this.wresv_time = wresv_time;
	}

	public String getWt_time() {
		return wt_time;
	}
	public void setWt_time(String wt_time) {
		this.wt_time = wt_time;
	}

	public int getWresv_id() {
		return wresv_id;
	}
	public void setWresv_id(int wresv_id) {
		this.wresv_id = wresv_id;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getWresv_cday() {
		return wresv_cday;
	}
	public void setWresv_cday(String wresv_cday) {
		this.wresv_cday = wresv_cday;
	}
	public String getWresv_day() {
		return wresv_day;
	}
	public void setWresv_day(String wresv_day) {
		this.wresv_day = wresv_day;
	}
	public String getWresv_wday() {
		return wresv_wday;
	}
	public void setWresv_wday(String wresv_wday) {
		this.wresv_wday = wresv_wday;
	}
	public String getWresv_content() {
		return wresv_content;
	}
	public void setWresv_content(String wresv_content) {
		this.wresv_content = wresv_content;
	}

	public String getWresv_name() {
		return wresv_name;
	}
	public void setWresv_name(String wresv_name) {
		this.wresv_name = wresv_name;
	}
	public String getWresv_phone() {
		return wresv_phone;
	}
	public void setWresv_phone(String wresv_phone) {
		this.wresv_phone = wresv_phone;
	}
	public String getWresv_inwon() {
		return wresv_inwon;
	}
	public void setWresv_inwon(String wresv_inwon) {
		this.wresv_inwon = wresv_inwon;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
}
