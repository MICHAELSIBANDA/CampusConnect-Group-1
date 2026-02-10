<%-- 
    Document   : Register
    Created on : 10 Feb 2026, 7:21:11 PM
    Author     : untsa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register Student Page</title>

    <style>
        
       body {
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background-color: #f4f6f8;
            position: relative;
            color: #222222
        }

        /* Watermark background */
        body::after {
          content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url("https://www.studentroom.co.za/wp-content/uploads/2020/03/Tshwane-University-of-Technology-tut-logo.png");
            background-repeat: no-repeat;
            background-position: center;
            background-size: 500px;   
            opacity: 0.18;            
            pointer-events: none;
            z-index: 0;
                }
        

                    .container {
                width: 450px;
                margin: 80px auto;
                background-color: rgba(255, 255, 255, 0.95); /* slight transparency */
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 6px 15px rgba(0,0,0,0.15);
            }

        h1 {
            text-align: center;
            color: #222222;
            margin-bottom: 10px;
        }

        p {
            text-align: center;
            color: #222222;
            margin-bottom: 20px;
        }

        
        .landing-card {
            text-align: center;
            margin: 15px 0 20px;
        }

        .landing-card img {
            width: 120px;
            height: auto;
            object-fit: contain;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            
        }form, table, p, td, a, input { color: #222222; }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            border: 2px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #1a68d1;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 15px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #1a68d1;
        }
        table td:first-child {
    width: 35%;
    white-space: nowrap;
    font-weight: 600;
    color: #2c3e50;
}

table td:last-child {
    width: 65%;
}
    </style>
</head>

<body>
    <div class="container">
        <div class="landing-card">
            <img src="https://tse1.mm.bing.net/th/id/OIP.izfCn4HNbMQz-RhKwLmxGgAAAA?rs=1&pid=ImgDetMain&o=7&rm=3"
                 alt="CampusConnect Logo">
        </div>
        <h1>Register Student</h1>

        
        

        <p><b>Please enter student details below</b></p>

        <form action="RegisterStudentServlet.do" method="POST">
            <table>
                <tr>
                    <td>Full Name</td>
                    <td><input type="text" name="fullname" required></td>
                </tr>
                <tr>
                    <td>Student No</td>
                    <td><input type="text" name="studNo" required></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" required></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" required></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" name="confirmPassword" required></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="REGISTER">
                    </td>
                </tr>
            </table>
        </form>
        <p>Already have an Account <a href="#">Login Here</a></p>

    </div>
</body>
</html>
