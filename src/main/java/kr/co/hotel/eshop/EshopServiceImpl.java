package kr.co.hotel.eshop;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.util.WebUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
@Qualifier("es")
public class EshopServiceImpl implements EshopService {
	@Autowired
	private EshopMapper mapper;

	@Override
	public String pro_write(Model model) {
		model.addAttribute("list", mapper.pro_write());
		return "/eshop/pro_write";
	}

	@Override
	public void getso(HttpServletRequest request, PrintWriter out) {
		ArrayList<PsoVO> list=mapper.getso(request.getParameter("daecode"));
		
		String opt="<option>"+URLEncoder.encode("하위분류")+"</option>";
		for(int i=0;i<list.size();i++) {
			PsoVO psvo=list.get(i);
			opt=opt+"<option value='"+psvo.getCode()+"'>"+URLEncoder.encode(psvo.getTitle())+"</option>";
		}
		out.print(opt);
	}

	@Override
	public void getpcode(HttpServletRequest request, PrintWriter out) {
		out.print(mapper.getpcode(request.getParameter("pcode1")));
	}

	@Override
	public String pro_write_ok(HttpServletRequest request) {		
		String path=request.getRealPath("resources/img/eshop");
		int size=1024*1024*30;
		DefaultFileRenamePolicy rename=new DefaultFileRenamePolicy();		
		ProductVO pvo=new ProductVO();
		try {
			MultipartRequest multi=new MultipartRequest(request, path, size, "utf-8", rename);
			
			Enumeration file=multi.getFileNames();
			String imgs="";
			while(file.hasMoreElements()) {
				String fimg=file.nextElement().toString();
				
				if(!fimg.equals("simg"))
					imgs=multi.getFilesystemName(fimg)+","+imgs;
			}
			
			imgs=imgs.replace("null,", "");
			
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
	public String pro_list(HttpServletRequest request, Model model, HttpSession session) {
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
			osel="sold desc";
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
		//int ptotal=mapper.total(psel);
		
		/* pend가 총페이지수보다 크다면 값 바꾸기 */
		//if(pend > ptotal)
			//pend=ptotal;
		
		String userid="";
		Cookie cookie = WebUtils.getCookie(request, "cookieid");
		if(session.getAttribute("userid") == null && cookie == null)
			model.addAttribute("plist", mapper.pro_list2(pcode, osel, pindex, psel));
		else {
			if(session.getAttribute("userid") == null)
				userid=cookie.getValue();
			else
				userid=session.getAttribute("userid").toString();
			model.addAttribute("plist", mapper.pro_list(userid, pcode, osel, pindex, psel));
		}			
		
		model.addAttribute("pcode", pcode);	// 배너사진과 문구를 구별하기 위한 pcode(pdae 또는 pdaeso)값
		model.addAttribute("page", page);
		model.addAttribute("psel", psel);
		model.addAttribute("osel", osel);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		//model.addAttribute("ptotal", ptotal);
		return "/eshop/pro_list";
	}
	
	@Override
	public String pro_content(HttpServletRequest request, Model model, HttpSession session) {
		String pcode=request.getParameter("pcode");
		ProductVO pvo=mapper.pro_content(pcode);
		
		pvo.setImgs(pvo.getFimg().split(","));
		
		int wishcnt;
		if(session.getAttribute("userid") == null)
			wishcnt=0;
		else {
			String userid=session.getAttribute("userid").toString();
			int chk=mapper.checkWish(userid, pcode);
			if(chk == 0)
				wishcnt=0;
			else
				wishcnt=1;
		}
		model.addAttribute("wishcnt", wishcnt);
		
		String p=pcode.substring(0, 3);
		model.addAttribute("p", p);
		
		model.addAttribute("pvo", pvo);
		return "/eshop/pro_content";
	}

	@Override
	public void wish_add(HttpSession session, HttpServletRequest request, PrintWriter out) {
		String pcode=request.getParameter("pcode");
		mapper.wish_add(session.getAttribute("userid").toString(), pcode);
		out.print("0");
	}

	@Override
	public void wish_del(HttpSession session, HttpServletRequest request, PrintWriter out) {
		String pcode=request.getParameter("pcode");
		mapper.wish_del(session.getAttribute("userid").toString(), pcode);
		out.print("0");
	}

	@Override
	public void cart_add(HttpSession session, HttpServletRequest request, PrintWriter out, HttpServletResponse response) {
		String pcode=request.getParameter("pcode");
		int su;
		if(request.getParameter("su") == null)
			su=1;
		else
			su=Integer.parseInt(request.getParameter("su"));
		
		Cookie cookie = WebUtils.getCookie(request, "cookieid");
		if(session.getAttribute("userid") == null) {
			if(cookie == null) {
				String cookievalue=RandomStringUtils.random(20, true, true);
				Cookie cookieid=new Cookie("cookieid", cookievalue);
			
				cookieid.setPath("/");
				cookieid.setMaxAge(60 * 60 * 1);
				response.addCookie(cookieid);
				
				mapper.cart_add(cookievalue, pcode, su);
			}
			else {
				String cookievalue=cookie.getValue();

				cookie.setPath("/");
				cookie.setMaxAge(60 * 60 * 1);
				response.addCookie(cookie);
				
				int chk=mapper.checkCart(cookievalue, pcode);
				if(chk == 0)
					mapper.cart_add(cookievalue, pcode, su);
				else
					mapper.cart_suadd(su, cookievalue, pcode);
			}
		}
		else {
			String userid=session.getAttribute("userid").toString();

			int chk=mapper.checkCart(userid, pcode);
			if(chk == 0)
				mapper.cart_add(userid, pcode, su);
			else
				mapper.cart_suadd(su, userid, pcode);
		}
		
		String p=pcode.substring(0, 3);	// 메인분류값
		String str="0,"+p;
		out.print(str);
	}
	
	@Override
	public void cart_del(HttpSession session, HttpServletRequest request, PrintWriter out) {
		String pcode=request.getParameter("pcode");
		Cookie cookie = WebUtils.getCookie(request, "cookieid");
		String userid="";
		if(session.getAttribute("userid") == null)
			userid=cookie.getValue();
		else
			userid=session.getAttribute("userid").toString();
		mapper.cart_del(userid, pcode);
		out.print("0");
	}

	@Override
	public String cart(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CartVO> clist=new ArrayList<CartVO>();
		String p=request.getParameter("p");	// 메인분류값
		
		if(session.getAttribute("userid") == null) {
			Cookie cookie = WebUtils.getCookie(request, "cookieid");
			if(cookie != null) {
				String cookievalue=cookie.getValue();
				clist=mapper.cart(cookievalue, p);
			}
		}
		else {
			String userid=session.getAttribute("userid").toString();
			clist=mapper.cart(userid, p);
		}
		
		String arrprice="";
		String arrhalin="";
		String arrsu="";
		String arrbaefee="";
		
		for(int i=0;i<clist.size();i++) {
			arrprice=arrprice+clist.get(i).getPrice()+",";	// 상품당 단가
			arrhalin=arrhalin+clist.get(i).getHalin()+",";	// 상품당 할인율
			arrsu=arrsu+clist.get(i).getSu()+",";	// 상품당 수량
			arrbaefee=arrbaefee+clist.get(i).getBaefee()+",";	// 상품당 배송비
		}
		
		model.addAttribute("p", p);
		model.addAttribute("clist", clist);
		model.addAttribute("arrprice", arrprice);
		model.addAttribute("arrhalin", arrhalin);
		model.addAttribute("arrsu", arrsu);
		model.addAttribute("arrbaefee", arrbaefee);		
		return "/eshop/cart";
	}

	@Override
	public String wishcart_del(HttpServletRequest request) {
		String[] id=request.getParameter("delid").split(",");
		int dchk=Integer.parseInt(request.getParameter("dchk"));
		String ad="";

		if(dchk == 1) {
			for(int i=0;i<id.length;i++) {
				ad="wish";
				mapper.wishcart_del(ad, id[i]);
			}
			return "redirect:/eshop/"+ad;
		}
		else if(dchk == 2) {
			for(int i=0;i<id.length;i++) {
				ad="cart";
				mapper.wishcart_del(ad, id[i]);
			}
			String p=request.getParameter("p");
			return "redirect:/eshop/"+ad+"?p="+p;
		}
		else
			return "redirect:/eshop/error";
	}

	@Override
	public String pro_gumae(HttpServletRequest request, Model model, HttpSession session) {
		String[] pcode=request.getParameter("pcode").split(",");
		String[] su=request.getParameter("su").split(",");
		String total_price=request.getParameter("total_price");
		String total_halin=request.getParameter("total_halin");
		String total_baefee=request.getParameter("total_baefee");
		String total_pay=request.getParameter("total_pay");
		
		ArrayList<ProductVO> plist=new ArrayList<ProductVO>();
		for(int i=0;i<pcode.length;i++) {
			ProductVO pvo=mapper.pro_gumae(pcode[i]);
			pvo.setSu(Integer.parseInt(su[i]));
			plist.add(pvo);
		}
		model.addAttribute("plist", plist);
		model.addAttribute("total_price", total_price);
		model.addAttribute("total_halin", total_halin);
		model.addAttribute("total_baefee", total_baefee);
		model.addAttribute("total_pay", total_pay);

		model.addAttribute("gchk", request.getParameter("gchk"));
		
		/* 메인분류값 */
		String p=request.getParameter("p");
		model.addAttribute("p", p);

		if(session.getAttribute("userid") != null)
			model.addAttribute("mvo", mapper.getInfo(session.getAttribute("userid").toString()));
		
		return "/eshop/pro_gumae";		
	}

	@Override
	public String wish(HttpSession session, Model model, HttpServletRequest request) {
		String osel;
		if(request.getParameter("osel") == null)
			osel="id desc";
		else
			osel=request.getParameter("osel");
		
		if(session.getAttribute("userid") != null) {
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("wlist", mapper.wish(userid, osel));
		}
		
		model.addAttribute("osel", osel);
		return "/eshop/wish";
	}

	@Override
	public String move_cart(HttpSession session, HttpServletRequest request) {
		String[] pcode=request.getParameter("pcode").split(",");
		String userid=session.getAttribute("userid").toString();
		int chk;
		for(int i=0;i<pcode.length;i++) {
			mapper.cart_add(userid, pcode[i], 1);

			chk=mapper.checkCart(userid, pcode[i]);
			if(chk != 0)
				mapper.cart_delDupli();

			mapper.wish_del(userid, pcode[i]);
		}
		
		return "redirect:/eshop/wish";
	}

	@Override
	public String pro_gumae_ok(GumaeVO gvo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookie = WebUtils.getCookie(request, "cookieid");
		
		if(session.getAttribute("userid") == null)
			if(cookie == null) {
				//gvo.setUserid("guest");
				String cookievalue=RandomStringUtils.random(20, true, true);
				Cookie cookieid=new Cookie("cookieid", cookievalue);

				cookieid.setPath("/");
				cookieid.setMaxAge(60 * 60 * 1);
				response.addCookie(cookieid);
				
				gvo.setUserid(cookievalue);
			}
			else
				gvo.setUserid(cookie.getValue());
		else
			gvo.setUserid(session.getAttribute("userid").toString());
		
		/* 주문번호 생성하기 → 구매날짜(8자리)+난수(4자리)+찐숫자(4자리) */
		Date today = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String now = dateFormat.format(today);
		
		String rand=RandomStringUtils.random(4, false, true);
		
		Integer n=mapper.getJumun();
		n++;
		String num=n.toString();
		switch(num.length()) {
			case 1 : num="000"+num; break;
			case 2 : num="00"+num; break;
			case 3 : num="0"+num; break;
		}
		
		String jumuncode='e'+now+rand+num;		
		gvo.setJumuncode(jumuncode);
		
		String userid=gvo.getUserid();
		
		/* 문자열로 오는 [pcode, su_imsi, price_imsi]를 배열에 나눠서 저장 */
		String[] pcode=gvo.getPcode().split(",");
		String[] su=gvo.getSu_imsi().split(",");
		String[] price=gvo.getPrice_imsi().split(",");
		
		int gchk=Integer.parseInt(request.getParameter("gchk"));
		
		for(int i=0;i<pcode.length;i++) {
			/* gumae테이블에 저장하기 */
			gvo.setPcode(pcode[i]);
			gvo.setTotal_su(Integer.parseInt(su[i]));
			gvo.setTotal_price(Integer.parseInt(price[i]));
			mapper.pro_gumae_ok(gvo);
			
			/* 판매된 수량(su)만큼 product테이블의 재고(su)에서 빼고 판매량(sold)에 더하기 */
			mapper.suMinusPlus(su[i], pcode[i]);
			
			/* 장바구니에서 온 상품(gchk=1)은 cart테이블에서 삭제하기 */
			if(gchk == 1)
				mapper.cart_del(userid, pcode[i]);					
		}

		return "redirect:/eshop/gumae_okmsg?jumuncode="+jumuncode;
	}

	@Override
	public String gumae_okmsg(HttpServletRequest request, Model model) {
		String jumuncode=request.getParameter("jumuncode");
		model.addAttribute("name", mapper.getName(jumuncode));
		model.addAttribute("jumuncode", jumuncode);		
		return "eshop/gumae_okmsg";
	}

	@Override
	public String pro_adlist(Model model, HttpServletRequest request) {
		int page, psel;
		String ssel, sword;
		
		/* 페이지의 초기화면값 처리하기 */
		if(request.getParameter("page") == null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		/* 한페이지에 출력할 레코드개수의 초기화면값 처리하기 */
		if(request.getParameter("psel") == null)
			psel=10;
		else
			psel=Integer.parseInt(request.getParameter("psel"));
		
		/* 한페이지에 출력할 레코드의 index값 구하기 */
		int pindex=(page-1)*psel;
		
		/* 검색말머리의 초기화면값 처리하기*/
		if(request.getParameter("ssel") == null)
			ssel="id";	// [검색말머리]에 없는 DB필드명 넣기
		else
			ssel=request.getParameter("ssel");
		
		/* 검색어의 초기화면값 처리하기*/
		if(request.getParameter("sword") == null)
			sword="";
		else
			sword=request.getParameter("sword");
		
		/* 페이지 이동을 위한 출력 범위 */
		int pstart, pend, parr=10;
		
		pstart=page/parr;	// 페이지 출력 범위 : 1~10, 11~20, 21~30…
		if((page % parr) == 0)
			pstart--;
			
		pstart=(pstart*parr)+1;
		pend=pstart+(parr-1);
		
		/*if(page <= parr)	// 페이지 출력 범위 : 현재페이지 앞뒤로 ±parr값
			pstart=1;
		else
			pstart=page-parr;
		
		pend=page+parr;/*

		/* 총페이지수 구하기 */
		int ptotal=mapper.total(psel, ssel, sword);
		
		/* pend가 총페이지수보다 크다면 값 바꾸기 */
		if(pend > ptotal)
			pend=ptotal;
		
		/* 정렬의 초기화면값 처리하기 */
		String osel;
		if(request.getParameter("osel") == null)
			osel="id desc";
		else
			osel=request.getParameter("osel");
		
		model.addAttribute("plist", mapper.pro_adlist(ssel, sword, osel, pindex, psel));
		model.addAttribute("page", page);
		model.addAttribute("psel", psel);
		model.addAttribute("ssel", ssel);
		model.addAttribute("sword", sword);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("ptotal", ptotal);
		model.addAttribute("osel", osel);
		return "eshop/pro_adlist";
	}

	@Override
	public String pro_adcontent(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String pro_addelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String pro_adupdate(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String pro_adupdate_ok(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
}
