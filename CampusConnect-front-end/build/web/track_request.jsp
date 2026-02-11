<%-- 
    Document   : track_request
    Created on : 11 Feb 2026, 12:22:09 PM
    Author     : untsa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CampusConnect - Track Requests</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
        }

        /* Background - matching dashboard style */
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

        /* Container - matching dashboard style */
        .dashboard-container {
            position: relative;
            z-index: 1;
            padding: 30px;
            max-width: 1200px;
            margin: auto;
        }

        /* Main card - matching dashboard style */
        .dashboard-card {
            background: rgba(0,0,0,0.9);
            color: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.5);
            min-height: 80vh;
        }

        /* Header bar - matching dashboard style */
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #444;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }

        /* Breadcrumb */
        .breadcrumb {
            font-size: 14px;
            color: #aaa;
            margin: 10px 0 20px 0;
        }

        .breadcrumb a {
            color: #0d6efd;
            text-decoration: none;
        }

        .breadcrumb a:hover {
            text-decoration: underline;
        }

        .breadcrumb .separator {
            margin: 0 8px;
            color: #666;
        }

        /* Page title */
        .page-title {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 25px;
            color: #fff;
        }

        /* Requests table container */
        .requests-container {
            margin-top: 20px;
        }

        /* Table styling */
        .requests-table {
            width: 100%;
            border-collapse: collapse;
            background: #111;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #333;
        }

        .requests-table thead {
            background: #222;
        }

        .requests-table th {
            padding: 16px 20px;
            text-align: left;
            font-weight: 600;
            color: #fff;
            border-bottom: 2px solid #333;
        }

        .requests-table td {
            padding: 20px;
            border-bottom: 1px solid #333;
            color: #ddd;
        }

        .requests-table tbody tr:last-child td {
            border-bottom: none;
        }

        .requests-table tbody tr:hover {
            background-color: #1a1a1a;
        }

        /* Status badges */
        .status-badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .status-pending {
            background-color: rgba(255, 193, 7, 0.2);
            color: #ffc107;
            border: 1px solid rgba(255, 193, 7, 0.3);
        }

        .status-approved {
            background-color: rgba(25, 135, 84, 0.2);
            color: #198754;
            border: 1px solid rgba(25, 135, 84, 0.3);
        }

        .status-rejected {
            background-color: rgba(220, 53, 69, 0.2);
            color: #dc3545;
            border: 1px solid rgba(220, 53, 69, 0.3);
        }

        .status-completed {
            background-color: rgba(13, 110, 253, 0.2);
            color: #0d6efd;
            border: 1px solid rgba(13, 110, 253, 0.3);
        }

        /* Action buttons */
        .action-btn {
            background: #0d6efd;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .action-btn:hover {
            background: #0b5ed7;
            transform: translateY(-2px);
            color: white;
            text-decoration: none;
        }

        .action-btn-outline {
            background: transparent;
            border: 1px solid #0d6efd;
            color: #0d6efd;
        }

        .action-btn-outline:hover {
            background: #0d6efd;
            color: white;
        }

        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #888;
        }

        .empty-state i {
            font-size: 48px;
            margin-bottom: 20px;
            color: #444;
        }

        .empty-state h4 {
            color: #ccc;
            margin-bottom: 10px;
        }

        /* Filter section */
        .filter-section {
            background: #111;
            border: 1px solid #333;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 25px;
        }

        .filter-title {
            font-weight: 600;
            margin-bottom: 15px;
            color: #fff;
        }

        .filter-options {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .filter-btn {
            background: #222;
            border: 1px solid #333;
            color: #ccc;
            padding: 8px 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .filter-btn:hover, .filter-btn.active {
            background: #0d6efd;
            color: white;
            border-color: #0d6efd;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .dashboard-container {
                padding: 15px;
            }
            
            .dashboard-card {
                padding: 20px;
            }
            
            .requests-table {
                display: block;
                overflow-x: auto;
            }
            
            .filter-options {
                flex-direction: column;
            }
            
            .requests-table th, 
            .requests-table td {
                padding: 12px;
            }
        }

        /* Animation */
        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="background"></div>

    <div class="dashboard-container container">
        <div class="dashboard-card">
            <!-- Header - matching dashboard -->
            <div class="top-bar">
                <h4>CampusConnect</h4>
                <div>
                    <a href="dashboardPage.jsp" class="btn btn-sm btn-outline-light me-2">
                        <i class="fas fa-home me-1"></i> Dashboard
                    </a>
                    <a href="login.jsp" class="btn btn-sm btn-danger">
                        <i class="fas fa-sign-out-alt me-1"></i> Logout
                    </a>
                </div>
            </div>

            <!-- Breadcrumb -->
            <div class="breadcrumb">
                <a href="dashboard.html">Dashboard</a>
                <span class="separator">&gt;</span>
                <span>My Requests</span>
            </div>

            <!-- Page title -->
            <h1 class="page-title">MY REQUESTS</h1>

            <!-- Filter section -->
            <div class="filter-section fade-in">
                <div class="filter-title">Filter by Status:</div>
                <div class="filter-options">
                    <button class="filter-btn active" data-filter="all">All Requests</button>
                    <button class="filter-btn" data-filter="pending">Pending</button>
                    <button class="filter-btn" data-filter="approved">Approved</button>
                    <button class="filter-btn" data-filter="completed">Completed</button>
                    <button class="filter-btn" data-filter="rejected">Rejected</button>
                </div>
            </div>

            <!-- Requests table -->
            <div class="requests-container fade-in">
                <table class="requests-table">
                    <thead>
                        <tr>
                            <th>Type</th>
                            <th>Module</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="requestsTableBody">
                        <!-- Request 1: Tutoring -->
                        <tr data-status="pending">
                            <td><strong>Tutoring</strong></td>
                            <td>Math 101 - Calculus Fundamentals</td>
                            <td>10/01/2024</td>
                            <td><span class="status-badge status-pending">Pending</span></td>
                            <td>
                                <button class="action-btn view-details" data-id="1">
                                    <i class="fas fa-eye me-1"></i> View
                                </button>
                            </td>
                        </tr>
                        
                        <!-- Request 2: Consultation -->
                        <tr data-status="approved">
                            <td><strong>Consultation</strong></td>
                            <td>CS 201 - Data Structures</td>
                            <td>09/28/2024</td>
                            <td><span class="status-badge status-approved">Approved</span></td>
                            <td>
                                <button class="action-btn view-details" data-id="2">
                                    <i class="fas fa-eye me-1"></i> View
                                </button>
                            </td>
                        </tr>
                        
                        <!-- Additional sample requests -->
                        <tr data-status="completed">
                            <td><strong>Tutoring</strong></td>
                            <td>Physics 101 - Mechanics</td>
                            <td>09/15/2024</td>
                            <td><span class="status-badge status-completed">Completed</span></td>
                            <td>
                                <button class="action-btn view-details" data-id="3">
                                    <i class="fas fa-eye me-1"></i> View
                                </button>
                            </td>
                        </tr>
                        
                        <tr data-status="rejected">
                            <td><strong>Consultation</strong></td>
                            <td>Math 202 - Linear Algebra</td>
                            <td>09/10/2024</td>
                            <td><span class="status-badge status-rejected">Rejected</span></td>
                            <td>
                                <button class="action-btn view-details" data-id="4">
                                    <i class="fas fa-eye me-1"></i> View
                                </button>
                            </td>
                        </tr>
                        
                        <tr data-status="pending">
                            <td><strong>Tutoring</strong></td>
                            <td>Chemistry 101 - Organic Chemistry</td>
                            <td>10/05/2024</td>
                            <td><span class="status-badge status-pending">Pending</span></td>
                            <td>
                                <button class="action-btn view-details" data-id="5">
                                    <i class="fas fa-eye me-1"></i> View
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <!-- Empty state (hidden by default) -->
                <div id="emptyState" class="empty-state" style="display: none;">
                    <i class="fas fa-clipboard-list"></i>
                    <h4>No requests found</h4>
                    <p>You don't have any requests matching the selected filter.</p>
                    <a href="request-support.html" class="action-btn mt-3">
                        <i class="fas fa-plus me-1"></i> Create New Request
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Request Details Modal -->
    <div class="modal fade" id="requestModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="background: #111; color: white; border: 1px solid #333;">
                <div class="modal-header border-secondary">
                    <h5 class="modal-title">Request Details</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="detail-item mb-3">
                        <label class="text-muted">Request ID:</label>
                        <p id="detail-id" class="mb-0">-</p>
                    </div>
                    <div class="detail-item mb-3">
                        <label class="text-muted">Type:</label>
                        <p id="detail-type" class="mb-0">-</p>
                    </div>
                    <div class="detail-item mb-3">
                        <label class="text-muted">Subject:</label>
                        <p id="detail-subject" class="mb-0">-</p>
                    </div>
                    <div class="detail-item mb-3">
                        <label class="text-muted">Date Submitted:</label>
                        <p id="detail-date" class="mb-0">-</p>
                    </div>
                    <div class="detail-item mb-3">
                        <label class="text-muted">Status:</label>
                        <p id="detail-status" class="mb-0">-</p>
                    </div>
                    <div class="detail-item mb-3">
                        <label class="text-muted">Description:</label>
                        <p id="detail-description" class="mb-0">-</p>
                    </div>
                    <div class="detail-item">
                        <label class="text-muted">Last Updated:</label>
                        <p id="detail-updated" class="mb-0 text-muted">-</p>
                    </div>
                </div>
                <div class="modal-footer border-secondary">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="editRequestBtn">Edit Request</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS for modal -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Sample request data
        const requestsData = {
            1: {
                id: "REQ-2024-001",
                type: "Tutoring",
                subject: "Math 101 - Calculus Fundamentals",
                date: "10/01/2024",
                status: "Pending",
                description: "Need assistance with understanding limits and derivatives for the upcoming exam.",
                updated: "10/02/2024 14:30"
            },
            2: {
                id: "REQ-2024-002",
                type: "Consultation",
                subject: "CS 201 - Data Structures",
                date: "09/28/2024",
                status: "Approved",
                description: "Request for consultation on algorithm optimization techniques.",
                updated: "09/30/2024 10:15"
            },
            3: {
                id: "REQ-2024-003",
                type: "Tutoring",
                subject: "Physics 101 - Mechanics",
                date: "09/15/2024",
                status: "Completed",
                description: "Weekly tutoring sessions for Newton's laws and kinematics.",
                updated: "09/30/2024 16:45"
            },
            4: {
                id: "REQ-2024-004",
                type: "Consultation",
                subject: "Math 202 - Linear Algebra",
                date: "09/10/2024",
                status: "Rejected",
                description: "Request for extended consultation hours during finals week.",
                updated: "09/12/2024 09:20"
            },
            5: {
                id: "REQ-2024-005",
                type: "Tutoring",
                subject: "Chemistry 101 - Organic Chemistry",
                date: "10/05/2024",
                status: "Pending",
                description: "Help needed with understanding hydrocarbon nomenclature and reactions.",
                updated: "10/05/2024 11:10"
            }
        };

        // Filter functionality
        document.querySelectorAll('.filter-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                // Update active button
                document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                
                const filter = this.getAttribute('data-filter');
                filterRequests(filter);
            });
        });

        function filterRequests(filter) {
            const rows = document.querySelectorAll('#requestsTableBody tr');
            let visibleCount = 0;
            
            rows.forEach(row => {
                const status = row.getAttribute('data-status');
                
                if (filter === 'all' || filter === status) {
                    row.style.display = '';
                    visibleCount++;
                } else {
                    row.style.display = 'none';
                }
            });
            
            // Show/hide empty state
            const emptyState = document.getElementById('emptyState');
            if (visibleCount === 0) {
                emptyState.style.display = 'block';
            } else {
                emptyState.style.display = 'none';
            }
        }

        // View details functionality
        document.querySelectorAll('.view-details').forEach(btn => {
            btn.addEventListener('click', function() {
                const requestId = this.getAttribute('data-id');
                const request = requestsData[requestId];
                
                if (request) {
                    // Populate modal
                    document.getElementById('detail-id').textContent = request.id;
                    document.getElementById('detail-type').textContent = request.type;
                    document.getElementById('detail-subject').textContent = request.subject;
                    document.getElementById('detail-date').textContent = request.date;
                    document.getElementById('detail-description').textContent = request.description;
                    document.getElementById('detail-updated').textContent = `Last updated: ${request.updated}`;
                    
                    // Set status with appropriate badge
                    let statusBadge = '';
                    switch(request.status.toLowerCase()) {
                        case 'pending':
                            statusBadge = '<span class="status-badge status-pending">Pending</span>';
                            break;
                        case 'approved':
                            statusBadge = '<span class="status-badge status-approved">Approved</span>';
                            break;
                        case 'completed':
                            statusBadge = '<span class="status-badge status-completed">Completed</span>';
                            break;
                        case 'rejected':
                            statusBadge = '<span class="status-badge status-rejected">Rejected</span>';
                            break;
                    }
                    document.getElementById('detail-status').innerHTML = statusBadge;
                    
                    // Show modal
                    const modal = new bootstrap.Modal(document.getElementById('requestModal'));
                    modal.show();
                }
            });
        });

        // Edit request button
        document.getElementById('editRequestBtn').addEventListener('click', function() {
            const requestId = document.getElementById('detail-id').textContent;
            alert(`Edit functionality for ${requestId} would open here.\n\nIn a real application, this would redirect to an edit form.`);
            
            // Close modal
            const modal = bootstrap.Modal.getInstance(document.getElementById('requestModal'));
            modal.hide();
        });
    </script>

