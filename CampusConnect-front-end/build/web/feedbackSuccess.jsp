<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CampusConnect • Feedback Submitted</title>

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
            letter-spacing:-0.5px;
        }

        .dashboard-link{
            color:#9dc6ff;
            text-decoration:none;
            font-weight:500;
            background:rgba(70,130,200,0.2);
            padding:0.4rem 1rem;
            border-radius:20px;
            transition:0.2s;
        }

        .dashboard-link:hover{
            background:#2a6ebb;
            color:white;
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
            border:1px solid rgba(255,255,255,0.08);
            background:#111;
            color:#cfd6dd;
        }

        .pill.success{
            background:rgba(25,135,84,0.18);
            border-color:rgba(25,135,84,0.35);
            color:#7ee2b8;
        }

        .pill.warn{
            background:rgba(255,193,7,0.14);
            border-color:rgba(255,193,7,0.3);
            color:#ffe08a;
        }

        .pill.bad{
            background:rgba(220,53,69,0.16);
            border-color:rgba(220,53,69,0.3);
            color:#ff9aa4;
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
            word-break:break-word;
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

<!-- ===== TOP BANNER ===== -->
<div class="top-banner">
    <h4 class="banner-title">
        <i class="fa-solid fa-circle-check"></i>
        Feedback Outcome
    </h4>

    <a href="dashboard.jsp" class="dashboard-link">
        <i class="fa-solid fa-arrow-left"></i>
        Back to Dashboard
    </a>
</div>

<!-- ===== OUTCOME CARD ===== -->
<div class="result-box">

    <c:choose>
        <!-- SUCCESS CASE -->
        <c:when test="${requestScope.saved eq true || requestScope.success eq true}">
            <div class="d-flex align-items-center justify-content-between flex-wrap gap-2">
                <h3 class="m-0">
                    <i class="fa-solid fa-paper-plane"></i>
                    Feedback Submitted
                </h3>

                <span class="pill success">
                    <i class="fa-solid fa-check"></i>
                    Saved successfully
                </span>
            </div>

            <hr/>

            <p class="text-light" style="opacity:0.9;">
                Thanks! Your feedback has been recorded and will help improve CampusConnect services.
            </p>

            <!-- Feedback summary (works whether you pass a feedback object or individual params) -->
            <div class="meta">
                <div class="label">Service</div>
                <div class="value">
                    <c:out value="${requestScope.feedback.service}" default="${param.service}"/>
                </div>

                <div class="label">Rating</div>
                <div class="value d-flex align-items-center gap-2">
                    <c:set var="ratingVal" value="${not empty requestScope.feedback.rating ? requestScope.feedback.rating : param.rating}"/>
                    <span>${ratingVal}</span>
                    <span class="stars">
                        <c:forEach begin="1" end="${empty ratingVal ? 0 : ratingVal}" var="i">
                            <i class="fa-solid fa-star"></i>
                        </c:forEach>
                    </span>
                </div>

                <div class="label">Comment</div>
                <div class="value" style="font-weight:500; opacity:0.95;">
                    <c:out value="${requestScope.feedback.comment}" default="${param.comment}"/>
                </div>

                <!-- Optional: show an ID or timestamp if your servlet sets it -->
                
                <c:if test="${not empty requestScope.savedAt}">
                    <div class="label">Saved At</div>
                    <div class="value">${requestScope.savedAt}</div>
                </c:if>
            </div>

            <div class="d-flex gap-2 mt-4 flex-wrap">
                <a class="btn btn-main" href="dashboard.jsp">
                    <i class="fa-solid fa-house"></i> Dashboard
                </a>

                <a class="btn btn-ghost" href="feedback.jsp">
                    <i class="fa-solid fa-rotate-left"></i> Submit Another
                </a>
            </div>
        </c:when>

        <!-- FAILURE CASE -->
        <c:otherwise>
            <div class="d-flex align-items-center justify-content-between flex-wrap gap-2">
                <h3 class="m-0">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                    Feedback Not Saved
                </h3>

                <span class="pill bad">
                    <i class="fa-solid fa-xmark"></i>
                    Something went wrong
                </span>
            </div>

            <hr/>

            <p class="text-light" style="opacity:0.9;">
                Your feedback could not be saved. Please try again. If the problem continues, contact support.
            </p>

            <c:if test="${not empty requestScope.error}">
                <div class="meta">
                    <div class="label">Error</div>
                    <div class="value" style="color:#ff9aa4;">
                        <c:out value="${requestScope.error}"/>
                    </div>
                </div>
            </c:if>

            <div class="d-flex gap-2 mt-4 flex-wrap">
                <a class="btn btn-main" href="feedback.jsp">
                    <i class="fa-solid fa-rotate-left"></i> Try Again
                </a>

                <a class="btn btn-ghost" href="dashboard.jsp">
                    <i class="fa-solid fa-house"></i> Dashboard
                </a>
            </div>

            <p class="mt-3" style="opacity:0.65; font-size:0.9rem;">
                Tip: Make sure you selected a service, chose a rating, and typed a comment.
            </p>
        </c:otherwise>
    </c:choose>

</div>

</body>
</html>
