package kr.co.hotel.gongji;

import java.util.ArrayList;

public interface GongjiMapper {

	public void gongji_write_ok(GongjiVO gvo);

	public ArrayList<GongjiVO> gongji_list();

	public GongjiVO gongji_content(String id);

	public void gongji_update_ok(GongjiVO gvo);

	public void gongji_delete(String id);

	public int getGongjiChong(int pcnt);

	public ArrayList<FaqVO> faq_list();

	public int getFaqChong(int pcnt);

	public void faq_write_ok(FaqVO fvo);

	public FaqVO faq_update(String id);

	public void faq_update_ok(FaqVO fvo);

	public void faq_delete(String id);

}
