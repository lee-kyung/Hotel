package kr.co.hotel.room;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
		return "/room/rooms";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
