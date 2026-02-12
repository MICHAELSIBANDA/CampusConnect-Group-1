<!-- ===================================================== -->
<!-- ADMIN DASHBOARD PAGE -->
<!-- File: adminDashboard.jsp -->
<!-- ===================================================== -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CampusConnect • Admin Dashboard</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

    <style>
        body{
            background:#0a0c0e;
            color:white;
            font-family:Poppins,sans-serif;
        }

        .admin-wrapper{
            padding:2rem;
        }

        .admin-card{
            background:rgba(0,0,0,0.85);
            padding:2rem;
            border-radius:20px;
        }

        /* NAVIGATION */
        .nav-pills-custom{
            background:rgba(255,255,255,0.05);
            border-radius:40px;
            padding:0.4rem;
            display:inline-flex;
            flex-wrap:wrap;
            gap:0.3rem;
        }

        .nav-pill-item{
            padding:0.6rem 1.2rem;
            border-radius:30px;
            color:#ddd;
            text-decoration:none;
            transition:0.2s;
            font-size:0.95rem;
        }

        .nav-pill-item:hover{
            background:rgba(255,255,255,0.15);
            color:white;
        }

        .stats-box{
            background:rgba(20,20,30,0.8);
            border-radius:16px;
            padding:1.5rem;
            text-align:center;
        }

        .quick-box{
            background:rgba(20,20,30,0.8);
            border-radius:16px;
            padding:1.5rem;
        }
    </style>
</head>
<body>

<div class="admin-wrapper">
<div class="admin-card">

    <!-- HEADER -->
    <div class="d-flex justify-content-between mb-4">
        <h2>🎓 Admin Dashboard</h2>
        <span class="badge bg-secondary">Admin</span>
    </div>


    <!-- ================= NAVIGATION LINKS ================= -->
    <div class="mb-5">

        <div class="nav-pills-custom">

            <!-- Dashboard -->
            <a href="adminDashboard.jsp" class="nav-pill-item">
                <i class="fa-solid fa-chart-pie"></i> Dashboard
            </a>

            <!-- View Requests -->
            <a href="viewRequests.jsp" class="nav-pill-item">
                <i class="fa-regular fa-file-lines"></i> View Requests
            </a>

            <!-- UPDATE REQUEST STATUS -->
            <a href="updateRequest.jsp" class="nav-pill-item">
                <i class="fa-solid fa-pen-to-square"></i> Update Requests
            </a>

            <!-- CREATE EVENTS -->
            <a href="createEvent.jsp" class="nav-pill-item">
                <i class="fa-solid fa-calendar-days"></i> Create Events
            </a>

            <!-- Announcements -->
            <a href="createAnnouncement.jsp" class="nav-pill-item">
                <i class="fa-solid fa-bullhorn"></i> Announcements
            </a>

            <!-- Feedback -->
            <a href="viewFeedback.jsp" class="nav-pill-item">
                <i class="fa-regular fa-message"></i> Feedback
            </a>

            <!-- Logout -->
            <a href="adminLogin.jsp" class="nav-pill-item">
                <i class="fa-solid fa-right-from-bracket"></i> Logout
            </a>

        </div>
    </div>
    <!-- ==================================================== -->


    <!-- DASHBOARD STATS -->
    <div class="row g-3 mb-5">

        <div class="col-md-4">
            <div class="stats-box">
                <h2>47</h2>
                <small>Total Requests</small>
            </div>
        </div>

        <div class="col-md-4">
            <div class="stats-box">
                <h2>12</h2>
                <small>Pending Requests</small>
            </div>
        </div>

        <div class="col-md-4">
            <div class="stats-box">
                <h2>28</h2>
                <small>Resolved Requests</small>
            </div>
        </div>

    </div>


    <!-- QUICK ACTIONS -->
    <div class="quick-box">

        <h4 class="mb-3">⚡ Quick Actions</h4>

        <a href="updateRequest.jsp" class="btn btn-outline-light mb-2 w-100">
            📝 Update Student Request Status
        </a>

        <a href="createEvent.jsp" class="btn btn-outline-light mb-2 w-100">
            📅 Create New Event
        </a>

        <a href="createAnnouncement.jsp" class="btn btn-outline-light w-100">
            📢 Publish Announcement
        </a>

    </div>

</div>
</div>

</body>
</html>
