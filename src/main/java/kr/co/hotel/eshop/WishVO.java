package kr.co.hotel.eshop;

public class WishVO {
	private int id;
	private String userid, pcode, inday;
	
	/* product테이블의 join필드 */
	private int price, halin, baefee;
	private String title, fimg;	// fimg=1번째 메인이미지
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getHalin() {
		return halin;
	}
	public void setHalin(int halin) {
		this.halin = halin;
	}
	public int getBaefee() {
		return baefee;
	}
	public void setBaefee(int baefee) {
		this.baefee = baefee;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFimg() {
		return fimg;
	}
	public void setFimg(String fimg) {
		this.fimg = fimg;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getInday() {
		return inday;
	}
	public void setInday(String inday) {
		this.inday = inday;
	}
}
