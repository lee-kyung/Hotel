package kr.co.hotel.mypage;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MyPageService {

	public void myprofile_pwd_ok(HttpSession session, HttpServletRequest request, PrintWriter out);

	public String myprorile(HttpSession session, Model model);

}
