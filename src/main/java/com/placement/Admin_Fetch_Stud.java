package com.placement;

import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/students")
public class Admin_Fetch_Stud extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse res) {
		final String sql="select * from student";
		
		try(ResultSet rs = DbConnect.fetchQ(sql)){
			if(rs!=null) {
				System.out.println("Student fetched by admin...");
				RequestDispatcher rd = req.getRequestDispatcher("Students.jsp");
				rd.forward(req, res);
				
			}
		}
		catch(Exception e){
			System.out.println("Data is empty");
		}
	}
}
