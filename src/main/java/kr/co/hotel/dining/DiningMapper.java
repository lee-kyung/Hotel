package kr.co.hotel.dining;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public interface DiningMapper {
	// 관리자 상품등록
	public ArrayList<DiningVO> dining_write();
	public void dining_write_ok(DiningVO dvo);
	
	// 관리자 상품 목록 및 수정, 삭제
	public ArrayList<DiningVO> dining_list();
	public DiningVO dining_update(String id);
	public void dining_update_ok(DiningVO dvo, HttpServletRequest request);
	public ArrayList<DiningVO> dining_content(String id);
	public void dining_delete(String id);
	

}
