<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CampusConnect • Announcements & Events</title>

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
    letter-spacing:-0.5px;
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
}

/* ===== SECTION TITLES ===== */
.section-title {
    font-weight:600;
    margin-bottom:15px;
    font-size:1.4rem;
    border-left:4px solid #2a6ebb;
    padding-left:10px;
}

/* ===== CARDS ===== */
.card-announcement, .card-event {
    background: rgba(0,0,0,0.85);
    border:1px solid rgba(255,255,255,0.05);
    border-radius:12px;
    padding:20px;
    margin-bottom:20px;
    box-shadow:0 5px 20px rgba(0,0,0,0.5);
    transition:0.3s;
}

.card-announcement:hover, .card-event:hover {
    transform:translateY(-5px);
    border-color:#2a6ebb;
}

/* ===== CARD HEADERS ===== */
.card-header {
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:10px;
}

.card-header h5 {
    margin:0;
    font-weight:600;
}

.card-header span {
    font-size:0.9rem;
    color:#9aa3ad;
}

/* ===== CARD CONTENT ===== */
.card-content {
    color:#e8edf2;
    font-size:0.95rem;
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
</style>
</head>
<body>

<!-- ===== TOP NAVBAR ===== -->
<div class="top-bar">
    <h4><i class="fa-solid fa-bullhorn"></i> Announcements & Events</h4>
    <div>
        <a href="dashboard.jsp"><i class="fa-solid fa-house"></i> Dashboard</a>
        <a href="LogoutServlet.do"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>
</div>

<div class="container-main">

    <!-- ===== ANNOUNCEMENTS ===== -->
    <h3 class="section-title"><i class="fa-solid fa-bullhorn"></i> Announcements</h3>
    <c:choose>
        <c:when test="${not empty announcments}">
            <c:forEach var="ann" items="${announcments}">
                <div class="card-announcement">
                    <div class="card-header">
                        <h5><c:out value="${ann.title}"/></h5>
                        <span><c:out value="${ann.publishedDate}"/></span>
                    </div>
                    <div class="card-content">
                        <c:out value="${ann.content}"/>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div class="empty-state">
                No announcements available at the moment.
            </div>
        </c:otherwise>
    </c:choose>

    <!-- ===== EVENTS ===== -->
    <h3 class="section-title"><i class="fa-solid fa-calendar-days"></i> Events</h3>
    <c:choose>
        <c:when test="${not empty events}">
            <c:forEach var="ev" items="${events}">
                <div class="card-event">
                    <div class="card-header">
                        <h5><c:out value="${ev.title}"/></h5>
                        <span>
                            <c:out value="${ev.startDateAndTime}"/> - <c:out value="${ev.endDateAndTime}"/>
                        </span>
                    </div>
                    <div class="card-content">
                        <c:out value="${ev.content}"/>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div class="empty-state">
                No events scheduled at the moment.
            </div>
        </c:otherwise>
    </c:choose>

</div>

</body>
</html>
