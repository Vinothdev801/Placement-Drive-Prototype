package com.AV.placement;

import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fetchStudData")
public class jobRegFetchStudData extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse res) {
		
		String sregno=req.getParameter("sregno");
		int cid=Integer.parseInt(req.getParameter("company_id"));
		
		
		
		String query = "select * from student where regno="+sregno;
		ResultSet rs;
		try{
			rs=DbConnect.fetchQ(query);
			if(rs!=null) {
				System.out.println("Student details fetched...");
				req.setAttribute("regno", sregno);
				req.setAttribute("name", rs.getString("name"));
				req.setAttribute("email", rs.getString("email"));
				req.setAttribute("X",rs.getString("X"));
				req.setAttribute("Xll",rs.getString("Xll"));
				req.setAttribute("ug", rs.getString("ugcgpa"));
				req.setAttribute("pg", rs.getString("pgcgpa"));
				req.setAttribute("skill", rs.getString("skills"));
				req.setAttribute("arrear", rs.getString("arrear"));
				req.setAttribute("course", rs.getString("course"));
				
				req.setAttribute("cid", cid);
				
				System.out.println("cid stud fetch"+cid);
				RequestDispatcher rd =req.getRequestDispatcher("job_stud_reg.jsp");
				rd.forward(req, res);
			}
		}
		catch (Exception e) {
			System.out.println("Error occured");
		}
	}
}
