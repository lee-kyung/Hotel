package kr.co.hotel.eshop;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
		/* pdae테이블을 읽어와서 view에 전달하기 */
		model.addAttribute("list", mapper.pro_write());
		return "/eshop/pro_write";
	}

	@Override
	public void getso(HttpServletRequest request, PrintWriter out) {
		/* daecode를 이용하여 pso테이블을 읽어오기 */
		ArrayList<PsoVO> list=mapper.getso(request.getParameter("daecode"));
		
		/* option태그를 생성하여 view에 전달하기 */
		String opt="<option>"+URLEncoder.encode("선택")+"</option>";
		for(int i=0;i<list.size();i++) {
			PsoVO psvo=list.get(i);
			opt=opt+"<option value='"+psvo.getCode()+"'>"+URLEncoder.encode(psvo.getTitle())+"</option>";
		}
		out.print(opt);
	}

}
