package kr.co.hotel.room;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
@Qualifier("rs")
public class RoomServiceImpl implements RoomService{
	@Autowired
	private RoomMapper mapper;

	@Override
	public String room_write(Model model) {
		ArrayList<RdaeVO> list=mapper.room_write();
		model.addAttribute("list",list);
		return "/room/room_write";
	}
	
	@Override
	public void getbunho(HttpServletRequest request, PrintWriter out) {
		String code=request.getParameter("code");
		Integer bunho=mapper.getbunho(code);
		out.print(bunho);
		
	}

	@Override
	public String room_write_ok(HttpServletRequest request) {
		// 라이브러리를 이용하여 폼태그에 값을 가져오기
		String path=request.getRealPath("resources/img/rooms");
		int size=1024*1024*20;
		
		// 폼값 가져와서 RoomVO에 넣기
		RoomVO rvo=new RoomVO();
		try {
			MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
			rvo.setRname(multi.getParameter("rname"));
			rvo.setRmin(Integer.parseInt(multi.getParameter("rmin")));
			rvo.setRmax(Integer.parseInt(multi.getParameter("rmax")));
			rvo.setRprice(Integer.parseInt(multi.getParameter("rprice")));
			rvo.setRsu(Integer.parseInt(multi.getParameter("rsu")));
			rvo.setRpimg(multi.getFilesystemName("rpimg"));
			rvo.setRcimg(multi.getFilesystemName("rcimg"));
			rvo.setRcode(multi.getParameter("rcode"));
			rvo.setRtxt(multi.getParameter("rtxt"));
			rvo.setRtxt2(multi.getParameter("rtxt2"));
			rvo.setRview(multi.getParameter("rview"));
			rvo.setRbed(multi.getParameter("rbed"));
		}
		catch(Exception e)
		{
			
		}
		mapper.room_write_ok(rvo);
		return "redirect:/room/rooms";
	}
	
	@Override
	public String rooms(Model model,HttpServletRequest request) {
		String code=request.getParameter("code");
		ArrayList<RoomVO> list=mapper.rooms(code);
		model.addAttribute("list", list);
		
		return "/room/rooms";
	}
	
	@Override
	public String room_content(Model model,HttpServletRequest request) {
		String code=request.getParameter("code");
		ArrayList<RoomVO> list=mapper.room_content(code);
		model.addAttribute("list", list);
		
		
		String rcode=request.getParameter("rcode");
		RoomVO rvo=mapper.get_room(rcode);
		model.addAttribute("rvo", rvo);
		
		return "/room/room_content";
	}

	@Override
	public String room_su(HttpServletRequest request, HttpSession session, Model model) 
	{
		// 1일의 요일, 총일수, 주를 구해서  request 영역에 저장
		int y,m;
		
		if(request.getParameter("y")==null) // 처음 부를땐 y값이 없어서 null일 수 있음
		{
			LocalDate today=LocalDate.now(); // 현재날짜 정보를 가
			y=today.getYear(); // 년도
    		m=today.getMonthValue(); // 월
    	}
    	else
    	{
    		y=Integer.parseInt(request.getParameter("y"));
    		m=Integer.parseInt(request.getParameter("m"));
    	}
    	
		// 해당월의 1일에 대한 날짜객체를 생성
		LocalDate dday=LocalDate.of(y, m, 1);
		
		// 1일의 요일
		int yoil=dday.getDayOfWeek().getValue();
		if(yoil==7)
			yoil=0;
		
		// 해당월의 총일수
		int chong=dday.lengthOfMonth(); // 총일수
		
		// 몇주인지
		int ju=(int) Math.ceil((yoil+chong)/7.0);
		
		request.setAttribute("yoil", yoil);
    	request.setAttribute("chong", chong);
    	request.setAttribute("ju", ju);
    	request.setAttribute("y", y);
    	request.setAttribute("m", m);
    	
 
    	ArrayList<RoomVO> list=mapper.getRoom();
    	model.addAttribute("list", list);
	
		return "/room/room_su";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
