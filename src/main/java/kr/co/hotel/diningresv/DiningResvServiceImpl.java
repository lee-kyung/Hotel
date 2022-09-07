package kr.co.hotel.diningresv;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

@Service
@Qualifier("drs")
public class DiningResvServiceImpl {
	
	@Autowired
	private DiningResvMapper mapper;
	
	@Override
	public String dining_reserve(HttpServletRequest request)
	{
		return "/dining/dining_reserve";
	}

}
