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
            <jsp:include page="../Common/header.jsp"/>
            <!--/Header -->

            <!-- Breadcrumb -->
            <jsp:include page="../Common/breadcrumb.jsp"/>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container">
                    <!-- Doctor Widget -->
                    <div class="card">
                        <div class="card-body">
                            <div class="doctor-widget">
                                <div class="doc-info-left">
                                    <div class="doctor-img">
                                        <img src="<c:url value="/images/doctors/${requestScope.doctor.image.imageURLName}"/>" class="img-fluid" alt="${requestScope.doctor.userName}" />
                                    </div>
                                    <div class="doc-info-cont">
                                        <h4 class="doc-name">${requestScope.doctor.fullName}</h4>
                                        <p class="doc-speciality">${requestScope.doctor.academicTitle} ${requestScope.doctor.degree} </p>
                                        <p class="doc-department">${requestScope.doctor.speciality.specialityName}</p>
                                        <c:choose>
                                            <c:when test="${requestScope.ratings.floatValue() <=1}">
                                                <div class="rating">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                            </c:when>
                                            <c:when test="${requestScope.ratings.floatValue() > 1 && requestScope.ratings.floatValue() < 2}">
                                                <div class="rating">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star-half-alt filled"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                            </c:when>
                                            <c:when test="${requestScope.ratings.floatValue() == 2}">
                                                <div class="rating">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                            </c:when>
                                            <c:when test="${requestScope.ratings.floatValue() > 2 && requestScope.ratings.floatValue() < 3}">
                                                <div class="rating">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star-half-alt filled"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                            </c:when>
                                            <c:when test="${requestScope.ratings.floatValue() ==3}">
                                                <div class="rating">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                            </c:when>
                                            <c:when test="${requestScope.ratings.floatValue() > 3 && requestScope.ratings.floatValue() < 4}">
                                                <div class="rating">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star-half-alt filled"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                            </c:when>
                                            <c:when test="${requestScope.ratings.floatValue() == 4}">
                                                <div class="rating">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                            </c:when>
                                            <c:when test="${requestScope.ratings.floatValue() > 4 && requestScope.ratings.floatValue() < 5}">
                                                <div class="rating">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star-half-alt filled"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                            </c:when>
                                            <c:when test="${requestScope.ratings.floatValue() == 5}">
                                                <div class="rating">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                </div>
                                            </c:when>
                                        </c:choose>

                                        <!--                                        <div class="rating">
                                                                                    <i class="fas fa-star filled"></i>
                                                                                    <i class="fas fa-star filled"></i>
                                                                                    <i class="fas fa-star filled"></i>
                                                                                    <i class="fas fa-star filled"></i>
                                                                                    <i class="fas fa-star"></i>
                                                                                    <span class="d-inline-block average-rating">(35)</span>
                                                                                </div>-->
                                    </div>
                                </div>
                                <div class="doc-info-right">
                                    <div class="clinic-booking">
                                        <a class="apt-btn" href="<c:url value="/Customer/prepareDatetime?doctorID=${requestScope.doctor.userID}"/>">Book Appointment</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Doctor Widget -->

                    <!-- Doctor Details Tab -->
                    <div class="card">
                        <div class="card-body pt-0">
                            <!-- Tab Menu -->
                            <nav class="user-tabs mb-4">
                                <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                    <li class="nav-item">
                                        <a class="nav-link" >Business Hours</a>
                                    </li>
                                </ul>
                            </nav>
                            <!-- /Tab Menu -->

                            <!-- Tab Content -->
                            <div class="tab-content pt-0">
                                <!-- Business Hours Content -->
                                <div  id="doc_business_hours" class="tab-pane fade show active">
                                    <div class="row">
                                        <div class="col-md-6 offset-md-3">
                                            <!-- Business Hours Widget -->
                                            <div class="widget business-widget">
                                                <div class="widget-content">
                                                    <div class="listing-hours">
                                                        <div class="listing-day current">
                                                            <div class="day">Today <span>5 Nov 2019</span></div>
                                                            <div class="time-items">
                                                                <span class="open-status"><span class="badge bg-success-light">Open Now</span></span>
                                                                <span class="time">07:00 AM - 09:00 PM</span>
                                                            </div>
                                                        </div>
                                                        <div class="listing-day">
                                                            <div class="day">Monday</div>
                                                            <div class="time-items">
                                                                <span class="time">07:00 AM - 09:00 PM</span>
                                                            </div>
                                                        </div>
                                                        <div class="listing-day">
                                                            <div class="day">Tuesday</div>
                                                            <div class="time-items">
                                                                <span class="time">07:00 AM - 09:00 PM</span>
                                                            </div>
                                                        </div>
                                                        <div class="listing-day">
                                                            <div class="day">Wednesday</div>
                                                            <div class="time-items">
                                                                <span class="time">07:00 AM - 09:00 PM</span>
                                                            </div>
                                                        </div>
                                                        <div class="listing-day">
                                                            <div class="day">Thursday</div>
                                                            <div class="time-items">
                                                                <span class="time">07:00 AM - 09:00 PM</span>
                                                            </div>
                                                        </div>
                                                        <div class="listing-day">
                                                            <div class="day">Friday</div>
                                                            <div class="time-items">
                                                                <span class="time">07:00 AM - 09:00 PM</span>
                                                            </div>
                                                        </div>
                                                        <div class="listing-day">
                                                            <div class="day">Saturday</div>
                                                            <div class="time-items">
                                                                <span class="time">07:00 AM - 09:00 PM</span>
                                                            </div>
                                                        </div>
                                                        <div class="listing-day closed">
                                                            <div class="day">Sunday</div>
                                                            <div class="time-items">
                                                                <span class="time"><span class="badge bg-danger-light">Closed</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Business Hours Widget -->
                                        </div>
                                    </div>
                                </div>
                                <!-- /Business Hours Content -->
                            </div>
                        </div>
                    </div>
                    <!-- /Doctor Details Tab -->
                </div>
            </div>
            <!-- /Page Content -->
            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include page="../Common/footer.jsp"/>
            <!-- /Footer -->
        </div>
        <!-- /Main Wrapper -->

        <!-- Script -->
        <jsp:include page="../Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
