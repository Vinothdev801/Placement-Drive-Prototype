package com.AV.placement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/postjob")
public class PostJob extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name,role,e,skills,sql,query,cemail,batch,lpa;
		
		name=req.getParameter("company_name");
		cemail=req.getParameter("company_email");
		role=req.getParameter("job_role");
		e=req.getParameter("eligible");
		skills=req.getParameter("skills");
		batch=req.getParameter("batch");
		lpa=req.getParameter("package");
		
		sql="INSERT INTO recruitments(company_name, email, role, eligibility, skill, batch, package) VALUES (?,?,?,?,?,?,?)";
		
		query="select * from recruitments where company_name='"+name+"'";
	
		ResultSet rs;
		boolean bool= true;
		
		try {
			
			rs = DbConnect.fetchQ(query);
			while(rs!=null) {
				
				if(rs.getString("company_name").equals(name) && (rs.getString("package").equals(lpa) || rs.getString("role").equals(role))) {
					bool = false;
				} 
				
				rs.next();
			}
		} 
		
		catch (SQLException e1) {
			
			e1.printStackTrace();
		}
		
		
		if(bool) {
			try(Connection con = DbConnect.connect()){
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, name);
				pst.setString(2, cemail);
				pst.setString(3, role);
				pst.setString(4, e);
				pst.setString(5, skills);
				pst.setString(6, batch);
				pst.setString(7, lpa);
				
				int row = pst.executeUpdate();
				
				if(row>0) {
					System.out.println("Job posted successfully...");
					
					req.setAttribute("msg", "true");
					req.getRequestDispatcher("post_job.jsp").forward(req, res);
					
				}
				
				else {
					System.out.println("Error in posting job...");
					req.setAttribute("msg", "false");
				    req.getRequestDispatcher("post_job.jsp").forward(req, res);
					
				}
			}
			
			catch (Exception ex){
				System.out.println("Error occured....\n"+ex);
			}
		}
		
		else {
			req.setAttribute("msg", "already");
			req.getRequestDispatcher("post_job.jsp").forward(req, res);
		}
			
	}
}
