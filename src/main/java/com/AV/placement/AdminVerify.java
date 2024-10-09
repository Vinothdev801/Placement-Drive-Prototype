package com.AV.placement;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/averify")
public class AdminVerify extends HttpServlet {
	private static String Admin_id="Admin";
	private static String password="Admin@))#1234";
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		PrintWriter out = res.getWriter();
		String aname=req.getParameter("uname");
		String pass=req.getParameter("password");
		
		res.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		
		if(aname.equals(Admin_id) && pass.equals(password)) {
			res.sendRedirect("ahome.jsp");
		}
		
		else {
			res.setContentType("text/html");
			out.println("Invalid username or password.\n Click <a href='alogin.html'>here</a> to login.");
		}
	}
}
