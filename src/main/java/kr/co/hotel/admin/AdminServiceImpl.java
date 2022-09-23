package kr.co.hotel.admin;

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

		model.addAttribute("rlist", rlist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("wlist", wlist);
		model.addAttribute("glist", glist);
		
		return "/admin/admin";
	}

	@Override
	public String memberlist(Model model) {
		ArrayList<MemberVO> list=mapper.memberlist();
		model.addAttribute("list", list);
		
		return "/admin/memberlist";
	}

// 객실예약 리스트 확인
	@Override
	public String roomlist(Model model, HttpServletRequest request) {
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
		
		model.addAttribute("rlist",mapper.rlist(sel, sword, start, pcnt));
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
	public String wedlist(Model model, HttpServletRequest request) {
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
		
		
		model.addAttribute("wlist",mapper.wlist(sel, sword, start, pcnt));
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("pcnt",pcnt);
		model.addAttribute("sel",sel);
		model.addAttribute("sword",sword);
		
		return "/admin/wedlist";
	}

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
		
		model.addAttribute("dlist",mapper.dlist(sel, sword, start, pcnt));
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
		
		model.addAttribute("glist",mapper.glist(sel, sword, start, pcnt));
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("pcnt",pcnt);
		model.addAttribute("sel",sel);
		model.addAttribute("sword",sword);
		
		return "/admin/gumaelist";
	}
}





















