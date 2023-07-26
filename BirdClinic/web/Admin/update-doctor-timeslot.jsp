<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />

<!DOCTYPE html>
<html>
    <jsp:include page="../Admin/head-admin.jsp"/>
    <body>
        <jsp:include page="../Admin/loader.jsp"/>

        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="../Admin/sidebar.jsp"/>

            <!-- sidebar-wrapper  -->

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <jsp:include page="../Admin/admin-dropdown-menu.jsp"/>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Doctor Profile & Settings</h5>
                        </div>

                        <div class="card bg-white rounded shadow overflow-hidden mt-4 border-0">
                            <div class="p-5 bg-primary bg-gradient"></div>
                            <div class="avatar-profile d-flex margin-nagative mt-n5 position-relative ps-3">
                                <img src="<c:url value="/images/doctors/${doctor.image.imageURLName}"/>" class="rounded-circle shadow-md avatar avatar-medium" alt />
                                <div class="mt-4 ms-3 pt-3">
                                    <h5 class="mt-3 mb-1">${doctor.fullName}</h5> 
                                    <p class="text-muted mb-0">Doctor</p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 mt-4">
                                    <div class="card border-0 rounded-0 p-4">
                                        <ul
                                            class="nav nav-pills nav-justified flex-column flex-sm-row rounded shadow overflow-hidden bg-light"
                                            id="pills-tab"
                                            role="tablist"
                                            >
                                            <li class="nav-item">
                                                <a class="nav-link rounded-0"href="<c:url value="/View/Doctor?userID=${doctor.userID}"/>">
                                                    <div class="text-center pt-1 pb-1">
                                                        <h4 class="title fw-normal mb-0">Profile</h4>
                                                    </div> 
                                                </a><!--end nav link-->
                                            </li>

                                            <li class="nav-item">
                                                <a class="nav-link rounded-0 active" href="<c:url value="/Admin/Doctors/Update/Timeslot?userID=${doctor.userID}" />">
                                                    <div class="text-center pt-1 pb-1">
                                                        <h4 class="title fw-normal mb-0">Time Table</h4>
                                                    </div> 
                                                </a><!--end nav link-->
                                            </li>
                                        </ul>


                                        <div class="tab-content mt-2" id="pills-tabContent">											
                                            <div class="tab-pane fade show active" id="pills-timetable" aria-labelledby="timetable-tab">
                                                <div class="card booking-schedule schedule-widget" style="width: 82rem">
                                                    <!-- Schedule Header -->
                                                    <div class="schedule-header">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <!-- Day Slot -->
                                                                <div class="day-slot">
                                                                    <ul>
                                                                        <c:forEach var="day" varStatus="index" items="${weekdays}">
                                                                            <li>
                                                                                <span>${day}</span>
                                                                            </li>
                                                                        </c:forEach>
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
                                                                        <c:forEach var="timeslotMap" items="${timeslotList}" varStatus="count">
                                                                            <li>
                                                                                <c:forEach var="entry" items="${timeslotMap}">
                                                                                    <a class="timing">
                                                                                        <span>${entry.timeSlot}</span>
                                                                                    </a>
                                                                                </c:forEach>
                                                                            </li>
                                                                        </c:forEach>
                                                                    </ul>
                                                                </div>
                                                                <!-- /Time Slot -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /Schedule Content -->
                                                </div>
                                                <div class="col-sm-12" style="margin-top: 1rem;">
                                                    <input type="submit" class="rounded btn btn-primary" value="Save" />
                                                </div>
                                                <!--end row-->
                                            </div>
                                            <!--end teb pane-->


                                            <!--end teb pane-->
                                        </div>
                                        <!--end tab content-->
                                    </div>
                                </div>
                                <!--end col-->
                            </div>
                            <!--end row-->
                        </div>
                    </div>
                </div>
                <!--end container-->

                <!-- Footer Start -->
                <footer class="bg-white shadow py-3">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="text-sm-start text-center">
                                    <p class="mb-0 text-muted">
                                        <script>
                                            document.write(new Date().getFullYear());
                                        </script>
                                        © BirdLover
                                    </p>
                                </div>
                            </div>
                            <!--end col-->
                        </div>
                        <!--end row-->
                    </div>
                    <!--end container-->
                </footer>
                <!--end footer-->
                <!-- End -->
            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->
        <script>
            var timingElements = document.getElementsByClassName("timing");
            for (var i = 0; i < timingElements.length; i++) {
                timingElements[i].addEventListener("click", function () {
                    this.classList.toggle("selected");
                });
            }
        </script>
        <!-- Script -->
        <jsp:include page="../Admin/script-admin.jsp"/>
        <!-- /Script -->
    </body>
</html>
