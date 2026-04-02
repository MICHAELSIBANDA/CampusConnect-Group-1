<%-- 
    Document   : RequestSupport
    Created on : 11 Feb 2026, 8:44:17 AM
    Author     : untsa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CampusConnect - Request Academic Support</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
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
            filter: blur(5px);
            z-index: 0;
        }

        /* Center container */
        .container-center {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            position: relative;
            z-index: 1;
        }

        /* Card */
        .support-card {
            background-color: rgba(255, 255, 255, 0.95);
            color: #2c3e50;

            padding: 3rem;
            border-radius: 12px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.5);
        }

        .support-card h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        label {
            font-weight: 500;
            margin-bottom: 5px;
        }

        select, textarea {
           background-color: #ffffff !important;
        color: #2c3e50 !important;
        border: 1px solid #ced4da;
        }

        select:focus, textarea:focus {
            border-color: #1e90ff;
            box-shadow: none;
        }

        .btn-submit {
            background-color: #1e90ff;
            border: none;
            width: 100%;
            padding: 10px;
            font-size: 16px;
        }

        .btn-submit:hover {
            background-color: #0b6fd3;
        }
    </style>
</head>

<body>
    <div class="background"></div>

    <div class="container-center">
        <div class="support-card">
            <h2><i class="fas fa-hands-helping"></i> Request Academic Support</h2>

            <form action="SupportRequestServlet.do" method="POST">

                <div class="mb-3">
                    <label>Type of Support</label>
                    <select name="supportType" class="form-select" required>
                        <option value="" disabled selected>Select support type</option>
                        <option value="Tutoring">Tutoring</option>
                        <option value="Consultation">Consultation</option>
                        <option value="Mentoring">Mentoring</option>
                        <option value="Exam Preparation">Exam Preparation</option>
                    </select>
                </div>

                <div class="mb-4">
                    <label>Description</label>
                    <textarea name="description" rows="5" class="form-control" 
                              placeholder="Briefly describe the support you need..." required></textarea>
                </div>

                <button type="submit" class="btn btn-submit">
                    <i class="fas fa-paper-plane"></i> Submit Request
                </button>

            </form>
        </div>
    </div>
</body>
</html>

