package kr.co.hotel.diningresv;

public class DiningResvVO {
	
	private int dr_id, dr_stayhalin, dr_total, dr_state;
	private String dr_time, dr_type, dr_extrarq, dr_date;
    // 다이닝 id
	private int dining_id;
    // userid
	private String userid;
	
	public int getDr_id() {
		return dr_id;
	}
	public void setDr_id(int dr_id) {
		this.dr_id = dr_id;
	}
	public int getDr_stayhalin() {
		return dr_stayhalin;
	}
	public void setDr_stayhalin(int dr_stayhalin) {
		this.dr_stayhalin = dr_stayhalin;
	}
	public int getDr_total() {
		return dr_total;
	}
	public void setDr_total(int dr_total) {
		this.dr_total = dr_total;
	}
	public int getDr_state() {
		return dr_state;
	}
	public void setDr_state(int dr_state) {
		this.dr_state = dr_state;
	}
	public String getDr_time() {
		return dr_time;
	}
	public void setDr_time(String dr_time) {
		this.dr_time = dr_time;
	}
	public String getDr_type() {
		return dr_type;
	}
	public void setDr_type(String dr_type) {
		this.dr_type = dr_type;
	}
	public String getDr_extrarq() {
		return dr_extrarq;
	}
	public void setDr_extrarq(String dr_extrarq) {
		this.dr_extrarq = dr_extrarq;
	}
	public String getDr_date() {
		return dr_date;
	}
	public void setDr_date(String dr_date) {
		this.dr_date = dr_date;
	}
	public int getDining_id() {
		return dining_id;
	}
	public void setDining_id(int dining_id) {
		this.dining_id = dining_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	

}
