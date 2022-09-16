package kr.co.hotel.room;

public class RoomVO {
	private int id,rmin,rmax,rprice,rstate,rsu;
	private String rname,rpimg,rcimg,rcode,rtxt2,rview,rbed;
	
	// rtype추가
	private String rtype,code,rtxt;
	
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getRtype() {
		return rtype;
	}
	public void setRtype(String rtype) {
		this.rtype = rtype;
	}
	public String getRview() {
		return rview;
	}
	public int getRsu() {
		return rsu;
	}
	public void setRsu(int rsu) {
		this.rsu = rsu;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRmin() {
		return rmin;
	}
	public void setRmin(int rmin) {
		this.rmin = rmin;
	}
	public int getRmax() {
		return rmax;
	}
	public void setRmax(int rmax) {
		this.rmax = rmax;
	}
	public int getRprice() {
		return rprice;
	}
	public void setRprice(int rprice) {
		this.rprice = rprice;
	}
	public int getRstate() {
		return rstate;
	}
	public void setRstate(int rstate) {
		this.rstate = rstate;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRpimg() {
		return rpimg;
	}
	public void setRpimg(String rpimg) {
		this.rpimg = rpimg;
	}
	public String getRcimg() {
		return rcimg;
	}
	public void setRcimg(String rcimg) {
		this.rcimg = rcimg;
	}
	public String getRcode() {
		return rcode;
	}
	public void setRcode(String rcode) {
		this.rcode = rcode;
	}
	public String getRtxt() {
		return rtxt;
	}
	public void setRtxt(String rtxt) {
		this.rtxt = rtxt;
	}
	public String getRtxt2() {
		return rtxt2;
	}
	public void setRtxt2(String rtxt2) {
		this.rtxt2 = rtxt2;
	}
	public String getRviewValue() {
		if(rview.equals("0")) {
			return "시티";
		}else if(rview.equals("1")) {
			return "마운틴뷰";
		}else if(rview.equals("2")) {
			return "오션뷰";
		}
		return null;
	}
	public void setRview(String rview) {
		this.rview = rview;
	}
	public String getRbed() {
		return rbed;
	}
	public void setRbed(String rbed) {
		this.rbed = rbed;
	}	
}
