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
    overflow: hidden;
    transition: background-color 0.5s, color 0.5s;
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

/* ===== Top Banner ===== */
.banner {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background-color: #000;
    text-align: center;
    padding: 10px ;
    z-index: 2;
    display: flex;
    justify-content: center;
    align-items: center;
}

.banner img {
    height: 60px;
}

/* Mode toggle container */
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
    align-items: flex-start; /* align to top instead of center */
    padding-top: 120px; /* space from the banner */
}
/* ===== Support Card ===== */
.support-card {
    background-color: rgba(0,0,0,0.9);
    color: #fff;
    padding: 2.5rem;
    border-radius: 12px;
    width: 100%;
    max-width: 500px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.6);
    transition: background-color 0.5s, color 0.5s;
}

.support-card h2 {
    text-align: center;
    margin-bottom: 25px;
    font-weight: 600;
}

.form-control, select, textarea {
    border-radius: 8px;
}

.btn-submit {
    border-radius: 8px;
    background-color: #1e90ff;
    border: none;
    width: 100%;
    padding: 10px;
    font-size: 16px;
}

.btn-submit:hover {
    background-color: #0b6fd3;
}

/* ===== Light Mode Styles ===== */
body.light-mode {
    color: #000;
}

body.light-mode .bg-left,
body.light-mode .bg-right {
    filter: blur(4px) brightness(1);
}

body.light-mode .support-card {
    background-color: rgba(255,255,255,0.95);
    color: #000;
}

body.light-mode .banner .mode-container {
    color: #fff;
}

/* ===== Mobile ===== */
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

<!-- ===== Split Background ===== -->
<div class="bg-left"></div>
<div class="bg-right"></div>

<!-- ===== Banner ===== -->
<div class="banner">
    <img src="https://tse1.mm.bing.net/th/id/OIP.izfCn4HNbMQz-RhKwLmxGgAAAA?rs=1&pid=ImgDetMain&o=7&rm=3" alt="TUT Logo">

    <!-- Mode Toggle -->
    <div class="mode-container">
        <span id="modeText">Dark Mode</span>
        <i class="fas fa-adjust toggle-mode" id="modeToggle"></i>
    </div>
</div>

<!-- ===== Support Request Form ===== -->
<div class="container-center">
    <div class="support-card">
        <h2><i class="fas fa-hands-helping"></i> Request Academic Support</h2>

        <form action="SupportRequestServlet.do" method="POST">

            <div class="mb-3">
                <label>Type of Support</label>
                <select name="supportType" class="form-select" required>
                    <option value="" disabled selected>Select support type</option>
                    <option value="TUTORING">Tutoring</option>
                    <option value="CONSULTATION">Consultation</option>
                </select>
            </div>

            <div class="mb-4">
                <label>Description</label>
                <textarea name="description" rows="5" class="form-control"
                          placeholder="Briefly describe the support you need..." required></textarea>
            </div>

            <button type="submit" class="btn-submit">
                <i class="fas fa-paper-plane"></i> Submit Request
            </button>

        </form>
    </div>
</div>

<!-- ===== Dark / Light Script ===== -->
<script>
const toggle = document.getElementById('modeToggle');
const modeText = document.getElementById('modeText');

toggle.addEventListener('click', () => {
    document.body.classList.toggle('light-mode');
    modeText.innerText = document.body.classList.contains('light-mode') ? "Light Mode" : "Dark Mode";
});
</script>

</body>
</html>



