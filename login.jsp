<%-- 
    Document   : login
    Created on : 10 Feb 2026
    Author     : Motsei PC
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CampusConnect - Login</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            overflow: hidden;
        }

        /* ===== Split Background Images ===== */

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
        }

        /* Left image */
        .bg-left {
            left: 0;
            background-image: url('https://www.tut.ac.za/wp-content/uploads/2022/07/tut-campus.jpg');
        }

        /* Right image */
        .bg-right {
            right: 0;
            background-image: url('https://www.tut.ac.za/wp-content/uploads/2021/05/TUT-Students.jpg');
        }

        /* ===== Top Banner ===== */
        .banner {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #000;
            text-align: center;
            padding: 10px 0;
            z-index: 2;
        }

        .banner img {
            height: 60px;
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
        }

        .login-card h2 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .form-control {
            border-radius: 8px;
        }

        .btn-primary {
            border-radius: 8px;
        }

        a {
            color: #0d6efd;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
            .bg-left,
            .bg-right {
                width: 100%;
                filter: blur(6px) brightness(0.6);
            }

            .bg-right {
                display: none; /* hide right image on small screens */
            }
        }
    </style>
</head>

<body>

<!-- ===== Split Background ===== -->
<div class="bg-left"></div>
<div class="bg-right"></div>

<!-- ===== Banner ===== -->
<div class="banner">
    <img src="https://tse1.mm.bing.net/th/id/OIP.izfCn4HNbMQz-RhKwLmxGgAAAA?rs=1&pid=ImgDetMain&o=7&rm=3" alt="TUT Logo">
</div>

<!-- ===== Login Form ===== -->
<div class="container-center">
    <div class="login-card">

        <h2>Login in to CampusConnect</h2>

        <form action="LoginServlet" method="post">

            <!-- Student Email -->
            <div class="mb-3">
                <label>Student Email</label>
                <input type="email" name="email" class="form-control"
                       placeholder="Enter student email" required>
            </div>

            <!-- Password -->
            <div class="mb-3">
                <label>Password</label>
                <input type="password" name="password" class="form-control"
                       placeholder="Enter password" required>
            </div>

            <!-- Button -->
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">
                    Login
                </button>
            </div>

        </form>

        <!-- Register link -->
        <p class="text-center mt-3">
            Don't have an account?
            <a href="register.jsp">Register here</a>
        </p>

        <!-- Error Message -->
        <div class="text-center text-danger mt-2">
            <%= request.getAttribute("errorMessage") != null
                    ? request.getAttribute("errorMessage")
                    : "" %>
        </div>

    </div>
</div>

</body>
</html>
