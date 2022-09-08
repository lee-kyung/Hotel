package kr.co.hotel.eshop;

import java.util.ArrayList;

public interface EshopMapper {
	public ArrayList<PdaeVO> pro_write();
	public ArrayList<PsoVO> getso(String daecode);
}