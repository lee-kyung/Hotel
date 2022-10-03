package kr.co.hotel.eshop;

public class ProductVO {
	private int id, price, halin, juk, su, baefee, sold;
	private String pcode, title, fimg, simg, buyday;
	
	private int cnt;	// cnt = fimg의 이미지 개수
	private String img;	// img = fimg의 첫번째 그림
	private String[] imgs;	// 콤마기준으로 자른 fimg의 이미지를 넣을 배열
	
	private String subpcode;	// pcode의 앞5자리(p0101, p0102, p0201, p0202)만 가져오기
	private int wishchk;	// pro_list의 위시리스트 체크
	private int cartchk;	// pro_list의 장바구니 체크
	
	public int getSold() {
		return sold;
	}
	public void setSold(int sold) {
		this.sold = sold;
	}
	public int getCartchk() {
		return cartchk;
	}
	public void setCartchk(int cartchk) {
		this.cartchk = cartchk;
	}
	public int getWishchk() {
		return wishchk;
	}
	public void setWishchk(int wishchk) {
		this.wishchk = wishchk;
	}
	public String getSubpcode() {
		return subpcode;
	}
	public void setSubpcode(String subpcode) {
		this.subpcode = subpcode;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String[] getImgs() {
		return imgs;
	}
	public void setImgs(String[] imgs) {
		this.imgs = imgs;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getJuk() {
		return juk;
	}
	public void setJuk(int juk) {
		this.juk = juk;
	}
	public int getSu() {
		return su;
	}
	public void setSu(int su) {
		this.su = su;
	}
	public int getBaefee() {
		return baefee;
	}
	public void setBaefee(int baefee) {
		this.baefee = baefee;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
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
	public String getSimg() {
		return simg;
	}
	public void setSimg(String simg) {
		this.simg = simg;
	}
	public String getBuyday() {
		return buyday;
	}
	public void setBuyday(String buyday) {
		this.buyday = buyday;
	}
}
