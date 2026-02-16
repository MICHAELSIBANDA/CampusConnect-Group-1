<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin • Update Request</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>


<style>
body{background:#0a0c0e;color:white;font-family:Poppins,sans-serif;}
.form-box{background:rgba(0,0,0,0.85);padding:2rem;border-radius:18px;width:500px;margin:auto;margin-top:80px;}
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
    <div>
        <a href="Admindashboard.jsp" class="dashboard-link">
        <i class="fa-solid fa-arrow-left"></i>
        Back to Dashboard
    </a>
    </div>

<h3>Update Request Status</h3>

<hr/>


<form action="UpdateRequestServlet.do" method="post">
    <label>Request ID</label>
<input type="text" name="id" class="form-control mb-3" required/>


<label>Status</label>
<select name="status" class="form-control mb-3">
    <option value="PENDING">Pending</option>
    <option value="APPROVED">Approved</option>
    <option value="REJECTED">Rejected</option>
    <option value="COMPLETED">Completed</option>
</select>


<button type="submit" class="btn btn-primary w-100">Update Status</button>


</form>


</div>


</body>
</html>