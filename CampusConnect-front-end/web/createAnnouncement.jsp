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


<style>
body{background:#0a0c0e;color:white;font-family:Poppins,sans-serif;}
.form-box{background:rgba(0,0,0,0.85);padding:2rem;border-radius:18px;width:600px;margin:auto;margin-top:60px;}
</style>
</head>
<body>
    <div class="form-box">


<h3><i class="fa fa-bullhorn"></i> Create Announcement</h3>
<hr/>


<form action="CreateAnnouncementServlet.do" method="post">


<label>Title</label>
<input type="text" name="title" class="form-control mb-3" required/>


<label>Content</label>
<textarea name="content" class="form-control mb-3" rows="5" required></textarea>


<button class="btn btn-success w-100">Publish Announcement</button>


</form>


</div>


</body>
</html>
