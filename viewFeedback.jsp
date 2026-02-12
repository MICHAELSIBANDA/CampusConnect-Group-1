<%-- 
    Document   : viewFeedback
    Created on : 12 Feb 2026, 06:32:23
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>View Feedback</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>


<style>
body{background:#0a0c0e;color:white;font-family:Poppins,sans-serif;}
.card-box{background:rgba(0,0,0,0.85);padding:2rem;border-radius:18px;margin-top:40px;}
</style>
</head>
<body>


<div class="container">


<div class="card-box">


<h3><i class="fa fa-message"></i> Student Feedback</h3>
<hr/>


<table class="table text-white">
    <thead>
<tr>
<th>Student</th>
<th>Message</th>
<th>Date</th>
</tr>
</thead>


<tbody>


<%-- Example dynamic loop --%>
<tr>
<td>S45678</td>
<td>The tutoring system is very helpful.</td>
<td>11 Feb</td>
</tr>


</tbody>
</table>


</div>


</div>
</body>
</html>
