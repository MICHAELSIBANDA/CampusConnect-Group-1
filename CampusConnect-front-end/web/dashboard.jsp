<%-- 
    Document   : dashboard
    Created on : 11 Feb 2026, 11:26:39 AM
    Author     : untsa
--%>

<%@page import="za.ac.tut.model.entity.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CampusConnect Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

<style>
html, body {
    height: 100%;
    margin: 0;
    font-family: 'Poppins', sans-serif;
}

/* Background */
.background {
    position: fixed;
    width: 100%;
    height: 100%;
    background-image: url('https://www.studentroom.co.za/wp-content/uploads/2020/03/Tshwane-University-of-Technology-tut-logo.png');
    background-repeat: repeat;
    background-size: 150px;
    filter: blur(1px);
    z-index: 0;
}

/* Container */
.dashboard-container {
    position: relative;
    z-index: 1;
    padding: 30px;
    max-width: 1000px;   /* limit width */
    margin: auto;        /* center content */
}

/* Main card */
.dashboard-card {
    background: rgba(0,0,0,0.9);
    color: white;
    border-radius: 12px;
    padding: 25px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.5);
}

/* Header bar */
.top-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #444;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

/* Feature boxes */
.feature-box {
    background: #111;
    border: 1px solid #333;
    border-radius: 10px;
    padding: 30px 20px;
    text-align: center;
    cursor: pointer;
    transition: 0.3s;
}

.feature-box:hover {
    background: #0d6efd;
    transform: translateY(-5px);
}

.feature-box i {
    font-size: 28px;
    margin-top: 10px;
}

.welcome-text {
    margin: 20px 0 30px;
}

/* Recent requests box */
.requests-box {
    margin-top: 40px;
    border: 1px solid #444;
    border-radius: 8px;
    padding: 15px;
    background: #111;
}

.requests-row {
    border-bottom: 1px solid #333;
    padding: 8px 0;
}

.requests-row:last-child {
    border-bottom: none;
}
</style>
</head>

<body>

<div class="background"></div>

<div class="dashboard-container container">
<div class="dashboard-card">

<!-- Header -->
<div class="top-bar">
    <h4>CampusConnect</h4>
    <div>
        <span class="me-3">>></span>
        <a href="login.jsp" class="btn btn-sm btn-danger">Logout</a>
    </div>
</div>

<!-- Welcome -->
<h5 class="welcome-text">Welcome, Student!</h5>

<!-- Dashboard Grid -->

<!-- Dashboard Grid -->

<!-- Row 1 -->
<div class="row g-4">
    <div class="col-md-6">
         <a href="RequestSupport.jsp" class="text-decoration-none">
        <div class="feature-box">
            <h6>Request Support</h6>
          
            <i class="fa-solid fa-plus"></i>
        </div>
              </a>
    </div>

    <div class="col-md-6">
        <a href="ViewAnnouncmentsAndEventsServlet.do" class="text-decoration-none">
        <div class="feature-box">
            <h6>Announcements & Events</h6>
            <i class="fa-solid fa-bullhorn"></i>
        </div>
        </a>
    </div>
</div>

<!-- Row 2 -->
<div class="row g-4 mt-1">
    <div class="col-md-6">
        <a href="TrackRequestsServlet.do" class="text-decoration-none">
            <div class="feature-box">
            <h6>Track Requests</h6>
            <i class="fa-solid fa-clipboard-list"></i>
        </div>
        </a>
       
    </div>

    <div class="col-md-6">
        <a href="feedback.jsp" class="text-decoration-none">
           <div class="feature-box">
            <h6>Feedback</h6>
            <i class="fa-solid fa-comment"></i>
        </div> 
        </a>
        
    </div>
</div>





</div>
</div>

</body>
</html>

