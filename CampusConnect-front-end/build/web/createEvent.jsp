<%-- 
    Document   : createEvent.jsp
    Created on : 12 Feb 2026, 06:31:42
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Event</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>


<style>
body{background:#0a0c0e;color:white;font-family:Poppins,sans-serif;}
.form-box{background:rgba(0,0,0,0.85);padding:2rem;border-radius:18px;width:650px;margin:auto;margin-top:60px;}
</style>
</head>
<body>


<div class="form-box">


<h3><i class="fa fa-calendar"></i> Create Event</h3>
<hr/>


<form action="CreateEventServlet.do" method="post">


<label>Title</label>
<input type="text" name="title" class="form-control mb-3" required/>


<label>Description</label>
<textarea name="content" class="form-control mb-3" required></textarea>


<label>Start Date</label>
<input type="datetime-local" name="start" class="form-control mb-3" required/>


<label>End Date</label>
<input type="datetime-local" name="end" class="form-control mb-3" required/>


<button type="submit" class="btn btn-primary w-100">Create Event</button>


</form>


</div>


</body>
</html>