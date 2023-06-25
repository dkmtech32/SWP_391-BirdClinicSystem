<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../Common/head.jsp"/>
    <body>
        <!-- Main Wrapper -->
        <div class="main-wrapper">
            <!-- Header -->
            <jsp:include page="../Common/header-guest.jsp"/>
            <!--/Header -->

            <!-- Page Content -->
            <div class="container">
                <div class="row">
                    <div class="col text-center mt-4">
                        <h1 class="display-4 text-primary">Register</h1>
                        <p class="lead mt-2">Create your account to get started.</p>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-center">
                <div class="card w-50 active">
                    <div class="card-header">
                        <h3 class="text-center">Step 1: Enter your Personal Information</h3>
                    </div>
                    <div class="card-body">
                        <!-- Profile Settings Form -->
                        <form>
                            <div class="row form-row">
                                <div class="col-12 col-md-12">
                                    <div class="form-group">
                                        <div class="change-avatar">
                                            <div class="profile-img">
                                                <img src="../assets/img/patients/patient.jpg" alt="User Image" />
                                            </div>
                                            <div class="upload-img">
                                                <div class="change-photo-btn">
                                                    <span><i class="fa fa-upload"></i> Upload Photo</span>
                                                    <input type="file" class="upload" />
                                                </div>
                                                <small class="form-text text-muted">Allowed JPG, GIF or PNG. Max size of 2MB</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>First Name</label>
                                        <input type="text" class="form-control" placeholder="Richard" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <input type="text" class="form-control" placeholder="Wilson" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Date of Birth</label>
                                        <div class="cal-icon">
                                            <input type="date" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Gender</label>
                                        <select class="form-control ">
                                            <option>Male</option>
                                            <option>Female</option>
                                            <option>Others</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Email </label>
                                        <input type="email" class="form-control" placeholder="email@example.com" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Mobile</label>
                                        <input type="text" placeholder="+1 202-555-0125" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Address</label>
                                        <input type="text" class="form-control" placeholder="123 Pham Van Hai" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>District</label>
                                        <input type="text" class="form-control" placeholder="Tan Binh" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>City</label>
                                        <input type="text" class="form-control" placeholder="Ho Chi Minh" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" class="form-control" placeholder="" />
                                        <div class="col-auto mt-2 p-0">
                                            <span id="passwordHelpInline" class="text-muted"> Must be 8-20 characters long. </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Confirm Password</label>
                                        <input type="password" class="form-control" placeholder="" />
                                    </div>
                                </div>
                            </div>
                            <div class="submit-section">
                                <button class="btn btn-primary submit-btn">Next</button>
                            </div>
                        </form>
                        <!-- /Profile Settings Form -->
                    </div>
                </div>
                <div class="card w-50">
                    <div class="card-header">
                        <h3 class="text-center">Step 2: Enter your Bird Information</h3>
                    </div>
                    <div class="card-body">
                        <!-- Profile Settings Form -->
                        <form>
                            <div class="row form-row">
                                <div class="col-12 col-md-12">
                                    <div class="form-group">
                                        <div class="change-avatar">
                                            <div class="profile-img">
                                                <img src="../assets/img/bird-avatar.jpg" alt="Bird Image" />
                                            </div>
                                            <div class="upload-img">
                                                <div class="change-photo-btn">
                                                    <span><i class="fa fa-upload"></i> Upload Photo</span>
                                                    <input type="file" class="upload" />
                                                </div>
                                                <small class="form-text text-muted">Allowed JPG, GIF or PNG. Max size of 2MB</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Bird Name</label>
                                        <input type="text" class="form-control" placeholder="Richard" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Microchip</label>
                                        <select class="form-control select">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Breed</label>
                                        <input type="text" class="form-control" placeholder="" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Hatching date</label>
                                        <div class="cal-icon">
                                            <input type="date" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Gender</label>
                                        <select class="form-control select">
                                            <option>Male</option>
                                            <option>Female</option>
                                            <option>Others</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Weight</label>
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" />
                                            <span class="input-group-text">Gram</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Band</label>
                                        <input type="text" placeholder="" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Sex method</label>
                                        <input type="text" placeholder="" class="form-control" />
                                    </div>
                                </div>

                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Feather color</label>
                                        <input type="text" class="form-control" placeholder="" />
                                    </div>
                                </div>
                            </div>
                            <div class="submit-section">
                                <button type="submit" class="btn btn-search submit-btn">Back</button>
                                <button type="submit" class="btn btn-primary submit-btn">Done</button>
                            </div>
                        </form>
                        <!-- /Profile Settings Form -->
                    </div>
                </div>


            </div>

        </div>
        <!-- /Page Content -->

        <!-- Footer -->
        <jsp:include page="../Common/footer.jsp"/>
        <!-- /Footer -->
    </div>
    <!-- /Main Wrapper -->

    <!-- Script -->
    <jsp:include page="../Common/script.jsp"/>
    <script>
        //get the buttons
        const nextButton = document.querySelector('.card.active .submit-section .submit-btn');
        const backButton = document.querySelector('.card:not(.active) .submit-section .submit-btn');

// Get the cards
        const step1Card = document.querySelector('.card.w-50.active');
        const step2Card = document.querySelector('.card.w-50:not(.active)');

// Add click event listeners to the buttons
        nextButton.addEventListener('click', function (e) {
            e.preventDefault();
            step1Card.classList.remove('active');
            step2Card.classList.add('active');
        });

        backButton.addEventListener('click', function (e) {
            e.preventDefault();
            step2Card.classList.remove('active');
            step1Card.classList.add('active');
        });</script>

    <!-- /Script -->
</body>
</html>
