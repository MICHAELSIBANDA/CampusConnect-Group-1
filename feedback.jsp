<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CampusConnect • Student Feedback</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

    <style>
        /* ===== page background ===== */
        body{
            background:#0a0c0e;
            color:white;
            font-family:Poppins, sans-serif;
        }

        /* ===== top banner ===== */
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

        /* ===== feedback card ===== */
        .feedback-box{
            background:rgba(0,0,0,0.85);
            padding:2rem;
            border-radius:20px;
            width:600px;
            margin:auto;
            margin-top:60px;
            box-shadow:0 10px 30px rgba(0,0,0,0.6);
            border:1px solid rgba(255,255,255,0.05);
        }

        /* inputs */
        .form-control, .form-select{
            background:#111;
            border:1px solid rgba(255,255,255,0.08);
            color:white;
        }

        .form-control:focus,
        .form-select:focus{
            background:#111;
            color:white;
            border-color:#3a7eb0;
            box-shadow:none;
        }

        /* rating stars */
        .rating-box{
            display:flex;
            gap:10px;
            font-size:1.4rem;
        }

        .rating-box input{
            display:none;
        }

        .rating-box label{
            cursor:pointer;
            color:#666;
            transition:0.2s;
        }

        .rating-box input:checked ~ label,
        .rating-box label:hover,
        .rating-box label:hover ~ label{
            color:#ffd700;
        }

        /* submit button */
        .submit-btn{
            background:#2a6ebb;
            border:none;
            padding:0.6rem;
            font-weight:500;
        }

        .submit-btn:hover{
            background:#1f5aa0;
        }
    </style>
</head>

<body>

<!-- ===== TOP BANNER ===== -->
<div class="top-banner">

    <h4 class="banner-title">
        <i class="fa-solid fa-comment-dots"></i>
        Student Feedback
    </h4>

    <!-- Link back to dashboard -->
    <a href="studentDashboard.jsp" class="dashboard-link">
        <i class="fa-solid fa-arrow-left"></i>
        Back to Dashboard
    </a>

</div>


<!-- ===== FEEDBACK FORM ===== -->
<div class="feedback-box">

    <h3 class="mb-3">
        <i class="fa-solid fa-paper-plane"></i>
        Submit Feedback
    </h3>

    <hr/>

    <form action="SubmitFeedbackServlet.do" method="post">

        <!-- Service Selection -->
        <label class="form-label">Related Service</label>
        <select name="service" class="form-select mb-3" required>
            <option value="">-- Select Service --</option>
            <option>Tutoring Support</option>
            <option>Academic Consultation</option>
            <option>IT Help Desk</option>
            <option>Accommodation Services</option>
            <option>Library Services</option>
            <option>Student Administration</option>
        </select>


        <!-- Rating -->
        <label class="form-label">Rating</label>

        <div class="rating-box mb-3">

            <input type="radio" name="rating" id="star5" value="5"/>
            <label for="star5"><i class="fa-solid fa-star"></i></label>

            <input type="radio" name="rating" id="star4" value="4"/>
            <label for="star4"><i class="fa-solid fa-star"></i></label>

            <input type="radio" name="rating" id="star3" value="3"/>
            <label for="star3"><i class="fa-solid fa-star"></i></label>

            <input type="radio" name="rating" id="star2" value="2"/>
            <label for="star2"><i class="fa-solid fa-star"></i></label>

            <input type="radio" name="rating" id="star1" value="1"/>
            <label for="star1"><i class="fa-solid fa-star"></i></label>

        </div>


        <!-- Comment -->
        <label class="form-label">Comment</label>
        <textarea name="comment"
                  class="form-control mb-4"
                  rows="5"
                  placeholder="Write your feedback here..."
                  required></textarea>


        <!-- Submit -->
        <button type="submit" class="btn submit-btn w-100">
            <i class="fa-solid fa-paper-plane"></i>
            Submit Feedback
        </button>

    </form>

</div>

</body>
</html>
