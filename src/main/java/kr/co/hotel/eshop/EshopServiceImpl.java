package kr.co.hotel.eshop;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		String opt="<option>"+URLEncoder.encode("하위분류")+"</option>";
		for(int i=0;i<list.size();i++) {
			PsoVO psvo=list.get(i);
			opt=opt+"<option value='"+psvo.getCode()+"'>"+URLEncoder.encode(psvo.getTitle())+"</option>";
		}
		out.print(opt);
	}

	@Override
	public void getpcode(HttpServletRequest request, PrintWriter out) {
		/* 뒤3자리가 1씩 증가하는 상품코드를 완성하여 보내기 */
		out.print(mapper.getpcode(request.getParameter("pcode1")));
	}

	@Override
	public String pro_write_ok(HttpServletRequest request) {
		/* MultipartRequest로 form태그의 값들을 가져와 ProductVO에 넣기 */
		String path=request.getRealPath("resources/eshop_img");
		int size=1024*1024*30;
		DefaultFileRenamePolicy rename=new DefaultFileRenamePolicy();		
		ProductVO pvo=new ProductVO();
		try {
			MultipartRequest multi=new MultipartRequest(request, path, size, "utf-8", rename);
			
			pvo.setPcode(multi.getParameter("pcode"));
			pvo.setTitle(multi.getParameter("title"));
			pvo.setImg1(multi.getFilesystemName("img1"));
			pvo.setImg2(multi.getFilesystemName("img2"));
			pvo.setPrice(Integer.parseInt(multi.getParameter("price")));
			pvo.setHalin(Integer.parseInt(multi.getParameter("halin")));
			pvo.setJuk(Integer.parseInt(multi.getParameter("juk")));
			pvo.setSu(Integer.parseInt(multi.getParameter("su")));
			pvo.setBaefee(Integer.parseInt(multi.getParameter("baefee")));
			pvo.setBuyday(multi.getParameter("buyday"));
			pvo.setOpt1(multi.getParameter("opt1"));
			pvo.setOpt2(multi.getParameter("opt2"));
			pvo.setOpt3(multi.getParameter("opt3"));
		}
		catch(Exception e) {
			return "redirect:/eshop/error";
		}
		mapper.pro_write_ok(pvo);
		return "redirect:/eshop/pro_list";
	}

	@Override
	public String pro_list(HttpServletRequest request, Model model) {
		String pdae=request.getParameter("pdae");
		model.addAttribute("list", mapper.pro_list(pdae));
		model.addAttribute("pdae", pdae);	// 배너사진과 문구를 구별하기 위한 pdae값
		return "/eshop/pro_list";
	}

}
