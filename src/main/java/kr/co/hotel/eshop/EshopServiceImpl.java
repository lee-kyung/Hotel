package kr.co.hotel.eshop;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;

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
		String path=request.getRealPath("resources/img/eshop");
		int size=1024*1024*30;
		DefaultFileRenamePolicy rename=new DefaultFileRenamePolicy();		
		ProductVO pvo=new ProductVO();
		try {
			MultipartRequest multi=new MultipartRequest(request, path, size, "utf-8", rename);
			
			/* multi.getFileNames();로 파일이름을 가져와서 'Enumeration 변수명'에 저장하기 (dto사용X) */
			Enumeration file=multi.getFileNames();
			
			String imgs="";	// '파일명'의 값을 누적하기 때문에 초기값(빈값)을 주기
			while(file.hasMoreElements()) {	// Enumeration은 hasMoreElement()를 통해 다음으로 이동하고,
				String fimg=file.nextElement().toString();	// nextElement()를 통해 저장된 값을 가져오기
				
				/* multi.getFilesystemName("fimg1")로 서버에 저장된 파일이름을 가져오기 */
				if(!fimg.equals("simg"))	// 단, simg도 가져오기 때문에 simg는 빼고 imgs에 담기
				imgs=multi.getFilesystemName(fimg)+","+imgs;	// 테이블의 fname필드에 [파일명, 파일명, 파일명]의 형태로 저장하기
			}
			imgs=imgs.replace("null,", "");	// 'null,'값을 없애기
			
			pvo.setPcode(multi.getParameter("pcode"));
			pvo.setTitle(multi.getParameter("title"));
			pvo.setFimg(imgs);
			pvo.setSimg(multi.getFilesystemName("simg"));
			pvo.setPrice(Integer.parseInt(multi.getParameter("price")));
			pvo.setHalin(Integer.parseInt(multi.getParameter("halin")));
			pvo.setJuk(Integer.parseInt(multi.getParameter("juk")));
			pvo.setSu(Integer.parseInt(multi.getParameter("su")));
			pvo.setBaefee(Integer.parseInt(multi.getParameter("baefee")));
			pvo.setBuyday(multi.getParameter("buyday"));
		}
		catch(Exception e) {
			return "redirect:/eshop/error";
		}
		mapper.pro_write_ok(pvo);
		return "redirect:/eshop/eshop";
	}

	@Override
	public String pro_list(HttpServletRequest request, Model model) {
		String pcode=request.getParameter("pcode");
		
		int page, psel;
		String osel;
		
		/* 페이지의 초기화면값 처리하기 */
		if(request.getParameter("page") == null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		/* 한페이지에 출력할 레코드개수의 초기화면값 처리하기 */
		if(request.getParameter("psel") == null)
			psel=9;
		else
			psel=Integer.parseInt(request.getParameter("psel"));
		
		/* 한페이지에 출력할 레코드의 index값 구하기 */
		int pindex=(page-1)*psel;
		
		/* 정렬말머리의 초기화면값 처리하기*/
		if(request.getParameter("osel") == null)
			osel="id asc";
		else
			osel=request.getParameter("osel");
		
		/* 페이지 이동을 위한 출력 범위 */
		int pstart, pend, parr=10;
		
		pstart=page/parr;	// 페이지 출력 범위 : 1~10, 11~20, 21~30…
		if((page%parr) == 0)
			pstart--;
			
		pstart=(pstart*parr)+1;
		pend=pstart+(parr-1);
		
		/* 총페이지수 구하기 */
		int ptotal=mapper.total(psel);
		
		/* pend가 총페이지수보다 크다면 값 바꾸기 */
		if(pend > ptotal)
			pend=ptotal;

		model.addAttribute("list", mapper.pro_list(pcode, osel, pindex, psel));
		model.addAttribute("pcode", pcode);	// 배너사진과 문구를 구별하기 위한 pcode(pdae 또는 pdaeso)값
		model.addAttribute("page", page);
		model.addAttribute("psel", psel);
		model.addAttribute("osel", osel);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("ptotal", ptotal);
		return "/eshop/pro_list";
	}
	
	@Override
	public String pro_content(HttpServletRequest request, Model model) {
		String pcode=request.getParameter("pcode");
		model.addAttribute("pvo", mapper.pro_content(pcode));
		return "/eshop/pro_content";
	}

}
