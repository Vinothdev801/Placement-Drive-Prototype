package com.AV.placement;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/html")
public class html extends HttpServlet {
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        out.println("<html>");
	        out.println("<head><title>My Servlet</title></head>");
	        out.println("<body>");
	        out.println("<h1>Welcome to My Servlet</h1>");
	        out.println("Click <a href='https://www.example.com'>here</a> to visit Example.com");
	        out.println("</body>");
	        out.println("</html>");
	        out.close();
	    }

}
