package com.AV.placement;

import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/companies")
public class Admin_Fetch_comp extends HttpServlet {
	protected void doPost(HttpServletRequest req,HttpServletResponse res) {
		
		final String sql ="select * from recruitments";
		try(ResultSet rs= DbConnect.fetchQ(sql)){
			if(rs!=null) {
				System.out.println("companies data fetched by admin...");
				RequestDispatcher rd = req.getRequestDispatcher("companies.jsp");
				rd.forward(req, res);
				
			}
			else {
				System.out.println("data is empty");
			}
		}catch (Exception e) {
			System.out.println("error occured \n"+e);
		}
	}
}
