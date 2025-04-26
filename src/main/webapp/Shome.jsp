<%@page import="java.util.*"%>
<%@page import="com.placement.DbConnect"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<!-- <meta http-equiv="refresh" content="9"> -->
<title>Student Home</title>
<link rel="stylesheet" href="css/shome.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">
</head>
<body>
	<%
    // Prevent from browser back button
    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); // this is for HTTP 1.1 to clear cache.
    response.setHeader("Pragma", "no-cache"); // this is for HTTP 1.0 to clear cache.
    response.setHeader("Expires", "0"); // this is for proxy server to clear cache.
    if (session.getAttribute("regno") == null) {
        response.sendRedirect("Slogin.html");
    }
%>
	<header id="header">
		<h2>Placement Student Portal</h2>
		<nav>
			<a href="Sapplication.jsp">Companies Applied</a> <a
				href="Placement_Prepare.html" target="_blank">Preparation</a> <a
				href="Profile.jsp">Profile</a> <label class="logout" for="sub">
				<svg xmlns="http://www.w3.org/2000/svg" height="24px"
					viewBox="0 -960 960 960" width="24px" fill="#FFFFFF">
                <path
						d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h280v80H200v560h280v80H200Zm440-160-55-58 102-102H360v-80h327L585-622l55-58 200 200-200 200Z" />
            </svg>
			</label>
		</nav>
	</header>
	<form action="logout" method="post">
		<button type="submit" id="sub" hidden>Logout</button>
		<input type="hidden" value="2" name="Identify" />
	</form>
	<hr>
	<div class="body">
		<div class="body_container">
			<div id="regno">HI ${regno}</div>
			<h1 id="title">Welcome to Campus placement</h1>
			<div class="jobaction">
				<table style="border-collapse: collapse">
					<caption colspan="5" style="text-align: center">Apply
						here for campus recruiting opportunities</caption>
					<thead>
						<tr>
							<th>S.no</th>
							<th>Company name</th>
							<th>Eligibility</th>
							<th>Expected Skills</th>
							<th>Job role</th>
							<th>Batch</th>
							<th>Package</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<%
                int i = 1;
                String query = "SELECT * FROM recruitments";
                String sql = "SELECT cid FROM appliedcompany WHERE regno = ?";
                ResultSet rs = null;
                ResultSet r = null;
                Connection con = null;
                PreparedStatement pst = null;
                try {
                    con = DbConnect.connect();
                    rs = DbConnect.fetchQ(query);
                    pst = con.prepareStatement(sql);
                    pst.setString(1, (String) session.getAttribute("regno"));
                    r = pst.executeQuery();
                    
                    // Store applied company IDs in a Set
                    Set<Integer> appliedCompanies = new HashSet<>();
                    while (r.next()) {
                        appliedCompanies.add(r.getInt("cid"));
                    }
                    
                    if (rs != null) {
                        while (rs!=null) {
                            int companyId = rs.getInt("cid");
                            boolean applied = appliedCompanies.contains(companyId);
                            %>
						<tr
							style="text-align:center; <% //if (i % 2 == 0) { %><!--background: #eceff1;  --> <%// } %>">
							<td><%= i %></td>
							<td><%= rs.getString("Company_name") %></td>
							<td><%= rs.getString("eligibility") %></td>
							<td><%= rs.getString("skill") %></td>
							<td><%= rs.getString("role") %></td>
							<td><%= rs.getString("batch") %></td>
							<td><%= rs.getString("package") %></td>
							<td>
								<form action="fetchStudData" method="post">
									<input type="hidden" name="company_id" value='<%= companyId %>' />
									<input type="hidden" name="sregno" value="${regno}">
									<%
                                        if (applied) {
                                        %>
									<button type="submit" id="reg_disabled" disabled>Applied</button>
									<% } else { %>
									<button type="submit" id="reg">Register</button>
									<% } %>
								</form>
							</td>
						</tr>
						<%
                            i++;
                            if(!rs.next())
                            	break;
                        }
                    } else {
                        %>
						<tr>
							<td colspan="7" style="text-align: center; padding: 10px;">No
								companies have posted for recruitment.</td>
						</tr>
						<%
                    }
                } catch (Exception e) {
                    System.out.println("Error in fetching details from database: " + e);
                } finally {
                    if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
                    if (r != null) try { r.close(); } catch (Exception e) { e.printStackTrace(); }
                    if (pst != null) try { pst.close(); } catch (Exception e) { e.printStackTrace(); }
                    if (con != null) try { con.close(); } catch (Exception e) { e.printStackTrace(); }
                }
                %>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<footer>
		<h2>Some of our recruiters</h2>
		<div class="recruiters">
			<center>
				<img src="images/r1.jpg" class="img1" width="1000px" height="250px"
					alt="company1" /> <img src="images/r4.png" class="img2"
					width="1000px" height="250px" alt="company2" /> <img
					src="images/r2.png" class="img3" width="1000px" height="250px"
					alt="company3" />
			</center>
		</div>
	</footer>
</body>
</html>
