<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CampusConnect - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>
    <style>
        /* ===== base – same as login page ===== */
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #0a0c0e;
        }

        /* Blurred tiled background */
        .background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('https://www.studentroom.co.za/wp-content/uploads/2020/03/Tshwane-University-of-Technology-tut-logo.png');
            background-repeat: repeat;
            background-size: 150px 150px;
            filter: blur(1px);
            z-index: 0;
            opacity: 0.85;
        }

        /* main admin wrapper */
        .admin-wrapper {
            position: relative;
            z-index: 10;
            padding: 2rem 1.5rem;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* semi‑transparent dark card */
        .admin-card {
            background-color: rgba(0, 0, 0, 0.85);
            backdrop-filter: blur(2px);
            color: #fff;
            border-radius: 20px;
            padding: 2rem 1.8rem;
            box-shadow: 0 15px 35px rgba(0,0,0,0.6);
            border: 1px solid rgba(255,255,255,0.06);
            width: 100%;
        }

        /* inner panels */
        .stats-box, .recent-table, .quick-box {
            background: rgba(20, 20, 30, 0.7);
            border-radius: 16px;
            padding: 1.25rem;
            border: 1px solid rgba(255,255,255,0.05);
            backdrop-filter: blur(2px);
        }

        /* navigation pills */
        .nav-pills-custom {
            background: rgba(0,0,0,0.35);
            border-radius: 40px;
            padding: 0.4rem;
            display: inline-flex;
            flex-wrap: wrap;
            gap: 0.2rem;
        }
        .nav-pill-item {
            padding: 0.6rem 1.2rem;
            border-radius: 30px;
            font-weight: 500;
            color: #ddd;
            transition: 0.2s;
            text-decoration: none;
            font-size: 0.95rem;
        }
        .nav-pill-item:hover {
            background: rgba(255,255,255,0.1);
            color: white;
        }
        .nav-pill-item i {
            margin-right: 6px;
        }
        
        .nav-pill-item.active {
            background: rgba(70, 130, 200, 0.6);
            color: white;
        }

        /* top bar admin profile */
        .admin-profile {
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .admin-badge {
            background: rgba(255,255,255,0.1);
            border-radius: 40px;
            padding: 0.4rem 1.2rem;
            font-weight: 500;
            border: 1px solid rgba(255,255,255,0.15);
            color: white;
            cursor: pointer;
            transition: 0.2s;
        }
        .admin-badge:hover {
            background: rgba(255,255,255,0.2);
        }
        .admin-badge i {
            margin-left: 8px;
            font-size: 0.8rem;
        }

        /* stats cards */
        .stat-item {
            background: rgba(255,255,255,0.03);
            padding: 1rem 0.5rem;
            border-radius: 16px;
            text-align: center;
            border: 1px solid rgba(255,255,255,0.05);
            transition: 0.2s;
        }
        .stat-item:hover {
            background: rgba(70,130,200,0.1);
            border-color: rgba(100,180,255,0.3);
        }
        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            line-height: 1.2;
            color: white;
        }
        .stat-label {
            color: #b0b8c5;
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 1px;
        }

        /* table style */
        .request-table {
            width: 100%;
            color: #eee;
            font-size: 0.95rem;
        }
        .request-table th {
            color: #aab3c0;
            font-weight: 500;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            padding-bottom: 0.75rem;
        }
        .request-table td {
            padding: 0.9rem 0.25rem 0.9rem 0;
            border-bottom: 1px solid rgba(255,255,255,0.03);
        }
        .status-badge {
            background: #2a2f3a;
            padding: 0.25rem 1rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        .status-badge.approved {
            background: rgba(30, 150, 100, 0.25);
            color: #b3f0d0;
        }
        .status-badge.pending {
            background: rgba(220, 170, 30, 0.25);
            color: #ffe08c;
        }
        .status-badge.rejected {
            background: rgba(200, 70, 70, 0.25);
            color: #ffb3b3;
        }
        .action-link {
            color: #b0d4ff;
            text-decoration: none;
            font-size: 0.8rem;
            background: rgba(70,130,200,0.2);
            padding: 0.2rem 0.8rem;
            border-radius: 20px;
            margin-right: 5px;
            border: 1px solid rgba(255,255,255,0.05);
            display: inline-block;
            transition: 0.15s;
        }
        .action-link:hover {
            background: #2a6ebb;
            color: white;
        }

        /* quick action buttons */
        .quick-action-item {
            background: rgba(255,255,255,0.02);
            border-radius: 14px;
            padding: 0.8rem 1.2rem;
            margin-bottom: 8px;
            border-left: 4px solid #3a7eb0;
            transition: 0.1s;
            color: #f0f0f0;
            font-weight: 500;
            display: flex;
            align-items: center;
            text-decoration: none;
        }
        .quick-action-item:hover {
            background: rgba(70,130,200,0.2);
            border-left-color: #82b1ff;
            color: white;
        }
        .quick-action-item i {
            width: 28px;
            color: #96c0ff;
        }

        /* alert messages */
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 8px;
        }
        .alert-success {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }
        .alert-danger {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }
        .alert-info {
            color: #0c5460;
            background-color: #d1ecf1;
            border-color: #bee5eb;
        }

        /* section header */
        .section-header {
            font-weight: 600;
            margin-bottom: 1.2rem;
            color: #fff;
            letter-spacing: -0.5px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* modal styles */
        .modal-content {
            background: rgba(20, 20, 30, 0.95);
            color: white;
            border: 1px solid rgba(255,255,255,0.1);
        }
        .modal-header {
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        .modal-footer {
            border-top: 1px solid rgba(255,255,255,0.1);
        }
        .btn-close-white {
            filter: invert(1) grayscale(100%) brightness(200%);
        }
        
        /* empty state */
        .empty-state {
            text-align: center;
            padding: 2rem;
            color: #8896a8;
        }
        .empty-state i {
            font-size: 2rem;
            margin-bottom: 0.5rem;
            opacity: 0.5;
        }

        /* data placeholder styling */
        .data-placeholder {
            background: rgba(255,255,255,0.05);
            border-radius: 4px;
            display: inline-block;
            min-width: 60px;
            height: 1.2em;
        }
        
        /* responsive adjustments */
        @media (max-width: 768px) {
            .admin-wrapper { padding: 1rem; }
            .nav-pills-custom { flex-direction: column; width: 100%; }
            .admin-card { padding: 1.5rem; }
        }
    </style>
</head>
<body>
    <!-- fixed tiled blurred background -->
    <div class="background"></div>

    <div class="admin-wrapper">
        <!-- main dashboard card -->
        <div class="admin-card">

            <!-- ===== top bar: Admin Panel + profile ===== -->
            <div class="d-flex flex-wrap align-items-center justify-content-between mb-4">
                <div class="d-flex align-items-center gap-3">
                    <i class="fa-solid fa-graduation-cap fa-2xl" style="color: #8cb4ff;"></i>
                    <h2 class="mb-0" style="font-weight: 600; letter-spacing: -0.5px; color: white;">
                        🎓 Admin Panel
                    </h2>
                </div>
                <div class="admin-profile mt-2 mt-sm-0">
                    <span class="admin-badge" data-bs-toggle="modal" data-bs-target="#adminProfileModal">
                        <i class="fa-regular fa-circle-user"></i> 
                        <!-- ADMIN NAME - To be populated from database -->
                        
                        <i class="fa-solid fa-chevron-down"></i>
                    </span>
                    <a href="#" class="btn btn-sm btn-danger">
                        <i class="fa-solid fa-sign-out-alt"></i> Logout
                    </a>
                </div>
            </div>
            
            <!-- ===== Display status messages from servlet ===== -->
            <!-- SUCCESS MESSAGE - To be populated from database -->
            <!-- ERROR MESSAGE - To be populated from database -->

            <!-- ===== navigation pills ===== -->
            <div class="mb-5 d-flex flex-wrap align-items-center justify-content-between">
                <div class="nav-pills-custom">
                    <a href="#" class="nav-pill-item active">
                        <i class="fa-solid fa-chart-pie"></i>Dashboard
                    </a>
                    <a href="#" class="nav-pill-item">
                        <i class="fa-regular fa-file-lines"></i>Requests
                    </a>
                    <a href="#" class="nav-pill-item">
                        <i class="fa-solid fa-bullhorn"></i>Announcements
                    </a>
                    <a href="#" class="nav-pill-item">
                        <i class="fa-solid fa-users"></i>Users
                    </a>
                    <a href="#" class="nav-pill-item">
                        <i class="fa-regular fa-message"></i>Feedback
                    </a>
                    <a href="#" class="nav-pill-item">
                        <i class="fa-solid fa-chart-simple"></i>Analytics
                    </a>
                </div>
                <div class="text-light-emphasis d-none d-md-block">
                    <a href="#" style="color: #ccc; text-decoration: none; position: relative;">
                        <i class="fa-regular fa-bell fa-lg"></i>
                        <!-- NOTIFICATION COUNT - To be populated from database -->
                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 0.6rem;">
                            
                        </span>
                    </a>
                </div>
            </div>

            <!-- ===== DASHBOARD OVERVIEW ===== -->
            <div class="d-flex align-items-center section-header">
                <i class="fa-solid fa-chart-line fa-fw" style="color: #82b1ff;"></i>
                <span>📈 Dashboard Overview</span>
            </div>

            <!-- stats cards row - TO BE POPULATED FROM DATABASE -->
            <div class="row g-3 mb-5">
                <div class="col-md-4 col-6">
                    <div class="stats-box p-3">
                        <div class="stat-item">
                            <!-- TOTAL REQUESTS COUNT - To be populated from database -->
                            <div class="stat-number">
                                
                            </div>
                            <div class="stat-label">Total Requests</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-6">
                    <div class="stats-box p-3">
                        <div class="stat-item">
                            <!-- PENDING REQUESTS COUNT - To be populated from database -->
                            <div class="stat-number">
                                
                            </div>
                            <div class="stat-label">Pending Requests</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-6">
                    <div class="stats-box p-3">
                        <div class="stat-item">
                            <!-- RESOLVED REQUESTS COUNT - To be populated from database -->
                            <div class="stat-number">
                                
                            </div>
                            <div class="stat-label">Resolved This Month</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ===== RECENT REQUESTS SECTION ===== -->
            <div class="d-flex align-items-center section-header mt-2">
                <i class="fa-regular fa-clock"></i>
                <span>Recent Requests</span>
                <form action="#" method="GET" style="margin-left: auto;">
                    <input type="hidden" name="view" value="all">
                    <button type="submit" class="btn btn-sm btn-outline-light">
                        View All <i class="fa-regular fa-arrow-right ms-1"></i>
                    </button>
                </form>
            </div>

            <div class="recent-table mb-5">
                <div style="overflow-x: auto;">
                    <table class="request-table">
                        <thead>
                            <tr>
                                <th>Student ID</th>
                                <th>Student Name</th>
                                <th>Type</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- EMPTY STATE - No data in database -->
                            <tr>
                                <td colspan="6" class="empty-state">
                                    <i class="fa-regular fa-folder-open"></i><br>
                                    No recent requests found
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="text-end mt-2">
                    <span style="color:#8896a8; font-size:0.8rem;">
                        <i class="fa-regular fa-arrow-right"></i> 
                        <!-- MORE REQUESTS COUNT - To be populated from database -->
                        
                        more requests
                    </span>
                </div>
            </div>

            <!-- ===== QUICK ACTIONS ===== -->
            <div class="d-flex align-items-center section-header">
                <i class="fa-solid fa-bolt"></i>
                <span>Quick Actions</span>
            </div>

            <div class="quick-box">
                <a href="#" class="quick-action-item">
                    <i class="fa-regular fa-pen-to-square"></i> 📝 Create Announcement
                </a>
                <a href="#" class="quick-action-item">
                    <i class="fa-regular fa-file-chart-column"></i> 📊 View Feedback Reports
                </a>
                <a href="#" class="quick-action-item" style="margin-bottom:0;">
                    <i class="fa-regular fa-user-gear"></i> 👥 Manage Users
                </a>
            </div>

            <!-- footer decoration -->
            <div class="mt-4 text-center opacity-50" style="color: #b3c2d2; font-size: 0.7rem; letter-spacing: 3px;">
                <i class="fa-regular fa-square"></i> <i class="fa-regular fa-square"></i> <i class="fa-regular fa-square"></i>  
                ADMIN · CAMPUSCONNECT  
                <i class="fa-regular fa-square"></i> <i class="fa-regular fa-square"></i> <i class="fa-regular fa-square"></i>
            </div>
        </div> <!-- /.admin-card -->
    </div> <!-- /.admin-wrapper -->

    <!-- Admin Profile Modal - TO BE POPULATED FROM DATABASE -->
    <div class="modal fade" id="adminProfileModal" tabindex="-1" aria-labelledby="adminProfileModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="adminProfileModalLabel">
                        <i class="fa-regular fa-circle-user me-2"></i>Admin Profile
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="#" method="POST">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <!-- ADMIN USERNAME - To be populated from database -->
                            <input type="text" class="form-control bg-dark text-white border-secondary" 
                                   name="username" value="" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <!-- ADMIN NAME - To be populated from database -->
                            <input type="text" class="form-control bg-dark text-white border-secondary" 
                                   name="fullname" value="">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <!-- ADMIN EMAIL - To be populated from database -->
                            <input type="email" class="form-control bg-dark text-white border-secondary" 
                                   name="email" value="">
                        </div>
                        <hr class="border-secondary">
                        <div class="mb-3">
                            <label class="form-label">Change Password</label>
                            <input type="password" class="form-control bg-dark text-white border-secondary" 
                                   name="newPassword" placeholder="New password">
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control bg-dark text-white border-secondary" 
                                   name="confirmPassword" placeholder="Confirm new password">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>