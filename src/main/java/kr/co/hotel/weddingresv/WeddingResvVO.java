package kr.co.hotel.weddingresv;

public class WeddingResvVO {

	private int wresv_id, state, wresv_tid;
	private String wresv_cday, wresv_day,wresv_wday,wresv_content, wresv_info,userid, wresv_time;
	
	// weddingtime 테이블의 wt_time
	private String wt_time;
	
	private int cnt;
	
	
	
	
	public String getWresv_time() {
		return wresv_time;
	}
	public void setWresv_time(String wresv_time) {
		this.wresv_time = wresv_time;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getWt_time() {
		return wt_time;
	}
	public void setWt_time(String wt_time) {
		this.wt_time = wt_time;
	}
	public int getWresv_tid() {
		return wresv_tid;
	}
	public void setWresv_tid(int wresv_tid) {
		this.wresv_tid = wresv_tid;
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
	public String getWresv_info() {
		return wresv_info;
	}
	public void setWresv_info(String wresv_info) {
		this.wresv_info = wresv_info;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
}
