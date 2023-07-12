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

            <form class="d-flex justify-content-center needs-validation" action="<c:url value="/register"/>" method="post" 
                  novalidate >
                <div class="card w-50 active">
                    <div class="card-header">
                        <h3 class="text-center">Step 1: Enter your Personal Information</h3>
                    </div>
                    <div class="card-body">
                        <!-- Profile Settings Form -->
                        <div class="row form-row">
                            <div class="col-12 col-md-12">
                                <div class="form-group">
                                    <div class="change-avatar">
                                        <div class="profile-img">
                                            <img src="../assets/img/customers/patient.jpg" alt="User Image" />
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
                                    <label>Full Name</label>
                                    <input type="text" name="fullName" class="form-control" placeholder="Richard" />
                                </div>
                            </div>

                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label>Date of Birth</label>

                                    <input type="date" name="dob" required class="form-control" />
        <div class="invalid-feedback"></div>

                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label>Gender</label>
                                    <select class="form-control" name="gender" required>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                        <option value="unknown">Others</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label>Email </label>
                                    <input type="email" name="email" class="form-control" required placeholder="email@example.com" />
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label>Username </label>
                                    <input type="text" name="username" class="form-control" required placeholder="" />
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label>Mobile</label>
                                    <input type="text" name="phone" placeholder="+1 202-555-0125" required class="form-control" />
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Address</label>
                                    <input type="text" name="address" class="form-control" required placeholder="123 Pham Van Hai" />
                                </div>
                            </div>

                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" name="password" class="form-control" placeholder="" required minlength="8" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$" />
                                    <div class="col-auto mt-2 p-0">
                                        <span id="passwordHelpInline" class="text-muted"> Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label>Confirm Password</label>
                                    <input type="password" name="repeat-password" class="form-control" placeholder="" />
                                </div>
                            </div>
                        </div>
                        <div class="submit-section">
                            <button class="btn btn-primary submit-btn">Next</button>
                        </div>
                        <!-- /Profile Settings Form -->
                    </div>
                </div>
                <div class="card w-50">
                    <div class="card-header">
                        <h3 class="text-center">Step 2: Enter your Bird Information</h3>
                    </div>
                    <div class="card-body">
                        <!-- Profile Settings Form -->
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
                                    <input type="text" name="bird-full-name" class="form-control" placeholder="Richard" />
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label>Microchip/Band</label>
                                    <input name="band_chip" type="text" class="form-control" placeholder="" />
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label>Breed</label>
                                    <input name="breed" type="text" class="form-control" placeholder="" />
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label>Hatching date</label>
                                    <div class="cal-icon">
                                        <input name="hatching-date" type="date" class="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label>Gender</label>
                                    <select name="bird-gender" class="form-control select">
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
                                        <input type="text" name="bird-weight" class="form-control" />
                                        <span class="input-group-text">Gram</span>
                                    </div>
                                </div>
                            </div>


                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label>Feather color</label>
                                    <input type="text" name="feather-color" class="form-control" placeholder="" />
                                </div>
                            </div>
                        </div>
                        <div class="submit-section">
                            <button type="submit" class="btn btn-search submit-btn">Back</button>
                            <button type="submit" class="btn btn-primary submit-btn">Done</button>
                        </div>
                        <!-- /Profile Settings Form -->
                    </div>
                </div>

            </form>


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
        });
    </script>
    <script>
        // Custom JavaScript validation
        (function () {
            'use strict';

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation');

            // Loop over them and prevent submission
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    form.classList.add('was-validated');
                }, false);
            });
        })();

        // Go back to the previous step
        function goBack() {
            window.history.back();
        }
    </script>
    <script>
    // Custom JavaScript validation
    (function () {
        'use strict';

        // Retrieve the input element and add event listener
        var dobInput = document.querySelector('input[name="dob"]');
        dobInput.addEventListener('input', validateDateOfBirth);

        function validateDateOfBirth() {
            var selectedDate = new Date(dobInput.value);
            var currentDate = new Date();
            var minimumDate = new Date(currentDate.getFullYear() - 13, currentDate.getMonth(), currentDate.getDate());

            if (selectedDate > minimumDate) {
                dobInput.setCustomValidity("You must be at least 13 years old.");
            } else {
                dobInput.setCustomValidity('');
            }
        }
    })();
</script>
    <!-- /Script -->
</body>
</html>
