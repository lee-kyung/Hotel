package kr.co.hotel.eshop;

import java.io.File;
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
		
		String opt="<option>"+URLEncoder.encode("νμλΆλ₯")+"</option>";
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
		}
		catch(Exception e) {
			return "redirect:/eshop/error";
		}
		mapper.pro_write_ok(pvo);
		return "redirect:/eshop/pro_adlist";
	}

	@Override
	public String eshop(Model model) {
		model.addAttribute("plist1", mapper.eshop1("p01"));
		model.addAttribute("plist2", mapper.eshop2("p02"));
		return "/eshop/eshop";
	}
	
	@Override
	public String pro_list(HttpServletRequest request, Model model, HttpSession session) {
		String pcode=request.getParameter("pcode");

		String osel;
		if(request.getParameter("osel") == null)
			osel="sold desc";
		else
			osel=request.getParameter("osel");

		String userid="";
		Cookie cookie = WebUtils.getCookie(request, "cookieid");
		if(session.getAttribute("userid") == null && cookie == null)
			model.addAttribute("plist", mapper.pro_list2(pcode, osel));
		else {
			if(session.getAttribute("userid") == null)
				userid=cookie.getValue();
			else
				userid=session.getAttribute("userid").toString();
			model.addAttribute("plist", mapper.pro_list(userid, pcode, osel));
		}			
		
		model.addAttribute("pcode", pcode);	// λ°°λμ¬μ§κ³Ό λ¬Έκ΅¬λ₯Ό κ΅¬λ³νκΈ° μν pcode(pdae λλ pdaeso)κ°
		model.addAttribute("osel", osel);
		model.addAttribute("sum", mapper.getSum(pcode));
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
		
		String p=pcode.substring(0, 3);	// λ©μΈλΆλ₯κ°
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
		String p=request.getParameter("p");	// λ©μΈλΆλ₯κ°
		int sum1=0;
		int sum2=0;
		
		if(session.getAttribute("userid") == null) {
			Cookie cookie = WebUtils.getCookie(request, "cookieid");
			if(cookie != null) {
				String cookievalue=cookie.getValue();
				clist=mapper.cart(cookievalue, p);
				sum1=mapper.getCsum1(cookievalue);
				sum2=mapper.getCsum2(cookievalue);
			}
		}
		else {
			String userid=session.getAttribute("userid").toString();
			clist=mapper.cart(userid, p);
			sum1=mapper.getCsum1(userid);
			sum2=mapper.getCsum2(userid);
		}
		
		String arrprice="";
		String arrhalin="";
		String arrsu="";
		String arrbaefee="";
		
		for(int i=0;i<clist.size();i++) {
			arrprice=arrprice+clist.get(i).getPrice()+",";	// μνλΉ λ¨κ°
			arrhalin=arrhalin+clist.get(i).getHalin()+",";	// μνλΉ ν μΈμ¨
			arrsu=arrsu+clist.get(i).getSu()+",";	// μνλΉ μλ
			arrbaefee=arrbaefee+clist.get(i).getBaefee()+",";	// μνλΉ λ°°μ‘λΉ
		}
		
		model.addAttribute("p", p);
		model.addAttribute("clist", clist);
		model.addAttribute("arrprice", arrprice);
		model.addAttribute("arrhalin", arrhalin);
		model.addAttribute("arrsu", arrsu);
		model.addAttribute("arrbaefee", arrbaefee);
		model.addAttribute("sum1", sum1);
		model.addAttribute("sum2", sum2);
		return "/eshop/cart";
	}

	@Override
	public String wishcart_del(HttpServletRequest request) {
		String[] id=request.getParameter("delid").split(",");
		int dchk=Integer.parseInt(request.getParameter("dchk"));
		String tname="";

		if(dchk == 1) {
			for(int i=0;i<id.length;i++) {
				tname="wish";
				mapper.wishcart_del(tname, id[i]);
			}
			return "redirect:/eshop/"+tname;
		}
		else if(dchk == 2) {
			for(int i=0;i<id.length;i++) {
				tname="cart";
				mapper.wishcart_del(tname, id[i]);
			}
			String p=request.getParameter("p");
			return "redirect:/eshop/"+tname+"?p="+p;
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
		String ptitle="";
		
		ArrayList<ProductVO> plist=new ArrayList<ProductVO>();
		for(int i=0;i<pcode.length;i++) {
			ProductVO pvo=mapper.pro_gumae(pcode[i]);
			pvo.setSu(Integer.parseInt(su[i]));
			plist.add(pvo);
			
			ptitle=plist.get(i).getTitle()+","+ptitle;
		}
		model.addAttribute("plist", plist);
		model.addAttribute("total_price", total_price);
		model.addAttribute("total_halin", total_halin);
		model.addAttribute("total_baefee", total_baefee);
		model.addAttribute("total_pay", total_pay);

		model.addAttribute("gchk", request.getParameter("gchk"));
		
		model.addAttribute("ptitle", ptitle);
		
		/* λ©μΈλΆλ₯κ° */
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
				gvo.setUserid("guest");
				/*String cookievalue=RandomStringUtils.random(20, true, true);
				Cookie cookieid=new Cookie("cookieid", cookievalue);

				cookieid.setPath("/");
				cookieid.setMaxAge(60 * 60 * 1);
				response.addCookie(cookieid);
				
				gvo.setUserid(cookievalue);*/
			}
			else
				gvo.setUserid(cookie.getValue());
		else
			gvo.setUserid(session.getAttribute("userid").toString());
		
		/* μ£Όλ¬Έλ²νΈ μμ±νκΈ° β κ΅¬λ§€λ μ§(8μλ¦¬)+λμ(4μλ¦¬)+μ°μ«μ(4μλ¦¬) */
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
		
		String[] pcode=gvo.getPcode().split(",");
		String[] su=gvo.getSu_imsi().split(",");
		String[] price=gvo.getPrice_imsi().split(",");
		
		int gchk=Integer.parseInt(request.getParameter("gchk"));
		
		for(int i=0;i<pcode.length;i++) {
			/* gumaeνμ΄λΈμ μ μ₯νκΈ° */
			gvo.setPcode(pcode[i]);
			gvo.setTotal_su(Integer.parseInt(su[i]));
			gvo.setTotal_price(Integer.parseInt(price[i]));
			mapper.pro_gumae_ok(gvo);
			
			/* νλ§€λ μλ(su)λ§νΌ productνμ΄λΈμ μ¬κ³ (su)μμ λΉΌκ³  νλ§€λ(sold)μ λνκΈ° */
			mapper.suMinusPlus(su[i], pcode[i]);
			
			/* μ₯λ°κ΅¬λμμ μ¨ μν(gchk=1)μ cartνμ΄λΈμμ μ­μ νκΈ° */
			if(gchk == 1)
				mapper.cart_del(userid, pcode[i]);					
		}

		return "redirect:/eshop/gumae_okmsg?jumuncode="+jumuncode;
	}

	@Override
	public String gumae_okmsg(HttpServletRequest request, Model model) {
		String jumuncode=request.getParameter("jumuncode");
		model.addAttribute("jname", mapper.getName(jumuncode));
		model.addAttribute("jumuncode", jumuncode);		
		return "/eshop/gumae_okmsg";
	}

	@Override
	public String pro_adlist(Model model, HttpServletRequest request) {
		int page, psel;
		String ssel, sword;
		
		if(request.getParameter("page") == null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		if(request.getParameter("psel") == null)
			psel=5;
		else
			psel=Integer.parseInt(request.getParameter("psel"));
		
		int pindex=(page-1)*psel;
		
		if(request.getParameter("ssel") == null)
			ssel="id";
		else
			ssel=request.getParameter("ssel");
		
		if(request.getParameter("sword") == null)
			sword="";
		else
			sword=request.getParameter("sword");
		
		int pstart, pend, parr=2;
		
		/*pstart=page/parr;	// νμ΄μ§ μΆλ ₯ λ²μ : 1~10, 11~20, 21~30β¦
		if((page % parr) == 0)
			pstart--;
			
		pstart=(pstart*parr)+1;
		pend=pstart+(parr-1);*/
		
		if(page <= parr)	// νμ΄μ§ μΆλ ₯ λ²μ : νμ¬νμ΄μ§ μλ€λ‘ Β±parrκ°
			pstart=1;
		else
			pstart=page-parr;
		
		pend=page+parr;

		int ptotal=mapper.total(psel, ssel, sword);
		
		if(pend > ptotal)
			pend=ptotal;
		
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
		return "/eshop/pro_adlist";
	}

	@Override
	public String pro_adcontent(Model model, HttpServletRequest request) {
		ProductVO pvo= mapper.pro_adcontent(request.getParameter("id"));
				
		pvo.setImgs(pvo.getFimg().split(","));

		model.addAttribute("pvo", pvo);
		model.addAttribute("page", request.getParameter("page"));
		model.addAttribute("psel", request.getParameter("psel"));
		model.addAttribute("ssel", request.getParameter("ssel"));
		model.addAttribute("sword", request.getParameter("sword"));
		model.addAttribute("osel", request.getParameter("osel"));
		return "/eshop/pro_adcontent";
	}

	@Override
	public String pro_addelete(HttpServletRequest request) {
		mapper.pro_addelete(request.getParameter("id"));

		String[] imgs=(request.getParameter("fimg")+request.getParameter("simg")).split(",");
		String path=request.getRealPath("resources/img/eshop");

		for(int i=0;i<imgs.length;i++) {
			File file=new File(path+"/"+imgs[i]);
			if(file.exists())
				file.delete();
		}

		String sword="";
		if(request.getParameter("sword") != null)
			sword=URLEncoder.encode(request.getParameter("sword"));
		
		return "redirect:/eshop/pro_adlist?page="+request.getParameter("page")+"&psel="+request.getParameter("psel")+"&ssel="+request.getParameter("ssel")+"&sword="+sword+"&osel="+request.getParameter("osel");
	}

	@Override
	public String pro_adupdate(Model model, HttpServletRequest request) {
		ProductVO pvo= mapper.pro_adcontent(request.getParameter("id"));

		pvo.setImgs(pvo.getFimg().split(","));

		model.addAttribute("pvo", pvo);
		model.addAttribute("page", request.getParameter("page"));
		model.addAttribute("psel", request.getParameter("psel"));
		model.addAttribute("ssel", request.getParameter("ssel"));
		model.addAttribute("sword", request.getParameter("sword"));
		model.addAttribute("osel", request.getParameter("osel"));
		return "/eshop/pro_adupdate";
	}

	@Override
	public String pro_adupdate_ok(HttpServletRequest request) {
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
			imgs=multi.getParameter("keep")+imgs.replace("null,", "");
			System.out.println(multi.getParameter(imgs));
			
			pvo.setId(Integer.parseInt(multi.getParameter("id")));
			pvo.setTitle(multi.getParameter("title"));
			pvo.setFimg(imgs);
			if(multi.getFilesystemName("simg") != null) {
				pvo.setSimg(multi.getFilesystemName("simg"));
				File file2=new File(path+"/"+multi.getParameter("olds"));
				if(file2.exists())
					file2.delete();
			}
			else
				pvo.setSimg(multi.getParameter("skeep"));
			pvo.setPrice(Integer.parseInt(multi.getParameter("price")));
			pvo.setHalin(Integer.parseInt(multi.getParameter("halin")));
			pvo.setJuk(Integer.parseInt(multi.getParameter("juk")));
			pvo.setSu(Integer.parseInt(multi.getParameter("su")));
			pvo.setBaefee(Integer.parseInt(multi.getParameter("baefee")));
			
			mapper.pro_adupdate_ok(pvo);
			
			String[] del=(multi.getParameter("del")+multi.getParameter("sdel")).split(",");
			for(int i=0;i<del.length;i++) {
				File file2=new File(path+"/"+del[i]);
				if(file2.exists())
					file2.delete();
			}

			String sword="";
			if(multi.getParameter("sword") != null)
				sword=URLEncoder.encode(multi.getParameter("sword"));
			
			return "redirect:/eshop/pro_adcontent?id="+multi.getParameter("id")+"&page="+multi.getParameter("page")+"&psel="+multi.getParameter("psel")+"&ssel="+multi.getParameter("ssel")+"&sword="+sword+"&osel="+multi.getParameter("osel");
		}
		catch(Exception e) {
			return "redirect:/eshop/error";
		}
	}
}
