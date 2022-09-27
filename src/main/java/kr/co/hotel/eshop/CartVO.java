package kr.co.hotel.eshop;

public class CartVO {
	private int id, su;
	private String userid, pcode, inday;
	
	/* product테이블의 join필드 */
	private int price, halin, baefee, juk, psu;	// psu는 재고수량
	private String title, fimg;	// fimg=1번째 메인이미지
	
	/* 장바구니 배송상품/모바일상품 개수 */
	private int cnt1, cnt2;
	
	public int getCnt1() {
		return cnt1;
	}
	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}
	public int getCnt2() {
		return cnt2;
	}
	public void setCnt2(int cnt2) {
		this.cnt2 = cnt2;
	}
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
	public int getJuk() {
		return juk;
	}
	public void setJuk(int juk) {
		this.juk = juk;
	}
	public int getPsu() {
		return psu;
	}
	public void setPsu(int psu) {
		this.psu = psu;
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
	public int getSu() {
		return su;
	}
	public void setSu(int su) {
		this.su = su;
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
