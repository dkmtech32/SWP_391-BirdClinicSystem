<%-- 
    Document   : bookInfo-all
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

            <!-- Breadcrumb -->
            <jsp:include page="../Common/breadcrumb.jsp"/>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <!-- Profile Sidebar -->
                        <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
                            <div class="profile-sidebar">
                                <div class="widget-profile pro-widget-content">
                                    <div class="profile-info-widget">
                                        <a href="#" class="booking-doc-img">
                                            <img src="../assets/img/patients/patient.jpg" alt="User Image" />
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>Nguyen Van G</h3>
                                            <div class="patient-details">
                                                <h5><i class="fas fa-birthday-cake"></i> 24 Jul 1983, 38 years</h5>
                                                <h5 class="mb-0"><i class="fas fa-map-marker-alt"></i> Thanh Xuan, Hanoi</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dashboard-widget">
                                    <nav class="dashboard-menu">
                                        <ul>
                                            <li class="active">
                                                <a href="patient-dashboard.jsp">
                                                    <i class="fas fa-columns"></i>
                                                    <span>Dashboard</span>
                                                </a>
                                            </li>
                                            <li class="active">
                                                <a href="birdlist.jsp">
                                                    <i class="fa fa-tasks"></i>
                                                    <span>Birds List</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="profile-settings.jsp">
                                                    <i class="fas fa-user-cog"></i>
                                                    <span>Profile Settings</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="change-password.jsp">
                                                    <i class="fas fa-lock"></i>
                                                    <span>Change Password</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="index.jsp">
                                                    <i class="fas fa-sign-out-alt"></i>
                                                    <span>Logout</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <!-- / Profile Sidebar -->

                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="card">
                                <div class="card-body pt-0">
                                    <!-- Tab Menu -->
                                    <nav class="user-tabs mb-4">
                                        <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                            <li class="nav-item">
                                                <a class="nav-link active" href="#pat_appointments" data-toggle="tab">Appointments</a>
                                            </li>
                                        </ul>
                                    </nav>
                                    <!-- /Tab Menu -->

                                    <!-- Tab Content -->
                                    <div class="tab-content pt-0">
                                        <!-- Appointment Tab -->
                                        <div id="pat_appointments" class="tab-pane fade show active">
                                            <div class="card card-table mb-0">
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-center mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th>Doctor</th>
                                                                    <th>Appointment Date</th>
                                                                    <th>Bird</th>
                                                                    <th>Bird Breed</th>
                                                                    <th>Service</th>
                                                                    <th>Status</th>
                                                                    <th></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach>
                                                                    <tr>
                                                                        <td>
                                                                            <h2 class="table-avatar">
                                                                                <a href="doctor-profile.jsp" class="avatar avatar-sm mr-2">
                                                                                    <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-07.jpg" alt="User Image" />
                                                                                </a>
                                                                                <a href="doctor-profile.jsp">${appoitment.doctor}<span>${doctor.userRole}</span></a> <!-- userRole này ý ông là chuyên ngành của bác sĩ? -->
                                                                            </h2>
                                                                        </td>
                                                                        <td>${appoitment.appTime}<span class="d-block text-info">${appoitment.timeslot}</span></td>
                                                                        <td>
                                                                            <h2 class="table-avatar">
                                                                                <a href="patient-profile.jsp" class="avatar avatar-sm mr-2"
                                                                                   ><img class="avatar-img rounded-circle" src="assets/img/bird/bird-3.jpg" alt="User Image"
                                                                                      /></a>
                                                                                <a href="patient-profile.jsp">${bird.birdFullname}</a>
                                                                            </h2>
                                                                        </td>
                                                                        <td>${bird.breed}</td>
                                                                        <td>${appointment.service_}</td>
                                                                        <c:choose>
                                                                            <c:when test="${appointment.appStatus =='processing'}">
                                                                                <td><span class="badge badge-pill bg-warning-light">Processing</span></td>
                                                                            </c:when>
                                                                            <c:when test="${appointment.appStatus =='confirmed'}">
                                                                                <td><span class="badge badge-pill bg-success-light">Confirmed</span></td>
                                                                            </c:when>
                                                                            <c:when test="${appointment.appStatus =='checkin'}">
                                                                                <td><span class="badge badge-pill bg-purple-light">Check In</span></td>
                                                                            </c:when>
                                                                            <c:when test="${appointment.appStatus =='complete'}">
                                                                                <td><span class="badge badge-pill bg-primary-light">Completed</span></td>
                                                                            </c:when>
                                                                            <c:when test="${appointment.appStatus =='cancel'}">
                                                                                <td><span class="badge badge-pill bg-danger-light">Canceled</span></td>
                                                                            </c:when>
                                                                        </c:choose>
                                                                        <c:choose>
                                                                            <c:when test="${appointment.appStatus =='processing'}">
                                                                                <td class="text-right">
                                                                                    <div class="table-action">
                                                                                        <a href="" class="btn btn-sm bg-danger-light"> <i class="fa fa-times"></i> Cancel </a>
                                                                                        <!--                                                                                    <a href="javascript:void(0);" class="btn btn-sm bg-primary-light"> <i class="fas fa-print"></i> Print </a>-->
                                                                                        <a href="../Common/client-appointments-details.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                                    </div>
                                                                                </td>
                                                                            </c:when>
                                                                            <c:when test="${appointment.appStatus =='confirmed'}">
                                                                                <td class="text-right">
                                                                                    <div class="table-action">
                                                                                        <!-- <a href="javascript:void(0);" class="btn btn-sm bg-primary-light"> <i class="fas fa-print"></i> Print </a>-->
                                                                                        <a href="../Common/client-appointments-details.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                                    </div>
                                                                                </td>
                                                                            </c:when>
                                                                            <c:when test="${appointment.appStatus =='check in'}">
                                                                                <td class="text-right">
                                                                                    <div class="table-action">
                                                                                        <!-- <a href="javascript:void(0);" class="btn btn-sm bg-primary-light"> <i class="fas fa-print"></i> Print </a>-->
                                                                                        <a href="../Common/client-appointments-details.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                                    </div>
                                                                                </td>
                                                                            </c:when>
                                                                            <c:when test="${appointment.appStatus =='complete'}">
                                                                                <td class="text-right">
                                                                                    <div class="table-action">
                                                                                        <a href="view-prescription.jsp" class="btn btn-sm bg-info-light"> <i class="fa fa-flask"></i> Prescription </a>
                                                                                    <!--<a href="javascript:void(0);" class="btn btn-sm bg-primary-light"> <i class="fas fa-print"></i> Print </a>-->
                                                                                        <a href="../Common/client-appointments-details.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                                    </div>
                                                                                </td>
                                                                            </c:when>
                                                                            <c:when test="${appointment.appStatus =='cancel'}">
                                                                                <td class="text-right">
                                                                                    <div class="table-action">
                                                                                        <!-- <a href="javascript:void(0);" class="btn btn-sm bg-primary-light"> <i class="fas fa-print"></i> Print </a>-->
                                                                                        <a href="client-appointments-details-feedback.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                                    </div>
                                                                                </td>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Appointment Tab -->

                                    </div>
                                    <!-- Tab Content -->
                                </div>
                            </div>
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
        <!-- /Script -->
    </body>
</html>
