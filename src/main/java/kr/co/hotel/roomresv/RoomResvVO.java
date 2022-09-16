package kr.co.hotel.roomresv;

public class RoomResvVO {
	private int id,binwon,bextbed,bmeal,btotal,bstate;
	private String checkin,checkout,userid,bkdate,bkname,bkphone,bid,rcode;
	
	// 투숙일
	private int suk;
		
	
	public int getSuk() {
		return suk;
	}
	public void setSuk(int suk) {
		this.suk = suk;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRcode() {
		return rcode;
	}
	public void setRcode(String rcode) {
		this.rcode = rcode;
	}
	public int getBinwon() {
		return binwon;
	}
	public void setBinwon(int binwon) {
		this.binwon = binwon;
	}
	public int getBextbed() {
		return bextbed;
	}
	public void setBextbed(int bextbed) {
		this.bextbed = bextbed;
	}
	public int getBmeal() {
		return bmeal;
	}
	public void setBmeal(int bmeal) {
		this.bmeal = bmeal;
	}
	public int getBtotal() {
		return btotal;
	}
	public void setBtotal(int btotal) {
		this.btotal = btotal;
	}
	public int getBstate() {
		return bstate;
	}
	public void setBstate(int bstate) {
		this.bstate = bstate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getBkdate() {
		return bkdate;
	}
	public void setBkdate(String bkdate) {
		this.bkdate = bkdate;
	}
	public String getBkname() {
		return bkname;
	}
	public void setBkname(String bkname) {
		this.bkname = bkname;
	}
	public String getBkphone() {
		return bkphone;
	}
	public void setBkphone(String bkphone) {
		this.bkphone = bkphone;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	
	
}
