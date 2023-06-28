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
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>First Name</label>
                                                        <div class="form-control">${customer.firstName}</div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>Last Name</label>
                                                        <div type="text" class="form-control">${customer.lastName}</div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>Date of Birth</label>
                                                        <div class="cal-icon">
                                                            <div class="form-control datetimepicker">${customer.dob}</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>Address</label>
                                                        <div class="form-control">${customer.phoneNumber}</div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>Email</label>
                                                        <div class="form-control">${customer.email}</div> <!-- email này chưa có nên tôi chế -->
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>Mobile</label>
                                                        <div class="form-control">${customer.customerAddress}</div> 
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
                                                <div class="col-md-12 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Choose your bird</label>
                                                        <select class="form-control">
                                                            <option value="dog">${bird.birdFullname}</option> <!--liệt kê tên mấy con chim của thằng customer ra-->
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
                                            <c:if test="${param.doctor == 'all'}">
                                                <div class="col-md-12 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Choose service</label>
                                                        <select class="form-control" required >
                                                            <option value="">--</option>
                                                            <option value="general">${appoitment.service_}</option> <!--liệt kê services ra-->
                                                        </select>
                                                        <div class="invalid-feedback">Example invalid custom select feedback</div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <div class="col-md-12 col-sm-12">
                                                <div class="form-group">													
                                                    <textarea class="form-control" rows="4" placeholder="Describe bird's symtoms" required></textarea> <!--customer mô tả triệu chứng của con chim--> 
                                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
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
                                            <div class="clinic-details">
                                                <p class="doc-location"><i class="fas fa-map-marker-alt"></i> Long Bien, Hanoi</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Booking Doctor Info -->

                                    <div class="booking-summary">
                                        <div class="booking-item-wrap">
                                            <ul class="booking-date">
                                                <li>Date <span>${appoitment.service_}</span></li>
                                                <li>Time <span>${appoitment.timeslot}</span></li>
                                            </ul>
                                            <ul class="booking-fee">
                                                <!-- <li>Consulting Fee <span>$100</span></li> -->
                                                <li>Booking Fee <span>${appoitment.bookingFee}/span></li> <!--biến này chế vì chưa có-->
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
