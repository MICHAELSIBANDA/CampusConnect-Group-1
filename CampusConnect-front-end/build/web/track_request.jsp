<%@page import="za.ac.tut.model.entity.SupportRequest"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>My Requests</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

<style>
body{
    background:#0a0c0e;
    color:white;
    font-family:Poppins,sans-serif;
}

.card-box{
    background:rgba(0,0,0,0.85);
    padding:2rem;
    border-radius:18px;
    box-shadow:0 10px 30px rgba(0,0,0,0.6);
}

.filter-btn{
    background:#222;
    border:1px solid #333;
    color:#ccc;
    padding:6px 14px;
    border-radius:6px;
    cursor:pointer;
    margin-right:10px;
}

.filter-btn.active,
.filter-btn:hover{
    background:#0d6efd;
    color:white;
}

table{color:white;}
th{color:#9fb3c8;}

.status-badge{
    padding:6px 12px;
    border-radius:20px;
    font-size:12px;
    font-weight:600;
}

.status-pending{background:#ffc107;color:black;}
.status-approved{background:#28a745;}
.status-rejected{background:#dc3545;}
.status-completed{background:#17a2b8;}

.empty-state{
    text-align:center;
    padding:40px;
    color:#888;
}
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

<div class="container mt-5">
<div class="card-box">
     <a href="dashboard.jsp" class="dashboard-link">
        <i class="fa-solid fa-arrow-left"></i>
        Back to Dashboard
    </a>

<h3><i class="fa fa-file-lines"></i> My Requests</h3>

<hr/>

<!-- FILTER -->
<div class="mb-4">
    <button class="filter-btn active" data-filter="all">All</button>
    <button class="filter-btn" data-filter="PENDING">Pending</button>
    <button class="filter-btn" data-filter="APPROVED">Approved</button>
    <button class="filter-btn" data-filter="COMPLETED">Completed</button>
    <button class="filter-btn" data-filter="REJECTED">Rejected</button>
</div>

<table class="table table-hover">
<thead>
<tr>
    <th>Request ID</th>
<th>Type</th>
<th>Description</th>
<th>Date</th>
<th>Status</th>
<th>Action</th>
</tr>
</thead>

<tbody id="requestsTableBody">

<%
List<SupportRequest> list =
(List<SupportRequest>)request.getAttribute("list");

if(list != null && !list.isEmpty()){

for(SupportRequest r : list){

String status = r.getStatus().name();
%>

<tr data-status="<%= status %>">

<td><%= r.getId() %></td>
<td><%= r.getSupportType().name() %></td>
<td><%= r.getDescription() %></td>
<td><%= r.getCreatedAt() %></td>

<td>
<%
if("PENDING".equals(status)){
%>
<span class="status-badge status-pending">Pending</span>
<%
}else if("APPROVED".equals(status)){
%>
<span class="status-badge status-approved">Approved</span>
<%
}else if("COMPLETED".equals(status)){
%>
<span class="status-badge status-completed">Completed</span>
<%
}else{
%>
<span class="status-badge status-rejected">Rejected</span>
<%
}
%>
</td>

<td>
<button type="button"
        class="btn btn-sm btn-primary view-details"
        data-type="<%= r.getSupportType().name() %>"
        data-desc="<%= r.getDescription() %>"
        data-date="<%= r.getCreatedAt() %>"
        data-status="<%= status %>">
<i class="fa fa-eye"></i> View
</button>
</td>

</tr>

<%
}
}else{
%>

<tr>
<td colspan="5" class="text-center">

    <div class="empty-state">
        <i class="fa fa-folder-open fa-2x mb-3"></i>
        <p>No requests found.</p>

        <a href="<%= request.getContextPath() %>/RequestSupport.jsp"
           class="btn btn-primary mt-3">
            <i class="fa fa-plus"></i> Create Request
        </a>
    </div>

</td>
</tr>


<%
}
%>

</tbody>
</table>

<div id="emptyState" class="empty-state" style="display:none;">
<i class="fa fa-folder-open fa-2x"></i>
<p>No requests match this filter.</p>
</div>

</div>
</div>

<!-- MODAL -->
<div class="modal fade" id="requestModal">
<div class="modal-dialog">
<div class="modal-content bg-dark text-white">

<div class="modal-header">
<h5>Request Details</h5>
<button class="btn-close btn-close-white"
        data-bs-dismiss="modal"></button>
</div>

<div class="modal-body">
<p><b>Type:</b> <span id="mType"></span></p>
<p><b>Description:</b> <span id="mDesc"></span></p>
<p><b>Date:</b> <span id="mDate"></span></p>
<p><b>Status:</b> <span id="mStatus"></span></p>
</div>

</div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>

/* FILTER */
document.querySelectorAll(".filter-btn")
.forEach(btn=>{
btn.addEventListener("click",function(){

document.querySelectorAll(".filter-btn")
.forEach(b=>b.classList.remove("active"));

this.classList.add("active");

let filter=this.dataset.filter;
let rows=document.querySelectorAll("#requestsTableBody tr");
let visible=0;

rows.forEach(r=>{
let status=r.dataset.status;

if(filter==="all" || status===filter){
r.style.display="";
visible++;
}else{
r.style.display="none";
}
});

document.getElementById("emptyState").style.display =
visible===0 ? "block":"none";

});
});

/* MODAL */
document.querySelectorAll(".view-details")
.forEach(btn=>{
btn.addEventListener("click",function(){

document.getElementById("mType").textContent =
this.dataset.type;

document.getElementById("mDesc").textContent =
this.dataset.desc;

document.getElementById("mDate").textContent =
this.dataset.date;

document.getElementById("mStatus").textContent =
this.dataset.status;

new bootstrap.Modal(
document.getElementById("requestModal")
).show();

});
});
</script>

</body>
</html>
