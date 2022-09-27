package kr.co.hotel.eshop;

public class GumaeVO {
	private int id, total_su, total_price, pay_sudan, state;
	private String jumuncode, userid, pcode, pname, pphone, pemail, bname, bphone, bzip, bjuso, bjuso_etc, buyday;
	
	/* 1개 이상의 정보를 구분자(,)로 분리해서 저장하기 → pcode, su, price */
	private String su_imsi, price_imsi;
	
	/* cart에서 온 gchk변수 */
	private int gchk;
	
	/* product테이블의 필드 */
	private String pimg, title;
	
	/*eshop_gumae의 cnt*/
	private int cnt;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getTotal_su() {
		return total_su;
	}
	public void setTotal_su(int total_su) {
		this.total_su = total_su;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getSu_imsi() {
		return su_imsi;
	}
	public void setSu_imsi(String su_imsi) {
		this.su_imsi = su_imsi;
	}
	public String getPrice_imsi() {
		return price_imsi;
	}
	public void setPrice_imsi(String price_imsi) {
		this.price_imsi = price_imsi;
	}
	public int getGchk() {
		return gchk;
	}
	public void setGchk(int gchk) {
		this.gchk = gchk;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPay_sudan() {
		return pay_sudan;
	}
	public void setPay_sudan(int pay_sudan) {
		this.pay_sudan = pay_sudan;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getJumuncode() {
		return jumuncode;
	}
	public void setJumuncode(String jumuncode) {
		this.jumuncode = jumuncode;
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
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPphone() {
		return pphone;
	}
	public void setPphone(String pphone) {
		this.pphone = pphone;
	}
	public String getPemail() {
		return pemail;
	}
	public void setPemail(String pemail) {
		this.pemail = pemail;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBphone() {
		return bphone;
	}
	public void setBphone(String bphone) {
		this.bphone = bphone;
	}
	public String getBzip() {
		return bzip;
	}
	public void setBzip(String bzip) {
		this.bzip = bzip;
	}
	public String getBjuso() {
		return bjuso;
	}
	public void setBjuso(String bjuso) {
		this.bjuso = bjuso;
	}
	public String getBjuso_etc() {
		return bjuso_etc;
	}
	public void setBjuso_etc(String bjuso_etc) {
		this.bjuso_etc = bjuso_etc;
	}
	public String getBuyday() {
		return buyday;
	}
	public void setBuyday(String buyday) {
		this.buyday = buyday;
	}
}
