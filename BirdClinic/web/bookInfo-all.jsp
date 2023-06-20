<%-- 
    Document   : bookInfo-all
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="Common/head.jsp"/>
    <body>
        <!-- Main Wrapper -->
        <div class="main-wrapper">
            <!-- Header -->
            <jsp:include page="Common/header-guest.jsp"/>
            <!--/Header -->

            <!-- Breadcrumb -->
            <jsp:include page="Common/breadcrumb.jsp"/>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-7 col-lg-8">
                            <div class="card">
                                <div class="card-body">
                                    <!-- Checkout Form -->
                                    <form action="booking-success.jsp">
                                        <!-- Personal Information -->
                                        <div class="info-widget">
                                            <h4 class="card-title">Personal Information</h4>
                                            <div class="row">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Full Name</label>
                                                        <input class="form-control" type="text" value="Nguyen Van G" />
                                                    </div>
                                                </div>												
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Email</label>
                                                        <input class="form-control" type="email" value="test@gmail.com" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Phone</label>
                                                        <input class="form-control" type="text" value="0999999000"/>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Gender</label>
                                                        <select class="form-control">
                                                            <option value="Male">Male</option>
                                                            <option value="Female">Female</option>
                                                            <option value="Other">Other</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- <div class="exist-customer">Existing Customer? <a href="#">Click here to login</a></div> -->
                                        </div>
                                        <!-- /Personal Information -->
                                        <!-- Bird info -->
                                        <div class="info-widget">
                                            <h4 class="card-title">Bird Information</h4>
                                            <div class="row">
                                                <!-- <div class="col-md-6 col-sm-12">
                                                        <div class="form-group card-label">
                                                                <label>Name</label>
                                                                <input class="form-control" type="text" value="Chó" />
                                                        </div>
                                                </div>												
                                                <div class="col-md-6 col-sm-12">
                                                        <div class="form-group card-label">
                                                                <label>Breed</label>
                                                                <input class="form-control" type="text" value="Parrot" />
                                                        </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                        <div class="form-group card-label">
                                                                <label>Date of Birth</label>
                                                                <input class="form-control" type="date" value="2022-12-15" name="dob"/>
                                                        </div>
                                                </div> -->
                                                <!-- <div class="col-md-6 col-sm-12">
                                                        <div class="form-group card-label">
                                                                <label>Gender</label>
                                                                <select class="form-control">
                                                                        <option value="Male">Male</option>
                                                                        <option value="Female">Female</option>
                                                                        <option value="Other">Other</option>
                                                                </select>
                                                        </div>
                                                </div> -->
                                                <div class="col-md-12 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Choose your bird</label>
                                                        <select class="form-control">
                                                            <option value="dog">Chó</option>
                                                            <option value="cat">Mèo</option>
                                                            <option value="bird">Chim</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- <div class="exist-customer">Existing Customer? <a href="#">Click here to login</a></div> -->
                                        </div>
                                        <!-- /Bird info -->
                                        <!-- Notes section -->
                                        <div class="info-widget">
                                            <h4 class="card-title">Notes</h4>
                                            <div class="col-md-12 col-sm-12">
                                                <div class="form-group card-label">
                                                    <label>Choose specialty</label>
                                                    <select class="form-control" required >
                                                        <option value="">--</option>
                                                        <option value="general">General</option>
                                                        <option value="surgery">Surgery</option>
                                                        <option value="imaging">Imaging</option>
                                                        <option value="nutrition">Nutrition</option>
                                                        <option value="genetics">Genetics</option>
                                                    </select>
                                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12">
                                                <div class="form-group">													
                                                    <textarea class="form-control" rows="4" placeholder="Describe bird's symtoms" ></textarea>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- /Notes section -->
                                        <!-- Submit Section -->
                                        <div class="submit-section mt-4">
                                            <button type="submit" class="btn btn-primary submit-btn">Confirm and submit</button>
                                        </div>
                                        <!-- /Submit Section -->
                                    </form>
                                    <!-- /Checkout Form -->
                                </div>
                            </div>
                        </div>

                        <div class="col-md-5 col-lg-4 theiaStickySidebar">
                            <!-- Booking Summary -->
                            <div class="card booking-card">
                                <div class="card-header">
                                    <h4 class="card-title">Booking Summary</h4>
                                </div>
                                <div class="card-body">
                                    <!-- Booking Doctor Info -->
                                    <div class="booking-doc-info">
                                        <a href="doctor-profile.jsp" class="booking-doc-img">
                                            <img src="assets/img/logo.png" alt="User Image" />
                                        </a>
                                        <div class="booking-info">
                                            <h4><a href="doctor-profile.jsp">BirdLover Clinic</a></h4>
                                            <!-- <div class="rating">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star"></i>
                                                    <span class="d-inline-block average-rating">35</span>
                                            </div> -->
                                            <div class="clinic-details">
                                                <p class="doc-location"><i class="fas fa-map-marker-alt"></i> Long Bien, Hanoi</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Booking Doctor Info -->

                                    <div class="booking-summary">
                                        <div class="booking-item-wrap">
                                            <ul class="booking-date">
                                                <li>Date <span>16 Jun 2023</span></li>
                                                <li>Time <span>10:00 AM</span></li>
                                            </ul>
                                            <ul class="booking-fee">
                                                <!-- <li>Consulting Fee <span>$100</span></li> -->
                                                <li>Booking Fee <span>$10</span></li>
                                                <!-- <li>Video Call <span>$50</span></li> -->
                                            </ul>
                                            <!-- <div class="booking-total">
                                                    <ul class="booking-total-list">
                                                            <li>
                                                                    <span>Total</span>
                                                                    <span class="total-cost">$160</span>
                                                            </li>
                                                    </ul>
                                            </div> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Booking Summary -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include page="Common/footer.jsp"/>
            <!-- /Footer -->
        </div>
        <!-- /Main Wrapper -->

        <!-- Script -->
        <jsp:include page="Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
