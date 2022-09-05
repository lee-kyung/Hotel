package kr.co.hotel.eshop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
@Qualifier("es")
public class EshopServiceImpl implements EshopService {
	@Autowired
	private EshopMapper mapper;

	@Override
	public String pro_write(Model model) {
		mapper.pro_write();
		return "redirect:/eshop/pro_list";
	}
}
