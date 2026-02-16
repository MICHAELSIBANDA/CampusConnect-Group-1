<%-- 
    Document   : createAnnouncement
    Created on : 12 Feb 2026, 06:30:53
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Announcement</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>


<style>
body{background:#0a0c0e;color:white;font-family:Poppins,sans-serif;}
.form-box{background:rgba(0,0,0,0.85);padding:2rem;border-radius:18px;width:600px;margin:auto;margin-top:60px;}
.dashboard-link{
            color:#9dc6ff;
            text-decoration:none;
            font-weight:500;
            background:rgba(70,130,200,0.2);
            padding:0.4rem 1rem;
            border-radius:20px;
            transition:0.2s;
        }

        .dashboard-link:hover{
            background:#2a6ebb;
            color:white;
        }
</style>
</head>
<body>
    <div class="form-box">
<a href="Admindashboard.jsp" class="dashboard-link">
        <i class="fa-solid fa-arrow-left"></i>
        Back to Dashboard
    </a>

<h3><i class="fa fa-bullhorn"></i> Create Announcement</h3>

<hr/>



<form action="CreateAnnouncementPageServlet.do" method="post">


<label>Title</label>
<input type="text" name="title" class="form-control mb-3" required/>


<label>Content</label>
<textarea name="content" class="form-control mb-3" rows="5" required></textarea>


<button type = "submit" class="btn btn-success w-100 ">Publish Announcement</button>


</form>


</div>


</body>
</html>
