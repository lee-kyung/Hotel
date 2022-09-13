package kr.co.hotel.eshop;

import java.util.ArrayList;

public interface EshopMapper {
	public ArrayList<PdaeVO> pro_write();
	public ArrayList<PsoVO> getso(String daecode);
	public Integer getpcode(String pcode1);
	public void pro_write_ok(ProductVO pvo);
	public ArrayList<ProductVO> pro_list(String pcode, String osel, int pindex, int psel);
	public int total(int psel);
}