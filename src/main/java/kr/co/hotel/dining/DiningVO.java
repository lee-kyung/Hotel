package kr.co.hotel.dining;

public class DiningVO {

	private int id, dine_su, dine_adult, dine_child, dine_halin, dining_id;
	
	private String dcode, dine_pimg, dine_cimg;
	
	// count값 증가
		private int cnt;
		private String dine_type;
		

	// 
	private int td;
	
	public int getTd() {
		return td;
	}
	public void setTd(int td) {
		this.td = td;
	}
	public int getDining_id() {
			return dining_id;
		}
		public void setDining_id(int dining_id) {
			this.dining_id = dining_id;
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
	public int getDine_halin() {
		return dine_halin;
	}
	public void setDine_halin(int dine_halin) {
		this.dine_halin = dine_halin;
	}

	public String getDine_type() {
		return dine_type;
	}
	public void setDine_type(String dine_type) {
		this.dine_type = dine_type;
	}
	public String getDine_pimg() {
		return dine_pimg;
	}
	public void setDine_pimg(String dine_pimg) {
		this.dine_pimg = dine_pimg;
	}
	public String getDine_cimg() {
		return dine_cimg;
	}
	public void setDine_cimg(String dine_cimg) {
		this.dine_cimg = dine_cimg;
	}
	
}
