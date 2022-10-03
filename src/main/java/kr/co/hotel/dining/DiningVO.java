package kr.co.hotel.dining;

public class DiningVO {

	private int id, dine_su, dine_adult, dine_child;
	
	private String dcode, writeday;
	
	// count값 증가
	private int cnt;
	private String dine_type;
	

	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	/*public String getDine_time() {
		return dine_time;
	}
	public void setDine_time(String dine_time) {
		this.dine_time = dine_time;
	}*/
	public String getDcode() {
		return dcode;
	}
	public void setDcode(String dcode) {
		this.dcode = dcode;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDine_su() {
		return dine_su;
	}
	public void setDine_su(int dine_su) {
		this.dine_su = dine_su;
	}
	public int getDine_adult() {
		return dine_adult;
	}
	public void setDine_adult(int dine_adult) {
		this.dine_adult = dine_adult;
	}
	public int getDine_child() {
		return dine_child;
	}
	public void setDine_child(int dine_child) {
		this.dine_child = dine_child;
	}

	public String getDine_type() {
		return dine_type;
	}
	public void setDine_type(String dine_type) {
		this.dine_type = dine_type;
	}

}
