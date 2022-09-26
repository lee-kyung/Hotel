package kr.co.hotel.diningresv;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.dining.DiningVO;
import kr.co.hotel.room.RoomVO;

@Controller
public class DiningResvController {
	
	@Autowired
	@Qualifier("drs")
	private DiningResvService service;
	
	@RequestMapping("/dining/dining_reserve")
	public String dining_reserve(HttpServletRequest request, Model model, HttpSession session)
	{
		return service.dining_reserve(request, model, session);
	}
	
	@RequestMapping("/dining/getDTresv")
	public void getDTresv(HttpServletRequest request, PrintWriter out)
	{
		service.getDTresv(request, out);
	}

	/*@RequestMapping("/dining/getDineAvail")
	public void getDineAvail(HttpServletRequest request, PrintWriter out, DiningVO dvo)
	{
		service.getDineAvail(request,out,dvo);
	}*/
	
    @RequestMapping("/dining/dining_reserve_next")
    public String dining_reserve_next(HttpServletRequest request, Model model, HttpSession session)
    {
    	return service.dining_reserve_next(request,model,session);
    }
    // old
    @RequestMapping("/dining/dining_reserve_next_old")
    public String dining_reserve_next_old(HttpServletRequest request, Model model)
    {
    	return service.dining_reserve_next_old(request,model);
    }
    //   
    
    @RequestMapping("/dining/dining_reserve_ok")
    public String dining_reserve_ok(DiningResvVO drvo, HttpSession session)
    {
    	return service.dining_reserve_ok(drvo,session);
    }
    @RequestMapping("/dining/dining_reserve_check")
    public String dining_reserve_check(HttpServletRequest request,  Model model)
    {
    	return service.dining_reserve_check(request, model);
    }
    
   /* @RequestMapping("/dining/getcheck")
    public void getcheck(HttpServletRequest request, Model model)
    {
    	service.getcheck(request, model);
    }
    @RequestMapping("/dining/getEmpty")
    public void getEmpty(HttpServletRequest request, Model model)
    {
    	service.getEmpty(request, model);
    }*/



}
