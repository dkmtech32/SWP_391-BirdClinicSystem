<%-- 
    Document   : booking-all
    Created on : Jun 20, 2023, 10:52:04 PM
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
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="booking-doc-info">
                                        <a href="doctor-profile.jsp" class="booking-doc-img">
                                            <img src="assets/img/logo2.png" alt="User Image" />
                                        </a>
                                        <div class="booking-info">
                                            <h4><a href="doctor-profile.jsp">All doctor</a></h4>
                                            <!-- <div class="rating">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star"></i>
                                                    <span class="d-inline-block average-rating">35</span>
                                            </div> -->
                                            <p class="text-muted mb-0"><i class="fas fa-map-marker-alt"></i> Dong Da district, Hanoi city</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Schedule Widget -->
                            <div class="card booking-schedule schedule-widget">
                                <!-- Schedule Header -->
                                <div class="schedule-header">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <!-- Day Slot -->
                                            <div class="day-slot">
                                                <ul>
                                                    <li class="left-arrow">
                                                        <a href="#">
                                                            <i class="fa fa-chevron-left"></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <span>Mon</span>
                                                        <span class="slot-date">11 Jun <small class="slot-year">2023</small></span>
                                                    </li>
                                                    <li>
                                                        <span>Tue</span>
                                                        <span class="slot-date">12 Jun <small class="slot-year">2023</small></span>
                                                    </li>
                                                    <li>
                                                        <span>Wed</span>
                                                        <span class="slot-date">13 Jun <small class="slot-year">2023</small></span>
                                                    </li>
                                                    <li>
                                                        <span>Thu</span>
                                                        <span class="slot-date">14 Jun <small class="slot-year">2023</small></span>
                                                    </li>
                                                    <li>
                                                        <span>Fri</span>
                                                        <span class="slot-date">15 Jun <small class="slot-year">2023</small></span>
                                                    </li>
                                                    <li>
                                                        <span>Sat</span>
                                                        <span class="slot-date">16 Jun <small class="slot-year">2023</small></span>
                                                    </li>
                                                    <li>
                                                        <span>Sun</span>
                                                        <span class="slot-date">17 Jun <small class="slot-year">2023</small></span>
                                                    </li>
                                                    <li class="right-arrow">
                                                        <a href="#">
                                                            <i class="fa fa-chevron-right"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- /Day Slot -->
                                        </div>
                                    </div>
                                </div>
                                <!-- /Schedule Header -->

                                <!-- Schedule Content -->
                                <div class="schedule-cont">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <!-- Time Slot -->
                                            <div class="time-slot">
                                                <ul class="clearfix">
                                                    <li>
                                                        <a class="timing" href="#"> <span>9:00</span> <span>AM</span> </a>
                                                        <a class="timing" href="#"> <span>10:00</span> <span>AM</span> </a>
                                                    </li>
                                                    <li>
                                                        <a class="timing" href="#"> <span>9:00</span> <span>AM</span> </a>
                                                        <a class="timing" href="#"> <span>10:00</span> <span>AM</span> </a>
                                                        <a class="timing" href="#"> <span>11:00</span> <span>AM</span> </a>
                                                    </li>
                                                    <li>
                                                        <a class="timing" href="#"> <span>9:00</span> <span>AM</span> </a>
                                                        <a class="timing" href="#"> <span>10:00</span> <span>AM</span> </a>
                                                        <a class="timing" href="#"> <span>11:00</span> <span>AM</span> </a>
                                                    </li>
                                                    <li>
                                                        <a class="timing" href="#"> <span>9:00</span> <span>AM</span> </a>
                                                        <a class="timing" href="#"> <span>10:00</span> <span>AM</span> </a>
                                                        <a class="timing" href="#"> <span>11:00</span> <span>AM</span> </a>
                                                    </li>
                                                    <li>
                                                        <a class="timing" href="#"> <span>9:00</span> <span>AM</span> </a>
                                                        <a class="timing selected" href="#"> <span>10:00</span> <span>AM</span> </a>
                                                        <a class="timing" href="#"> <span>11:00</span> <span>AM</span> </a>
                                                    </li>
                                                    <li>
                                                        <a class="timing" href="#"> <span>9:00</span> <span>AM</span> </a>
                                                        <a class="timing" href="#"> <span>10:00</span> <span>AM</span> </a>
                                                        <a class="timing" href="#"> <span>11:00</span> <span>AM</span> </a>
                                                    </li>
                                                    <li>
                                                        <a class="timing" href="#"> <span>9:00</span> <span>AM</span> </a>
                                                        <a class="timing" href="#"> <span>10:00</span> <span>AM</span> </a>
                                                        <a class="timing" href="#"> <span>11:00</span> <span>AM</span> </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- /Time Slot -->
                                        </div>
                                    </div>
                                </div>
                                <!-- /Schedule Content -->
                            </div>
                            <!-- /Schedule Widget -->

                            <!-- Submit Section -->
                            <div class="submit-section proceed-btn text-right">
                                <a href="bookInfo-all.jsp" class="btn btn-primary submit-btn">Next</a>
                            </div>
                            <!-- /Submit Section -->
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
