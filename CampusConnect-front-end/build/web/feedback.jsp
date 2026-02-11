<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CampusConnect - Feedback</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
        }

        /* Background - matching dashboard style */
        .background {
            position: fixed;
            width: 100%;
            height: 100%;
            background-image: url('https://www.studentroom.co.za/wp-content/uploads/2020/03/Tshwane-University-of-Technology-tut-logo.png');
            background-repeat: repeat;
            background-size: 150px;
            filter: blur(1px);
            z-index: 0;
        }

        /* Container - matching dashboard style */
        .dashboard-container {
            position: relative;
            z-index: 1;
            padding: 30px;
            max-width: 1000px;
            margin: auto;
        }

        /* Main card - matching dashboard style */
        .dashboard-card {
            background: rgba(0,0,0,0.9);
            color: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.5);
        }

        /* Header bar - matching dashboard style */
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #444;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        /* Feedback form container */
        .feedback-container {
            padding: 20px 0;
        }

        .page-title {
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
            color: #fff;
        }

        /* Form styling */
        .form-label {
            font-weight: 500;
            margin-bottom: 8px;
            display: block;
            color: #fff;
        }

        .form-select, .form-control {
            background-color: #111;
            border: 1px solid #333;
            color: #fff;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            width: 100%;
        }

        .form-select:focus, .form-control:focus {
            background-color: #222;
            border-color: #0d6efd;
            color: #fff;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }

        .form-select option {
            background-color: #111;
            color: #fff;
        }

        /* Rating stars */
        .rating-container {
            margin-bottom: 20px;
        }

        .rating-label {
            font-weight: 500;
            margin-bottom: 10px;
            display: block;
            color: #fff;
        }

        .rating-stars {
            display: flex;
            gap: 5px;
            margin-bottom: 10px;
        }

        .star {
            font-size: 32px;
            color: #444;
            cursor: pointer;
            transition: color 0.2s;
        }

        .star:hover, .star.active {
            color: #ffc107;
        }

        .rating-text {
            font-size: 14px;
            color: #aaa;
            margin-top: 5px;
        }

        /* Comments textarea */
        .comments-container {
            margin-bottom: 30px;
        }

        .comments-label {
            font-weight: 500;
            margin-bottom: 10px;
            display: block;
            color: #fff;
        }

        .comments-box {
            background-color: #111;
            border: 1px solid #333;
            color: #fff;
            padding: 15px;
            border-radius: 6px;
            width: 100%;
            min-height: 120px;
            resize: vertical;
            font-family: 'Poppins', sans-serif;
        }

        .comments-box:focus {
            background-color: #222;
            border-color: #0d6efd;
            outline: none;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }

        /* Submit button - matching dashboard feature-box hover color */
        .submit-container {
            text-align: center;
            margin-top: 30px;
        }

        .submit-btn {
            background-color: #0d6efd;
            border: none;
            color: white;
            padding: 12px 40px;
            font-size: 18px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            font-weight: 500;
        }

        .submit-btn:hover {
            background-color: #0b5ed7;
            transform: translateY(-2px);
        }

        /* Animation for title */
        .animated-title span {
            display: inline-block;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.5s forwards;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Back to dashboard link */
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #0d6efd;
            text-decoration: none;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
            color: #0b5ed7;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .dashboard-container {
                padding: 15px;
            }
            
            .dashboard-card {
                padding: 20px;
            }
            
            .page-title {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="background"></div>

    <div class="dashboard-container container">
        <div class="dashboard-card">
            <!-- Header - matching dashboard -->
            <div class="top-bar">
                <h4>CampusConnect</h4>
                <div>
                    <span class="me-3 text-muted">>></span>
                    <a href="dashboard.jsp" class="btn btn-sm btn-outline-light me-2">Dashboard</a>
                    <a href="login.jsp" class="btn btn-sm btn-danger">Logout</a>
                </div>
            </div>

            <!-- Feedback form container -->
            <div class="feedback-container">
                <h1 class="page-title animated-title" id="animatedTitle">SUBMIT FEEDBACK</h1>
                
                <form id="feedbackForm">
                    <!-- Related Service Dropdown -->
                    <div class="form-group">
                        <label class="form-label" for="relatedService">Related Service:</label>
                        <select class="form-select" id="relatedService">
                            <option selected>Math Tutoring</option>
                            <option>Writing Center</option>
                            <option>Career Counseling</option>
                            <option>Library Services</option>
                            <option>IT Support</option>
                            <option>Academic Advising</option>
                        </select>
                    </div>
                    
                    <!-- Rating Stars -->
                    <div class="rating-container">
                        <label class="rating-label">Rating:</label>
                        <div class="rating-stars">
                            <span class="star" data-value="1">?</span>
                            <span class="star" data-value="2">?</span>
                            <span class="star" data-value="3">?</span>
                            <span class="star" data-value="4">?</span>
                            <span class="star" data-value="5">?</span>
                        </div>
                        <div class="rating-text">Click to rate from 1 to 5 stars</div>
                        <input type="hidden" id="ratingValue" name="rating" value="0">
                    </div>
                    
                    <!-- Comments -->
                    <div class="comments-container">
                        <label class="comments-label" for="comments">Comments:</label>
                        <textarea class="comments-box" id="comments" name="comments" placeholder="Please provide your feedback here..."></textarea>
                    </div>
                    
                    <!-- Submit Button -->
                    <div class="submit-container">
                        <button type="submit" class="submit-btn">SUBMIT FEEDBACK</button>
                        <br>
                        <a href="dashboard.jsp" class="back-link">
                            <i class="fas fa-arrow-left me-1"></i> Back to Dashboard
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Animate title word by word
        const titleElement = document.getElementById('animatedTitle');
        const titleWords = titleElement.innerText.split(' ');
        titleElement.innerHTML = '';
        titleWords.forEach((word, i) => {
            const span = document.createElement('span');
            span.innerText = word;
            span.style.animationDelay = (i * 0.2) + 's';
            titleElement.appendChild(span);
            span.appendChild(document.createTextNode(' '));
        });

        // Star rating functionality
        const stars = document.querySelectorAll('.star');
        const ratingValue = document.getElementById('ratingValue');
        
        stars.forEach(star => {
            star.addEventListener('click', function() {
                const value = parseInt(this.getAttribute('data-value'));
                ratingValue.value = value;
                
                // Update star display
                stars.forEach(s => {
                    const starValue = parseInt(s.getAttribute('data-value'));
                    if (starValue <= value) {
                        s.classList.add('active');
                    } else {
                        s.classList.remove('active');
                    }
                });
            });
            
            // Add hover effect
            star.addEventListener('mouseover', function() {
                const value = parseInt(this.getAttribute('data-value'));
                stars.forEach(s => {
                    const starValue = parseInt(s.getAttribute('data-value'));
                    if (starValue <= value) {
                        s.style.color = '#ffc107';
                    }
                });
            });
            
            star.addEventListener('mouseout', function() {
                const currentRating = parseInt(ratingValue.value);
                stars.forEach(s => {
                    const starValue = parseInt(s.getAttribute('data-value'));
                    if (starValue > currentRating) {
                        s.style.color = '#444';
                    }
                });
            });
        });

        // Form submission
        document.getElementById('feedbackForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const service = document.getElementById('relatedService').value;
            const rating = ratingValue.value;
            const comments = document.getElementById('comments').value;
            
            if (rating === "0") {
                alert("Please select a rating before submitting.");
                return;
            }
            
            if (comments.trim() === "") {
                alert("Please add some comments before submitting.");
                return;
            }
            
            // In a real application, you would send this data to a server
            console.log({
                service: service,
                rating: rating,
                comments: comments
            });
            
            // Show success message
            const successMsg = document.createElement('div');
            successMsg.className = 'alert alert-success mt-3';
            successMsg.innerHTML = `
                <i class="fas fa-check-circle me-2"></i>
                <strong>Feedback Submitted Successfully!</strong><br>
                Thank you for your feedback on ${service}. Your ${rating}/5 rating has been recorded.
            `;
            
            const form = document.getElementById('feedbackForm');
            form.parentNode.insertBefore(successMsg, form.nextSibling);
            
            // Reset form
            form.reset();
            ratingValue.value = "0";
            stars.forEach(star => {
                star.classList.remove('active');
                star.style.color = '#444';
            });
            
            // Remove success message after 5 seconds
            setTimeout(() => {
                if (successMsg.parentNode) {
                    successMsg.parentNode.removeChild(successMsg);
                }
            }, 5000);
        });
    </script>
</body>
</html>
