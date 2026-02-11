<%-- 
<%-- 
    Document   : adminLogin
    Created on : 11 Feb 2026
    Author     : Motsei PC
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CampusConnect - Admin Login</title>

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
    background-repeat: no-repeat;
    filter: blur(6px) brightness(0.7);
    z-index: 0;
    transition: filter 0.5s;
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
    background-color: #000;
    padding: 10px 0;
    z-index: 2;
    display: flex;
    justify-content: center;
    align-items: center;
}

.banner img {
    height: 60px;
}

/* Mode toggle */

.mode-container {
    position: absolute;
    right: 20px;
    top: 50%;
    transform: translateY(-50%);
    display: flex;
    align-items: center;
    gap: 8px;
    color: #fff;
    font-size: 0.95rem;
    font-weight: 500;
}

.toggle-mode {
    cursor: pointer;
    font-size: 1.3rem;
}

/* ===== Center Layout ===== */

.container-center {
    position: relative;
    z-index: 1;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* ===== Login Card ===== */

.login-card {
    background-color: rgba(0,0,0,0.9);
    color: #fff;
    padding: 2rem;
    border-radius: 12px;
    width: 100%;
    max-width: 420px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.6);
    margin-top: 100px;
    transition: background-color 0.5s, color 0.5s;
}

.login-card h2 {
    text-align: center;
    margin-bottom: 20px;
    font-weight: 600;
}

/* Light mode */

body.light-mode {
    color: #000;
}

body.light-mode .bg-left,
body.light-mode .bg-right {
    filter: blur(4px) brightness(1);
}

body.light-mode .login-card {
    background-color: rgba(255,255,255,0.95);
    color: #000;
}

body.light-mode .banner .mode-container {
    color: #fff;
}

/* Mobile */

@media (max-width: 768px) {
    .bg-left,
    .bg-right {
        width: 100%;
    }

    .bg-right {
        display: none;
    }
}

</style>
</head>

<body>

<!-- ===== Background ===== -->
<div class="bg-left"></div>
<div class="bg-right"></div>

<!-- ===== Banner ===== -->
<div class="banner">

    <img src="https://tse1.mm.bing.net/th/id/OIP.izfCn4HNbMQz-RhKwLmxGgAAAA?rs=1&pid=ImgDetMain&o=7&rm=3"
         alt="TUT Logo">

    <!-- Mode Toggle -->
    <div class="mode-container">
        <span id="modeText">Dark Mode</span>
        <i class="fas fa-adjust toggle-mode" id="modeToggle"></i>
    </div>

</div>

<!-- ===== Admin Login Form ===== -->
<div class="container-center">
    <div class="login-card">

        <h2>
            <i class="fas fa-user-shield me-2"></i>
            Admin Login
        </h2>

        <form action="AdminLoginServlet.do" method="post">

            <!-- Admin name -->
            <div class="mb-3">
                <label>Admin name</label>
                <input type="text"
                       name="name"
                       class="form-control"
                       placeholder="Enter admin name"
                       required>
            </div>

            <!-- Password -->
            <div class="mb-3">
                <label>Password</label>
                <input type="password"
                       name="password"
                       class="form-control"
                       placeholder="Enter password"
                       required>
            </div>

            <!-- Button -->
            <div class="d-grid">
                <button type="submit" class="btn btn-danger">
                    Login as Admin
                </button>
            </div>

        </form>

        <!-- Back to student login -->
        <p class="text-center mt-3">
            Student?
            <a href="index.html">Login here</a>
        </p>

        <!-- Error display -->
        <div class="text-center text-danger mt-2">
            <%= request.getAttribute("errorMessage") != null
                    ? request.getAttribute("errorMessage")
                    : "" %>
        </div>

    </div>
</div>

<!-- ===== Dark/Light Script ===== -->
<script>

const toggle = document.getElementById('modeToggle');
const modeText = document.getElementById('modeText');

toggle.addEventListener('click', () => {

    document.body.classList.toggle('light-mode');

    if (document.body.classList.contains('light-mode')) {
        modeText.innerText = "Light Mode";
    } else {
        modeText.innerText = "Dark Mode";
    }

});

</script>

</body>
</html>
