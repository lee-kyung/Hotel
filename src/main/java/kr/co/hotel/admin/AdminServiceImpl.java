package kr.co.hotel.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.diningresv.DiningResvVO;
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

		model.addAttribute("rlist", rlist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("wlist", wlist);
		
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
	public String roombk(Model model, HttpServletRequest request) {
		/*int page, start; 
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
		
		int pstart, pend;
		pstart=page/10;
		if(page%10==0)
			pstart--;
		
		pstart=pstart*10+1;
		pend=pstart+9;
		
		String sel;
		if(request.getParameter("sel")==null)
			sel="0";
		else
			sel=request.getParameter("sel");
		
		String sword;
		if(request.getParameter("sword")==null)
			sword="";
		else
			sword=request.getParameter("sword");
		
		int chong=mapper.getRChong(pcnt, sel, sword);
		
		model.addAttribute("rlist",mapper.roombk(sel, sword, start, pcnt));
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("pcnt",pcnt);
		model.addAttribute("sel",sel);
		model.addAttribute("sword",sword);
		*/
		ArrayList<RoomResvVO> rlist=mapper.getroombk();
		model.addAttribute("rlist", rlist);
		return "/admin/roombk";
	}
}





















