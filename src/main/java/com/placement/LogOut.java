package com.placement;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogOut extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
//		session.removeAttribute("regno");
//		session.invalidate();
		req.getSession().invalidate();
		
		if(Integer.parseInt(req.getParameter("Identify"))==1)
			res.sendRedirect("Alogin.html");
		
		else
			res.sendRedirect("Slogin.html");
	}
}
