package kr.co.hotel.admin;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.diningresv.DiningResvVO;
import kr.co.hotel.eshop.GumaeVO;
import kr.co.hotel.member.MemberVO;
import kr.co.hotel.roomresv.RoomResvVO;
import kr.co.hotel.wedding.WeddingResvVO;
import kr.co.hotel.wedding.WeddingVO;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper mapper;

	@Override
	public String admin(Model model) {
		ArrayList<RoomResvVO> rlist=mapper.getroombk();
		ArrayList<DiningResvVO> dlist=mapper.getdiningresv();
		ArrayList<WeddingResvVO> wlist=mapper.getweddingresv();
		ArrayList<GumaeVO> glist=mapper.getgumae();
		
		/* userid가 쿠키값일 경우 'guest'로 바꾸기 */
		for(int i=0;i<glist.size();i++) {
			if(glist.get(i).getUserid().length() == 20)
				glist.get(i).setUserid("guest");
		}

		model.addAttribute("rlist", rlist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("wlist", wlist);
		model.addAttribute("glist", glist);
		
		// 상태 변경
		Date date = Date.valueOf(LocalDate.now());
		
		mapper.bstatechange(date);
		mapper.wstatechange(date);
		mapper.dstatechange(date);
		
		return "/admin/admin";
	}

	@Override
	public String memberlist(Model model) {
		ArrayList<MemberVO> list=mapper.memberlist();
		model.addAttribute("list", list);
		
		return "/admin/memberlist";
	}

// 각 예약 리스트 확인
	@Override
	public String roomlist(Model model, HttpServletRequest request) {
		int page, start;
		String oby;
		int pcnt;
		if(request.getParameter("pcnt")==null)
			pcnt=10;
		else
			pcnt=Integer.parseInt(request.getParameter("pcnt"));
		
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		start=(page-1)*pcnt;
		
		// 정렬
		if(request.getParameter("oby")==null)
			oby="id desc";
		else
			oby=request.getParameter("oby");
		
		int pstart,pend;
		pstart=page/10;
		if(page%10==0)
			pstart--;
		
		pstart=pstart*10+1;
		pend=pstart+9;
		
		String sel; // 검색필드..말머리같은거
		if(request.getParameter("sel")==null)
			sel="0";
		else
			sel=request.getParameter("sel");
		
		String sword; // searchword..검색어
		if(request.getParameter("sword")==null)
			sword="";
		else
			sword=request.getParameter("sword");
		
		int chong=mapper.getRChong(pcnt, sel, sword);
		
		if(chong<pend)
			pend=chong;
		
		model.addAttribute("rlist",mapper.rlist(sel, sword, start, pcnt, oby));
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("pcnt",pcnt);
		model.addAttribute("sel",sel);
		model.addAttribute("sword",sword);
		
		return "/admin/roomlist";
	}

	@Override
<<<<<<< HEAD
	public String wedlist(Model model, HttpServletRequest request) {
		int page, start;
		int pcnt;
		String oby;
		
		if(request.getParameter("pcnt")==null)
			pcnt=10;
		else
			pcnt=Integer.parseInt(request.getParameter("pcnt"));
		
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		start=(page-1)*pcnt;
		
		// 정렬
		if(request.getParameter("oby")==null)
			oby="wresv_id desc";
		else
			oby=request.getParameter("oby");
		
		// 페이지 마저..
		int pstart,pend;
		pstart=page/10;
		if(page%10==0)
			pstart--;
		
		pstart=pstart*10+1;
		pend=pstart+9;
		
		String sel; // 검색필드..말머리같은거
		if(request.getParameter("sel")==null)
			sel="0";
		else
			sel=request.getParameter("sel");
		
		String sword; // searchword..검색어
		if(request.getParameter("sword")==null)
			sword="";
		else
			sword=request.getParameter("sword");
		
		int chong=mapper.getWChong(pcnt, sel, sword);
		
		if(chong<pend)
			pend=chong;
		
		
		model.addAttribute("wlist",mapper.wlist(sel, sword, start, pcnt, oby));
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("pcnt",pcnt);
		model.addAttribute("sel",sel);
		model.addAttribute("sword",sword);
		model.addAttribute("oby",oby);
		
		return "/admin/wedlist";
	}
=======
	   public String wedlist(Model model, HttpServletRequest request) {
	      int page, start;
	      int pcnt;
	      String oby;
	      
	      if(request.getParameter("pcnt")==null)
	         pcnt=10;
	      else
	         pcnt=Integer.parseInt(request.getParameter("pcnt"));
	      
	      if(request.getParameter("page")==null)
	         page=1;
	      else
	         page=Integer.parseInt(request.getParameter("page"));
	      
	      start=(page-1)*pcnt;
	      
	      // 정렬
	      if(request.getParameter("oby")==null)
	         oby="wresv_id desc";
	      else
	         oby=request.getParameter("oby");
	      
	      // 페이지 마저..
	      int pstart,pend;
	      pstart=page/10;
	      if(page%10==0)
	         pstart--;
	      
	      pstart=pstart*10+1;
	      pend=pstart+9;
	      
	      String sel; // 검색필드..말머리같은거
	      if(request.getParameter("sel")==null)
	         sel="0";
	      else
	         sel=request.getParameter("sel");
	      
	      String sword; // searchword..검색어
	      if(request.getParameter("sword")==null)
	         sword="";
	      else
	         sword=request.getParameter("sword");
	      
	      int chong=mapper.getWChong(pcnt, sel, sword);
	      
	      if(chong<pend)
	         pend=chong;
	      
	      
	      model.addAttribute("wlist",mapper.wlist(sel, sword, start, pcnt, oby));
	      model.addAttribute("page",page);
	      model.addAttribute("pstart",pstart);
	      model.addAttribute("pend",pend);
	      model.addAttribute("chong",chong);
	      model.addAttribute("pcnt",pcnt);
	      model.addAttribute("sel",sel);
	      model.addAttribute("sword",sword);
	      model.addAttribute("oby",oby);
	      
	      return "/admin/wedlist";
	   }
>>>>>>> branch 'main' of https://github.com/ey0k/hotel.git

	@Override
	public String dinelist(Model model, HttpServletRequest request) {
		int page, start;
		
		int pcnt;
		if(request.getParameter("pcnt")==null)
			pcnt=10;
		else
			pcnt=Integer.parseInt(request.getParameter("pcnt"));
		
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		start=(page-1)*pcnt;
		
		// 정렬
		String oby;
		if(request.getParameter("oby")==null)
			oby="dr_id desc";
		else
			oby=request.getParameter("oby");
		
		int pstart,pend;
		pstart=page/10;
		if(page%10==0)
			pstart--;
		
		pstart=pstart*10+1;
		pend=pstart+9;
		
		String sel; // 검색필드..말머리같은거
		if(request.getParameter("sel")==null)
			sel="0";
		else
			sel=request.getParameter("sel");
		
		String sword; // searchword..검색어
		if(request.getParameter("sword")==null)
			sword="";
		else
			sword=request.getParameter("sword");
		
		int chong=mapper.getDChong(pcnt, sel, sword);
		
		if(chong<pend)
			pend=chong;
		
		model.addAttribute("dlist",mapper.dlist(sel, sword, start, pcnt, oby));
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("pcnt",pcnt);
		model.addAttribute("sel",sel);
		model.addAttribute("sword",sword);
		
		return "/admin/dinelist";
	}

	@Override
	public String gumaelist(Model model, HttpServletRequest request) {
		int page, start;
		
		int pcnt;
		if(request.getParameter("pcnt")==null)
			pcnt=10;
		else
			pcnt=Integer.parseInt(request.getParameter("pcnt"));
		
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		start=(page-1)*pcnt;
		
		// 정렬
		String oby;
		if(request.getParameter("oby")==null)
			oby="id desc";
		else
			oby=request.getParameter("oby");
				
		int pstart,pend;
		pstart=page/10;
		if(page%10==0)
			pstart--;
		
		pstart=pstart*10+1;
		pend=pstart+9;
		
		String sel; // 검색필드..말머리같은거
		if(request.getParameter("sel")==null)
			sel="0";
		else
			sel=request.getParameter("sel");
		
		String sword; // searchword..검색어
		if(request.getParameter("sword")==null)
			sword="";
		else
			sword=request.getParameter("sword");
		
		int chong=mapper.getDChong(pcnt, sel, sword);
		
		if(chong<pend)
			pend=chong;
		
		/* userid가 쿠키값일 경우 'guest'로 바꾸기 */
		ArrayList<GumaeVO> glist=mapper.glist(sel, sword, start, pcnt, oby);
		for(int i=0;i<glist.size();i++) {
			if(glist.get(i).getUserid().length() == 20)
				glist.get(i).setUserid("guest");
		}
		
		model.addAttribute("glist",glist);
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("pcnt",pcnt);
		model.addAttribute("sel",sel);
		model.addAttribute("sword",sword);
		
		return "/admin/gumaelist";
	}

	@Override
	public String estatechange(HttpServletRequest request) {
		String state=request.getParameter("state");
		String id=request.getParameter("id");
		
		mapper.estatechange(state, id);
		
		/* 주문이 취소되면 product테이블의 [재고]와 [판매량]을 원래대로 */
		int state2=Integer.parseInt(state);
		String pcode=request.getParameter("pcode");
		String su=request.getParameter("su");
		if(state2 == 2)
			mapper.suPlusMinus(su, pcode);
		
		return "redirect:/admin/gumaelist";
	}

}





















