<%-- 
    Document   : give-feedback
    Created on : Jul 7, 2023, 8:46:36 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Give Feedback</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            /* Custom CSS for stars */
            .rating-stars {
                display: inline-block;
                font-size: 24px;
                cursor: pointer;
            }
            .rating-stars .fa-star {
                color: #FFD700;
            }
            .rating-stars .fa-star.checked {
                color: #FF8C00;
            }
        </style>
    </head>
    <body>

        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <form method="POST" action="<c:url value="/Customer/Feedback?appointmentID=${requestScope.appointment.appointmentID}"/>">
                        <h2 class="mb-4">Owner's feedback</h2>
                        <!-- Rating Section with Stars and Feedback -->
                        <div class="row owner-feedback mb-3">
                            <div class="col-md-8">
                                <h4>Feedback</h4>
                                <div class="form-group">
                                    <label for="title">Title</label>
                                    <input type="text" class="form-control" id="title" name="title" required/>
                                </div>
                                <div class="form-group">													
                                    <label for="feedbackContent">Feedback</label>
                                    <textarea class="form-control" rows="4" id="feedbackContent" placeholder="Owner's feedback"
                                              style="word-wrap: break-word; height: 9rem" name="feedbackContent" required></textarea>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="feedback-rating">
                                    <h4>Rating</h4>
                                    <div class="rating-stars" id="ratingStars">
                                        <i class="far fa-star" data-rating="1"></i>
                                        <i class="far fa-star" data-rating="2"></i>
                                        <i class="far fa-star" data-rating="3"></i>
                                        <i class="far fa-star" data-rating="4"></i>
                                        <i class="far fa-star" data-rating="5"></i>
                                        <input type="hidden" name="rating" id="rating-value" value="0">
                                    </div>
                                </div>
                            </div>

                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>




        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const ratingStars = document.querySelectorAll('.rating-stars .fa-star');
                const ratingValue = document.getElementById('rating-value');
                const storedRating = localStorage.getItem('selectedRating');

                if (storedRating) {
                    setRating(storedRating);
                }

                ratingStars.forEach(star => {
                    star.addEventListener('mouseover', function () {
                        const rating = this.getAttribute('data-rating');
                        highlightStars(rating);
                    });

                    star.addEventListener('mouseout', function () {
                        resetStars();
                    });

                    star.addEventListener('click', function () {
                        const rating = this.getAttribute('data-rating');
                        setRating(rating);
                        ratingValue.value = rating;
                        localStorage.setItem('selectedRating', rating);
                    });
                });

                function setRating(rating) {
                    ratingStars.forEach(star => {
                        if (star.getAttribute('data-rating') <= rating) {
                            star.classList.add('checked');
                        } else {
                            star.classList.remove('checked');
                        }
                    });
                }

                function highlightStars(rating) {
                    setRating(rating);
                }

                function resetStars() {
                    setRating(ratingValue.value);
                }
            });
        </script>
    </body>
</html>
