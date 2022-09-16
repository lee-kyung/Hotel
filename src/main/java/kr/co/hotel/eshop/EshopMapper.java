package kr.co.hotel.eshop;

import java.util.ArrayList;

public interface EshopMapper {
	public ArrayList<PdaeVO> pro_write();
	public ArrayList<PsoVO> getso(String daecode);
	public Integer getpcode(String pcode1);
	public void pro_write_ok(ProductVO pvo);
	public ArrayList<ProductVO> pro_list(String userid, String pcode, String osel, int pindex, int psel);
	public ArrayList<ProductVO> pro_list2(String pcode, String osel, int pindex, int psel);
	public int total(int psel);
	
	public ProductVO pro_content(String pcode);
	public void wish_add(String userid, String pcode);
	public void wish_del(String userid, String pcode);
	public Integer checkWish(String userid, String pcode);
	public ArrayList<ProductVO> getPcode(String pcode, int pindex, int psel);
}