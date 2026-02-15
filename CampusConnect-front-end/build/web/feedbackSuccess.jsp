<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CampusConnect • Feedback Saved</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

    <style>
        body{
            background:#0a0c0e;
            color:white;
            font-family:Poppins, sans-serif;
        }

        .top-banner{
            background:rgba(0,0,0,0.9);
            padding:1rem 2rem;
            border-bottom:1px solid rgba(255,255,255,0.08);
            display:flex;
            justify-content:space-between;
            align-items:center;
        }

        .banner-title{
            font-weight:600;
        }

        .result-box{
            background:rgba(0,0,0,0.85);
            padding:2rem;
            border-radius:20px;
            width:650px;
            margin:auto;
            margin-top:60px;
            box-shadow:0 10px 30px rgba(0,0,0,0.6);
            border:1px solid rgba(255,255,255,0.05);
        }

        .pill{
            display:inline-flex;
            align-items:center;
            gap:8px;
            padding:0.45rem 0.9rem;
            border-radius:999px;
            font-weight:600;
            background:rgba(25,135,84,0.18);
            border:1px solid rgba(25,135,84,0.35);
            color:#7ee2b8;
        }

        .meta{
            background:#0f1114;
            border:1px solid rgba(255,255,255,0.06);
            border-radius:14px;
            padding:1rem 1.2rem;
            margin-top:1rem;
        }

        .meta .label{
            color:#9aa3ad;
            font-size:0.9rem;
        }

        .meta .value{
            font-weight:600;
            color:#e8edf2;
            margin:0.1rem 0 0.8rem 0;
        }

        .stars i{
            color:#ffd700;
        }

        .btn-main{
            background:#2a6ebb;
            border:none;
            font-weight:500;
        }

        .btn-main:hover{
            background:#1f5aa0;
        }

        .btn-ghost{
            background:transparent;
            border:1px solid rgba(255,255,255,0.18);
            color:#d6dde5;
        }

        .btn-ghost:hover{
            background:rgba(255,255,255,0.06);
            color:white;
        }

        @media (max-width: 768px){
            .result-box{ width:92%; }
        }
    </style>
</head>

<body>

<div class="top-banner">
    <h4 class="banner-title">
        <i class="fa-solid fa-circle-check"></i>
        Feedback Saved
    </h4>
</div>

<div class="result-box">

    <div class="d-flex align-items-center justify-content-between flex-wrap gap-2">
        <h3 class="m-0">
            <i class="fa-solid fa-paper-plane"></i>
            Feedback Saved
        </h3>

        <span class="pill">
            <i class="fa-solid fa-check"></i>
            Submitted
        </span>
    </div>

    <hr/>

    <p style="opacity:0.9;">
        Your feedback has been saved.
    </p>

    <div class="meta">

        <div class="label">Service</div>
        <div class="value">
            <c:out value="${feedback.relatedService}"/>
        </div>

        <div class="label">Rating</div>
        <div class="value d-flex align-items-center gap-2">
            <span>${feedback.rating}</span>
            <span class="stars">
                <c:forEach begin="1" end="${feedback.rating}" var="i">
                    <i class="fa-solid fa-star"></i>
                </c:forEach>
            </span>
        </div>

        <div class="label">Comment</div>
        <div class="value">
            <c:out value="${feedback.comments}"/>
        </div>

    </div>

    <div class="d-flex gap-2 mt-4 flex-wrap">
        <a class="btn btn-main" href="dashboard.jsp">
            <i class="fa-solid fa-house"></i> Dashboard
        </a>

        <a class="btn btn-ghost" href="LogoutServlet.do">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </a>
    </div>

</div>

</body>
</html>
