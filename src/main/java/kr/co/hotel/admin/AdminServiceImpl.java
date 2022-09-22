package kr.co.hotel.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.diningresv.DiningResvVO;
import kr.co.hotel.member.MemberVO;
import kr.co.hotel.roomresv.RoomResvVO;
import kr.co.hotel.wedding.WeddingVO;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper mapper;

	@Override
	public String admin(Model model) {
		ArrayList<RoomResvVO> mlist=mapper.getroombk();
		ArrayList<DiningResvVO> dlist=mapper.getdiningresv();
		ArrayList<WeddingVO> wlist=mapper.getweddingresv();

		model.addAttribute("mlist", mlist);
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
}
