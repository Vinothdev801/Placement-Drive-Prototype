<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin home</title>
<link rel="stylesheet" href="css/ahome.css">
</head>
<body>
    <header>
        <h2>Admin Panel</h2>
        <nav>
          <a href="postjob.jsp">Post Jobs</a>
          <a href="companies">Companies</a>
          <a href="students">Students</a>
          <a href="applications.jsp">Application</a>
          <label class="logout" for="sub"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#FFFFFF">
            <path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h280v80H200v560h280v80H200Zm440-160-55-58 102-102H360v-80h327L585-622l55-58 200 200-200 200Z"/></svg></label>
            
        </nav>
      </header>
      <form action="logout" method="post">
        <button type="submit" id="sub" hidden>Logout</button>
        <input type="hidden" value="1" name="Identify" />
      </form>
      <hr />
      <div class="body">
        <div class="content">
          <h1>Welcome admin</h1>
        </div>
     </div>
</body>
</html>