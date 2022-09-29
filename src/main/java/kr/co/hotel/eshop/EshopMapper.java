package kr.co.hotel.eshop;

import java.util.ArrayList;

import kr.co.hotel.member.MemberVO;

public interface EshopMapper {
	public ArrayList<PdaeVO> pro_write();
	public ArrayList<PsoVO> getso(String daecode);
	public Integer getpcode(String pcode1);
	public void pro_write_ok(ProductVO pvo);
	
	public ArrayList<ProductVO> pro_list(String userid, String pcode, String osel, int pindex, int psel);
	public ArrayList<ProductVO> pro_list2(String pcode, String osel, int pindex, int psel);
	
	public ProductVO pro_content(String pcode);
	
	public void wish_add(String userid, String pcode);
	public void wish_del(String userid, String pcode);
	public Integer checkWish(String userid, String pcode);
	
	public void cart_add(String userid, String pcode, int su);
	public void cart_del(String userid, String pcode);
	public Integer checkCart(String userid, String pcode);
	public void cart_suadd(int su, String userid, String pcode);
	public ArrayList<CartVO> cart(String userid, String p);
	public void wishcart_del(String ad, String id);
	
	public ProductVO pro_gumae(String pcode);
	public MemberVO getInfo(String userid);
	
	public ArrayList<WishVO> wish(String userid, String osel);
	public void cart_delDupli();
	
	public void pro_gumae_ok(GumaeVO gvo);
	public Integer getJumun();
	public void suMinusPlus(String su, String pcode);
	public String getName(String jumuncode);
	
	public ArrayList<ProductVO> pro_adlist(String ssel, String sword, String osel, int pindex, int psel);
	public int total(int psel, String ssel, String sword);
	public ProductVO pro_adcontent(String id);
}