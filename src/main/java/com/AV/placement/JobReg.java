package com.AV.placement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@MultipartConfig
@WebServlet("/jobreg")
public class JobReg extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		PrintWriter out=res.getWriter();
		
		String regno=req.getParameter("regno");
		int cid= Integer.parseInt(req.getParameter("companyid"));
		
		String query="insert into appliedcompany (cid,regno) values (?,?)";
		
		try(Connection con=DbConnect.connect()) {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, cid);
			pst.setString(2, regno);
			int row=pst.executeUpdate();
			
			if(row>0) {
				System.out.println(row+" row inserted Successfully...");
				res.sendRedirect("SHome.jsp");			}
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
