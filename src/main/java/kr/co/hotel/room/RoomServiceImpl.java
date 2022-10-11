package kr.co.hotel.room;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Enumeration;

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
			rvo.setRtxt2(multi.getParameter("rtxt3"));
			rvo.setRview(multi.getParameter("rview"));
			rvo.setRbed(multi.getParameter("rbed"));
		}
		catch(Exception e)
		{
			
		}
		mapper.room_write_ok(rvo);
		return "redirect:/room/room_list";
	}
// 고객이 보는 객실 목록	
	@Override
	public String rooms(Model model,HttpServletRequest request) {
		String code=request.getParameter("code");
		ArrayList<RoomVO> list=mapper.rooms(code);
		model.addAttribute("list", list);
		
		return "/room/rooms";
	}
// 고객이 보는 객실 세부정보	
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
	public String roomtest(Model model, HttpServletRequest request) {
		String code=request.getParameter("code");
		ArrayList<RoomVO> list=mapper.rooms(code);
		model.addAttribute("list", list);
		
		return "/room/roomtest";
	}
	
	
	
// 관리자가 보는 객실목록
	@Override
	public String room_list(Model model) {
		
		ArrayList<RoomVO> list=mapper.room_list();
		model.addAttribute("list",list);
		
		return "/room/room_list";
	}

	@Override
	public String room_update(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		RoomVO rvo=mapper.room_update(id);
		model.addAttribute("rvo", rvo);
		
		return "/room/room_update";
	}

	@Override
	public String room_update_ok(RoomVO rvo, HttpServletRequest request) throws Exception {
		// 라이브러리를 이용하여 폼태그에 값을 가져오기
		String path=request.getRealPath("resources/img/rooms");
		int size=1024*1024*20;
		MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		// 폼값 가져와서 RoomVO에 넣기
		Enumeration file=multi.getFileNames(); // 폼태그에서의 파일 업로드 하는 태그의 name을 가지고온다.. 만약 3개("fname1","fname2","fname3")
		// 저장된 파일의 이름이 필요 => multi.getFilesystemName("fname1") => 서버에 저장된 파일이름을 가져온다
		// Enumeration은 hasMoreElement()를 통해 다음내용으로 이동 => nextElement()를 통해서 저장된 값을 가져온다
		
		String fnames="";
		while(file.hasMoreElements())
		{
			String fname=file.nextElement().toString();
			fnames=fnames+multi.getFilesystemName(fname)+",";
		}
		
		// 테이블의 fname필드에 "파일명,파일명,파일명,"
		// null값 없애기 "null"
		fnames=fnames.replace("null", "")+multi.getParameter("str"); // 새로 추가되는 파일명+지우지 않을 사진이름
		String rname=multi.getParameter("rname");
		int rmin=Integer.parseInt(multi.getParameter("rmin"));
		int rmax=Integer.parseInt(multi.getParameter("rmax"));
		int rprice=Integer.parseInt(multi.getParameter("rprice"));
		int rsu=Integer.parseInt(multi.getParameter("rsu"));
		String rpimg=multi.getFilesystemName("rpimg");
		String rcimg=multi.getFilesystemName("rcimg");
		String rtxt2=multi.getParameter("rtxt2");
		String rtxt3=multi.getParameter("rtxt3");
		String rview=multi.getParameter("rview");
		String rbed=multi.getParameter("rbed");		
		int id=Integer.parseInt(multi.getParameter("id"));
		
		rvo=new RoomVO();
		rvo.setId(id);
		rvo.setRname(multi.getParameter("rname"));
		rvo.setRmin(Integer.parseInt(multi.getParameter("rmin")));
		rvo.setRmax(Integer.parseInt(multi.getParameter("rmax")));
		rvo.setRprice(Integer.parseInt(multi.getParameter("rprice")));
		rvo.setRsu(Integer.parseInt(multi.getParameter("rsu")));
		rvo.setRpimg(multi.getFilesystemName("rpimg"));
		rvo.setRcimg(multi.getFilesystemName("rcimg"));
		rvo.setRcode(multi.getParameter("rcode"));
		rvo.setRtxt2(multi.getParameter("rtxt2"));
		rvo.setRtxt2(multi.getParameter("rtxt3"));
		rvo.setRview(multi.getParameter("rview"));
		rvo.setRbed(multi.getParameter("rbed"));

		mapper.room_update_ok(rvo);
		
		// 삭제하고자 하는 파일을 실제로 삭제
		String[] del=multi.getParameter("del").split(",");
		for(int i=0;i<del.length;i++)
		{
			File ff=new File(path+"/"+del[i]);
			if(ff.exists()) //존재하면
				ff.delete(); //삭제
		}
		
		return "redirect:/room/room_list";		
	}
	
	@Override
	public String room_disable(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.room_disable(id);
		return "redirect:/room/room_list";
	}
	
	@Override
	public String room_enable(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.room_enable(id);
		return "redirect:/room/room_list";
	}


// 만약 삭제하고 싶다면 delete 보통은 disable
	@Override
	public String room_delete(HttpServletRequest request) {
		String id=request.getParameter("id");
		
		// 레코드 삭제하기전에 파일을 삭제하기
		String path=request.getRealPath("/resources/img/rooms");
		
		String[] del=mapper.getrpimg(id).split(",");		
		for(int i=0;i<del.length;i++)
		{
			File ff=new File(path+"/"+del[i]);
			if(ff.exists())
				ff.delete();
		}
		
		mapper.room_delete(id);
		return "redirect:/room/room_list";
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
