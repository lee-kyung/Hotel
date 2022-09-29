package kr.co.hotel.gongji;

import java.util.ArrayList;

public interface GongjiMapper {

	public void gongji_write_ok(GongjiVO gvo);

	public ArrayList<GongjiVO> gongji_list();

	public GongjiVO gongji_content(String id);

	public void gongji_update_ok(GongjiVO gvo);

	public void gongji_delete(String id);

	public int getGongjiChong(int pcnt);

}
