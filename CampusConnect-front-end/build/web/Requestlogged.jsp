<%-- 
    Document   : Requestlogged
    Created on : 11 Feb 2026, 2:22:37 PM
    Author     : untsa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CampusConnect - Request Logged</title>

<!-- Bootstrap & Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

<style>
html, body {
    height: 100%;
    margin: 0;
    font-family: 'Poppins', sans-serif;
    overflow: hidden;
    transition: background-color 0.5s, color 0.5s;
}

/* ===== Split Background ===== */
.bg-left,
.bg-right {
    position: fixed;
    top: 0;
    width: 50%;
    height: 100%;
    background-size: cover;
    background-position: center;
    filter: blur(6px) brightness(0.7);
    z-index: 0;
}

.bg-left {
    left: 0;
    background-image: url('https://www.tut.ac.za/wp-content/uploads/2022/07/tut-campus.jpg');
}

.bg-right {
    right: 0;
    background-image: url('https://www.tut.ac.za/wp-content/uploads/2021/05/TUT-Students.jpg');
}

/* ===== Banner ===== */
.banner {
    position: fixed;
    top: 0;
    width: 100%;
    background: #000;
    padding: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 2;
}

.banner img {
    height: 60px;
}

.mode-container {
    position: absolute;
    right: 20px;
    display: flex;
    align-items: center;
    gap: 8px;
    color: #fff;
}

.toggle-mode {
    cursor: pointer;
    font-size: 1.3rem;
}

/* ===== Center Container ===== */
.container-center {
    position: relative;
    z-index: 1;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    padding-top: 130px;
}

/* ===== Success Card ===== */
.success-card {
    background: rgba(0,0,0,0.9);
    color: #fff;
    padding: 2.5rem;
    border-radius: 14px;
    max-width: 500px;
    width: 100%;
    text-align: center;
    box-shadow: 0 12px 30px rgba(0,0,0,0.6);
}

.success-icon {
    font-size: 3.5rem;
    color: #28a745;
    margin-bottom: 15px;
}

.status {
    font-weight: 600;
    color: #ffc107;
}

.action-links a {
    display: inline-block;
    margin: 10px;
    text-decoration: none;
    font-weight: 600;
}

.btn-dashboard {
    background: #1e90ff;
    color: #fff;
    padding: 10px 18px;
    border-radius: 8px;
}

.btn-dashboard:hover {
    background: #0b6fd3;
}

.btn-logout {
    background: #dc3545;
    color: #fff;
    padding: 10px 18px;
    border-radius: 8px;
}

.btn-logout:hover {
    background: #b02a37;
}

/* ===== Light Mode ===== */
body.light-mode .bg-left,
body.light-mode .bg-right {
    filter: blur(4px) brightness(1);
}

body.light-mode .success-card {
    background: rgba(255,255,255,0.95);
    color: #000;
}

/* ===== Mobile ===== */
@media (max-width: 768px) {
    .bg-left, .bg-right {
        width: 100%;
    }
    .bg-right {
        display: none;
    }
}
</style>
</head>

<body>

<!-- Background -->
<div class="bg-left"></div>
<div class="bg-right"></div>

<!-- Banner -->
<div class="banner">
    <img src="https://tse1.mm.bing.net/th/id/OIP.izfCn4HNbMQz-RhKwLmxGgAAAA?rs=1&pid=ImgDetMain" alt="TUT Logo">

    <div class="mode-container">
        <span id="modeText">Dark Mode</span>
        <i class="fas fa-adjust toggle-mode" id="modeToggle"></i>
    </div>
</div>

<!-- Content -->
<div class="container-center">
    <div class="success-card">
        <i class="fas fa-check-circle success-icon"></i>

        <h2>Request Logged Successfully</h2>
        <p>Your academic support request has been submitted.</p>
        <p>Status: <span class="status">Pending</span></p>

        <div class="action-links mt-4">
            <a href="dashboard.jsp" class="btn-dashboard">
                <i class="fas fa-arrow-left"></i> Dashboard
            </a>
            <a href="LogoutServlet.do" class="btn-logout">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>
</div>

<!-- Dark / Light Mode Script -->
<script>
const toggle = document.getElementById('modeToggle');
const modeText = document.getElementById('modeText');

toggle.addEventListener('click', () => {
    document.body.classList.toggle('light-mode');
    modeText.innerText = document.body.classList.contains('light-mode')
        ? "Light Mode"
        : "Dark Mode";
});
</script>

</body>
</html>

