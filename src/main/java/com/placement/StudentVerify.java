package com.placement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/sverify")
public class StudentVerify extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		String regno=req.getParameter("regno");
		String pass=req.getParameter("pass");
		
		res.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		
		PrintWriter out = res.getWriter();
		
		String sql="select regno,password from student";
		
		try {
			
			ResultSet result=DbConnect.fetchQ(sql);
			
			if(result!=null) {
				Boolean bool=false;
				HttpSession session= req.getSession();	
				
				while(result!=null) {
					
					if(regno.equals(result.getString(1)) && pass.equals(result.getString(2))) {
						System.out.println("verified.");
						bool=true;
						break;
						
					}	
					result.next();
				}
				if(bool) {
					session.setAttribute("regno", regno);
					result.close();
					res.sendRedirect("Shome.jsp");
				}
				else {
					
					out.println(" Incorrect Username or Password.");
					res.sendRedirect("Slogin.html");
					
				}
				
			}
			else {
				
				out.println("can't fetch details or user not found....");
				
			}
		} catch (SQLException e) {
			
			out.println(" Error occured.........\n"+e);
			
		}
	}
}
