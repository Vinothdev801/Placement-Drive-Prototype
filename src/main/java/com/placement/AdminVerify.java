package com.placement;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.PasswordAuthentication;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.management.loading.PrivateClassLoader;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
import com.mysql.cj.conf.url.XDevApiDnsSrvConnectionUrl;
import com.mysql.cj.exceptions.RSAException;

@SuppressWarnings("serial")
@WebServlet("/averify")
public class AdminVerify extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		PrintWriter out = res.getWriter();
		String aname=req.getParameter("uname");
		String pass=req.getParameter("password");
		
		res.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		
		String query="Select ausername,password from admin";
		ResultSet rs=null;
		String uname= "",password="";
		
		
		try(Connection con = DbConnect.connect()){
			PreparedStatement pst=con.prepareStatement(query);
				 rs = pst.executeQuery();
				 if (rs.next()) { // Move the cursor to the first row
		                uname = rs.getString(1);
		                password = rs.getString(2);
		            }
		}
		catch (Exception e) {System.out.println("Admin verify failed."+e);}
		
		HttpSession session=req.getSession();
		if(aname.equals(uname) && pass.equals(password)) {
			session.setAttribute("admin", "Admin");
			res.sendRedirect("Ahome.jsp");
		}
		
		else {
			res.setContentType("text/html");
			out.println("Invalid username or password.\n Click <a href='Alogin.html'>here</a> to login.");
		}
	}
}
