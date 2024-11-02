<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.AV.placement.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Prevent from browser back button
    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); // this is for HTTP 1.1 to clear cache.
    response.setHeader("Pragma", "no-cache"); // this is for HTTP 1.0 to clear cache.
    response.setHeader("Expires", "0"); // this is for proxy server to clear cache.
    if(session.getAttribute("admin") == null) { 
        response.sendRedirect("alogin.html"); 
    } 
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Applied Students List</title>
    <link rel="stylesheet" type="text/css" href="css/app.css">
</head>
<body><div class="content">
    <h2>Students applied for placements</h2>
    <table border="2px" style="border-collapse: collapse;">
        <thead>
            <tr style="text-align: center;">
                <th>S.no</th>
                <th>Reg No</th>
                <th>Name</th>
                <th>Course</th>
                <th>Company Applied</th>
                <th>Package</th>
            </tr>
        </thead>
        <tbody>
            <%
            int i = 1;
            String sql = "SELECT regno, name, course FROM student ORDER BY regno";
            String query = "SELECT recruitments.company_name, recruitments.package, appliedcompany.cid, appliedcompany.regno " +
                           "FROM recruitments INNER JOIN appliedcompany " +
                           "ON recruitments.cid = appliedcompany.cid " +
                           "WHERE appliedcompany.regno = ?";
            ResultSet rs = null;
            ResultSet rs1 = null;
            Connection con = null;
            PreparedStatement pst = null;
            try {
                con = DbConnect.connect();
                rs = DbConnect.fetchQ(sql);
                pst = con.prepareStatement(query);
                
                while (rs != null) {
                    String temp = rs.getString("regno");
                    pst.setString(1, temp);
                    rs1 = pst.executeQuery();
                    
                    boolean hasData = false;
                    StringBuilder companies = new StringBuilder();
                    StringBuilder packages = new StringBuilder();
                    
                    while (rs1.next()) {
                        hasData = true;
                        companies.append(rs1.getString("company_name")).append("<br>");
                        packages.append(rs1.getString("package")).append("<br>");
                    }
                    
                    if (hasData) {
                        %>
                        <tr>
                            <td><%= i %></td>
                            <td><%= rs.getString("regno") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("course") %></td>
                            <td><%= companies.toString() %></td>
                            <td><%= packages.toString() %></td>
                        </tr>
                        <%
                    } else {
                        %>
                        <tr>
                            <td><%= i %></td>
                            <td><%= rs.getString("regno") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("course") %></td>
                            <td colspan="2">No recruitment data</td>
                        </tr>
                        <%
                    }
                    if (rs1 != null) rs1.close(); // Close rs1 after each iteration to avoid leaks
                    if(!rs.next()) break;
                    i++;
                }
            } catch (Exception e) {
                System.out.println("Error in fetching details from database: " + e);
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
                if (rs1 != null) try { rs1.close(); } catch (Exception e) { e.printStackTrace(); }
                if (pst != null) try { pst.close(); } catch (Exception e) { e.printStackTrace(); }
                if (con != null) try { con.close(); } catch (Exception e) { e.printStackTrace(); }
            }
            %>
        </tbody>
    </table></div>
</body>
</html>
