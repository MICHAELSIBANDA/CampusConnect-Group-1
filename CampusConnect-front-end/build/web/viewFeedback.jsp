<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CampusConnect • Feedbacks</title>

<!-- Bootstrap & Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

<style>
/* ===== BODY & BACKGROUND ===== */
body {
    background:#0a0c0e;
    color:white;
    font-family:'Poppins', sans-serif;
    margin:0;
    padding:0;
}

/* ===== TOP NAVBAR ===== */
.top-bar {
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:1rem 2rem;
    background: rgba(0,0,0,0.85);
    border-bottom:1px solid rgba(255,255,255,0.08);
}

.top-bar h4 {
    margin:0;
    font-weight:600;
}

.top-bar a {
    color:#9dc6ff;
    text-decoration:none;
    font-weight:500;
    padding:0.4rem 1rem;
    border-radius:20px;
    background: rgba(70,130,200,0.2);
    transition:0.2s;
}

.top-bar a:hover {
    background:#2a6ebb;
    color:white;
}

/* ===== CONTAINER ===== */
.container-main {
    max-width: 1000px;
    margin: 30px auto;
    padding-bottom:50px;
}

/* ===== SECTION TITLE ===== */
.section-title {
    font-weight:600;
    margin-bottom:20px;
    font-size:1.4rem;
    border-left:4px solid #2a6ebb;
    padding-left:10px;
}

/* ===== FEEDBACK CARDS ===== */
.feedback-card {
    background: rgba(0,0,0,0.85);
    border:1px solid rgba(255,255,255,0.05);
    border-radius:12px;
    padding:20px;
    margin-bottom:20px;
    box-shadow:0 5px 20px rgba(0,0,0,0.5);
    transition:0.3s;
}

.feedback-card:hover {
    transform:translateY(-3px);
    border-color:#2a6ebb;
}

.feedback-header {
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:10px;
}

.feedback-header h5 {
    margin:0;
    font-weight:600;
}

.feedback-header span {
    font-size:0.9rem;
    color:#9aa3ad;
}

.feedback-content {
    color:#e8edf2;
    font-size:0.95rem;
    white-space:pre-line;
}

/* ===== EMPTY STATE ===== */
.empty-state {
    text-align:center;
    padding:30px;
    font-style:italic;
    color:#7a7a7a;
}

/* ===== RESPONSIVE ===== */
@media(max-width:768px) {
    .top-bar { flex-direction: column; gap:10px; }
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

</style>
</head>
<body>

<!-- ===== TOP NAVBAR ===== -->
<div class="top-bar">
    <h4><i class="fa-regular fa-message"></i> Student Feedbacks</h4>
    <div>
        <a href="Admindashboard.jsp"><i class="fa-solid fa-house"></i> Dashboard</a>
        <a href="LogoutServlet.do"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
      
       
    </a>
    </div>
</div>

<div class="container-main">

    <h3 class="section-title"><i class="fa-regular fa-message"></i> All Feedbacks</h3>

    <c:choose>
        <c:when test="${not empty feedbacks}">
            <c:forEach var="fb" items="${feedbacks}">
                <div class="feedback-card">
                    <div class="feedback-header">
                        <h5>Student: <c:out value="${fb.student.studentNumber}"/></h5>
                        <span><c:out value="${fb.createdAt}"/></span>
                    </div>
                    <div class="feedback-content">
                        <strong>Service:</strong> <c:out value="${fb.relatedService}"/><br/>
                        <strong>Rating:</strong> <c:out value="${fb.rating}"/>/5<br/><br/>
                        <c:out value="${fb.comments}"/>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div class="empty-state">
                No feedbacks submitted yet.
            </div>
        </c:otherwise>
    </c:choose>

</div>

</body>
</html>
