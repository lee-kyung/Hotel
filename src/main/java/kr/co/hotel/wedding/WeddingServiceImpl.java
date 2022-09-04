package kr.co.hotel.wedding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
@Qualifier("ws")
public class WeddingServiceImpl implements WeddingService{

	@Autowired
	private WeddingMapper mapper;
}
