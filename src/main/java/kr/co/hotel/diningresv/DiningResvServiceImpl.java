package kr.co.hotel.diningresv;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.dining.DiningVO;
import kr.co.hotel.room.RoomVO;
import kr.co.hotel.wedding.WeddingResvVO;

@Service
@Qualifier("drs")
public class DiningResvServiceImpl implements DiningResvService{
   
   @Autowired
   private DiningResvMapper mapper;
   
   @Override
   public String dining_reserve(HttpServletRequest request, Model model, HttpSession session)
   {
      if(session.getAttribute("userid") != null) {
         String userid=session.getAttribute("userid").toString();
         DiningResvVO drvo=new DiningResvVO();
         drvo.setUserid(userid);
      }
   //  1일의 요일, 총일수, 몇주를 구해서 request영역에 저장
      
      int y,m;
       if(request.getParameter("y")==null)
       {
          LocalDate today=LocalDate.now(); // 현재 날짜 정보를 가져온다..
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
       int yoil=dday.getDayOfWeek().getValue();  // 1~7까지  (7:일요일)
       if(yoil==7)
          yoil=0;
       // 해당월의 총일수
       int chong=dday.lengthOfMonth(); // 총일수
       
       // 몇 주인가
       int ju=(int)Math.ceil((yoil+chong)/7.0);
               
       request.setAttribute("yoil", yoil);
       request.setAttribute("chong", chong);
       request.setAttribute("ju", ju);
       request.setAttribute("y", y);
       request.setAttribute("m", m); 
       
          // 달의 1일 부터 마지막일까지
          String start=y+"-"+m+"-01";
          String end=y+"-"+m+"-"+chong;
          ArrayList<DiningVO> dlist=mapper.dining_reserve(start, end);
        
          String td="";
          String dine_type="";
         
          for(int i=0;i<dlist.size();i++)
          {
              td=td+dlist.get(i).getTd()+",";
              
              if(dlist.get(i).getDine_type().equals("Breakfast"))
                 dlist.get(i).setDine_type("1");
              else if(dlist.get(i).getDine_type().equals("Lunch"))
                 dlist.get(i).setDine_type("2");
              else if(dlist.get(i).getDine_type().equals("Dinner"))
                    dlist.get(i).setDine_type("3");
              
              dine_type=dine_type+dlist.get(i).getDine_type()+",";
          }
          // 06, 08, 01 / 01 / 01
          // 아침, 아침, 저녁 / 저녁 / 점심
          model.addAttribute("td",td);
          model.addAttribute("dt",dine_type);
      
          //System.out.println(dine_type);
          
       model.addAttribute("dlist", dlist);
       
      return "/dining/dining_reserve";
   }
   
   /*@Override 
   public void getDineAvail(HttpServletRequest request, PrintWriter out, DiningVO dvo) {
      String dine_type=request.getParameter("dine_type");
      
      ArrayList<DiningVO> list=mapper.getDineAvail(dine_type);

      String str="";      
   
      for(int i=0;i<list.size();i++)
      {
         DiningVO dvo2=list.get(i);
         str=str+dvo2.getDine_type()+","+dvo2.getCnt()+",";
      }

      out.print(str);
   }*/

   
   @Override
   public String dining_reserve_next(HttpServletRequest request, Model model, HttpSession session)
   {      
      // jsp에 보내줘야 될내용 => 년,월,일, 방의 정보
       /*int yy=Integer.parseInt(request.getParameter("y"));
       int mm=Integer.parseInt(request.getParameter("m"));
       int dd=Integer.parseInt(request.getParameter("d"));*/    	   

       String dine_type=request.getParameter("dine_type");
       String dr_date=request.getParameter("dr_date");
       String dr_time=request.getParameter("dr_time");
       String adult=request.getParameter("adult");
       String child=request.getParameter("child");
       String baby=request.getParameter("baby");
       /*String dr_total=request.getParameter("dr_total");*/
       
       // 입실일
       /*String ymd=yy+"-"+mm+"-"+dd;*/
       
       DiningVO dvo=mapper.dining_reserve_next("dine_type");
       // request영역에 필요한 값 담기
       /*request.setAttribute("ymd", ymd);*/
       
       model.addAttribute("dine_type", dine_type);
       model.addAttribute("dr_date", dr_date);
       model.addAttribute("dr_time", dr_time);
       model.addAttribute("adult", adult);
       model.addAttribute("child", child);
       model.addAttribute("baby", baby);
       model.addAttribute("dvo", dvo);
       /*model.addAttribute("dr_total", dr_total);*/
       /*model.addAttribute("drvo", drvo);*/
       
      return "/dining/dining_reserve_next";
   }
   
   @Override
   public String dining_reserve_ok(DiningResvVO drvo, HttpSession session)
   {      
	   if(session.getAttribute("userid")!=null)
		{
			String userid=session.getAttribute("userid").toString();
			drvo.setUserid(userid); // drvo에 userid 가져와서 넣기
		}
		else
		{
			String userid="guest";
			drvo.setUserid(userid); // drvo에 userid 가져와서 넣기
		}
		/* 주문번호 생성하기 → 구매날짜(8자리)+난수(4자리)+찐숫자(4자리) */
		Date today = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String now = dateFormat.format(today);
		
		String rand=RandomStringUtils.random(4, false, true);
		
		Integer n=mapper.getBid();
		n++;
		String num=n.toString();
		switch(num.length()) {
			case 1 : num="000"+num; break;
			case 2 : num="00"+num; break;
			case 3 : num="0"+num; break;
		}
		
		
		String bid='d'+now+rand+num;		
		drvo.setBid(bid);
	
      mapper.dining_reserve_ok(drvo);
      return "redirect:/dining/dining_reserve_check?bid="+bid;
   }
   @Override
   public String dining_reserve_check(HttpServletRequest request, Model model)
   {
      
      String bid=request.getParameter("bid");
      
      DiningResvVO drvo=mapper.dining_reserve_check(bid);
	  /*String dr_extrarq=((String)request.getParameter("dr_extrarq")).replace("\r\n", "<br>");*/
                                                  // 줄바뀜
      model.addAttribute("drvo", drvo);
      
      return "/dining/dining_reserve_check";
   }

   @Override
   public String dining_reserve_next_old(HttpServletRequest request, Model model)
   {      
      // jsp에 보내줘야 될내용 => 년,월,일, 방의 정보
       int y=Integer.parseInt(request.getParameter("y"));
       int mm=Integer.parseInt(request.getParameter("m"));
       int dd=Integer.parseInt(request.getParameter("d"));
       String id=request.getParameter("id");
       String dine_type=request.getParameter("dine_type");
       String adult=request.getParameter("adult");
       String child=request.getParameter("child");
       String baby=request.getParameter("baby");
       
       // 입실일
       String ymd=y+"-"+mm+"-"+dd;
       
       DiningVO dvo=mapper.dining_reserve_next_old("id");
       // request영역에 필요한 값 담기
       request.setAttribute("ymd", ymd);
       
       
       model.addAttribute("dine_type", dine_type);
       model.addAttribute("adult", adult);
       model.addAttribute("child", child);
       model.addAttribute("baby", baby);
       
       model.addAttribute("dvo", dvo);
      return "/dining/dining_reserve_next_old";
   }



	

}

