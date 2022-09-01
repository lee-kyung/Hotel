package kr.co.hotel.eshop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
@Qualifier("es")
public class EshopServiceImpl implements EshopService {
	@Autowired
	private EshopMapper mapper;
}
