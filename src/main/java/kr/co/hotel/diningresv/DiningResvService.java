package kr.co.hotel.diningresv;

import javax.servlet.http.HttpServletRequest;

public interface DiningResvService {
	
	public String dining_reserve(HttpServletRequest request);

	public String getCalendar(HttpServletRequest request);

}
