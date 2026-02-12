<%-- 
    Document   : viewRequests
    Created on : 12 Feb 2026, 06:26:13
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin • View Student Requests</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>


<!-- SAME STYLING FROM ADMIN PANEL -->
<style>
body{background:#0a0c0e;color:white;font-family:Poppins,sans-serif;}
.card-box{background:rgba(0,0,0,0.85);padding:2rem;border-radius:18px;}
table{color:white;}
th{color:#9fb3c8;}
</style>
</head>
<body>


<div class="container mt-5">
<div class="card-box">


<h3><i class="fa fa-file-lines"></i> All Student Requests</h3>
<hr/>

<table class="table">
<thead>
<tr>
<th>Student No</th>
<th>Type</th>
<th>Description</th>
<th>Date</th>
<th>Status</th>
</tr>
</thead>


<tbody>
<%-- Example loop from DB --%>
<%--
List<Request> list = (List<Request>)request.getAttribute("requests");
for(Request r : list){
--%>


<tr>
<td>S12345</td>
<td>Tutoring</td>
<td>Need Java help</td>
<td>12 Feb</td>
<td><span class="badge bg-warning">Pending</span></td>
</tr>

<%-- } --%>
</tbody>
</table>


</div>
</div>


</body>
</html>
