package kr.co.hotel.diningresv;

public class DiningResvVO {
	

	private int dr_id, dr_state;

	private String dr_time, dine_type, dr_extrarq, dr_date, email, dr_total;


	// userid
	private String userid;

	// phone
	private String p1, p2, p3;
	
	// 예약 인원 타입
	private String adult, child, baby;
	// 결제일
	private String writeday;
	// 예약자 이름
	private String bkname;
	
	// 예약번호
	private String bid;
	

    public String getBkname() {
		return bkname;
	}
	public void setBkname(String bkname) {
		this.bkname = bkname;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getWriteday() {

		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public String getDr_total() {
		return dr_total;
	}
	public void setDr_total(String dr_total) {
		this.dr_total = dr_total;
	}
	public String getAdult() {
		return adult;
	}
	public void setAdult(String adult) {
		this.adult = adult;
	}
	public String getChild() {
		return child;
	}
	public void setChild(String child) {
		 this.child = child;
	}
	public String getBaby() {
		return baby;
	}
	public void setBaby(String baby) {
		this.baby = baby;
	}
	public String getDine_type() {
		return dine_type;
	}
	public void setDine_type(String dine_type) {
		this.dine_type = dine_type;
	}
	public String getDr_time() {
		return dr_time;
	}
	public void setDr_time(String dr_time) {
		this.dr_time = dr_time;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getP1() {
		return p1;
	}
	public void setP1(String p1) {
		this.p1 = p1;
	}
	public String getP2() {
		return p2;
	}
	public void setP2(String p2) {
		this.p2 = p2;
	}
	public String getP3() {
		return p3;
	}
	public void setP3(String p3) {
		this.p3 = p3;
	}
	
	
	
	public int getDr_id() {
		return dr_id;
	}
	public void setDr_id(int dr_id) {
		this.dr_id = dr_id;
	}

	public int getDr_state() {
		return dr_state;
	}
	public void setDr_state(int dr_state) {
		this.dr_state = dr_state;
	}
	/*public String getDr_timeValue() {
		if(dr_time.equals("1")) {
			return "8:00";
		}
		else if(dr_time.equals("2")) {
			return "10:00";
		}
		else if(dr_time.equals("3")) {
			return "13:00";
		}
		else if(dr_time.equals("4")) {
			return "15:00";
		}
		else if(dr_time.equals("5")) {
			return "16:00";
		}
		else if(dr_time.equals("6")) {
			return "18:00";
		}
		return null;
		return dr_time;
	}
	public void setDr_time(String dr_time) {
		this.dr_time = dr_time;
	}*/

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

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	

}
