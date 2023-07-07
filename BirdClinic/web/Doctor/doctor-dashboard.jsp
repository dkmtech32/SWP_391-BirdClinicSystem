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
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
                            <!-- Profile Sidebar -->
                            <div class="profile-sidebar">
                                <div class="widget-profile pro-widget-content">
                                    <div class="profile-info-widget">
                                        <a href="#" class="booking-doc-img">
                                            <img src="assets/img/doctors/doctor-thumb-02.jpg" alt="User Image" />
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>${doctor.fullName}</h3>

                                            <div class="patient-details">
                                                <h5 class="mb-0">${doctor.userRole}</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dashboard-widget">
                                    <nav class="dashboard-menu">
                                        <ul>
                                            <li class="active">
                                                <a href="doctor-dashboard.jsp">
                                                    <i class="fas fa-columns"></i>
                                                    <span>Dashboard</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="appointments.jsp">
                                                    <i class="fas fa-calendar-check"></i>
                                                    <span>Appointments</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="my-patients.jsp">
                                                    <i class="fas fa-user-injured"></i>
                                                    <span>My Patients</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="doctor-change-password.jsp">
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
                            <!-- /Profile Sidebar -->
                        </div>

                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card dash-card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-12 col-lg-4">
                                                    <div class="dash-widget dct-border-rht">
                                                        <div class="circle-bar circle-bar1">
                                                            <div class="circle-graph1" data-percent="75">
                                                                <img src="assets/img/icon-01.png" class="img-fluid" alt="patient" />
                                                            </div>
                                                        </div>
                                                        <div class="dash-widget-info">
                                                            <h6>Total Patient</h6>
                                                            <h3>1500</h3>
                                                            <p class="text-muted">Till Today</p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 col-lg-4">
                                                    <div class="dash-widget dct-border-rht">
                                                        <div class="circle-bar circle-bar2">
                                                            <div class="circle-graph2" data-percent="65">
                                                                <img src="assets/img/icon-02.png" class="img-fluid" alt="Patient" />
                                                            </div>
                                                        </div>
                                                        <div class="dash-widget-info">
                                                            <h6>Today Patient</h6>
                                                            <h3>160</h3>
                                                            <p class="text-muted">06, Nov 2019</p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 col-lg-4">
                                                    <div class="dash-widget">
                                                        <div class="circle-bar circle-bar3">
                                                            <div class="circle-graph3" data-percent="50">
                                                                <img src="assets/img/icon-03.png" class="img-fluid" alt="Patient" />
                                                            </div>
                                                        </div>
                                                        <div class="dash-widget-info">
                                                            <h6>Appointments</h6>
                                                            <h3>85</h3>
                                                            <p class="text-muted">06, Apr 2019</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <h4 class="mb-4">Patient Appointment</h4>
                                    <div class="appointment-tab">
                                        <!-- Appointment Tab -->
                                        <ul class="nav nav-tabs nav-tabs-solid nav-tabs-rounded">
                                            <li class="nav-item">
                                                <a class="nav-link active" href="#upcoming-appointments" data-toggle="tab">Upcoming</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#today-appointments" data-toggle="tab">Checked In</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#done-appointments" data-toggle="tab">Done</a>
                                            </li>
                                        </ul>
                                        <!-- /Appointment Tab -->

                                        <div class="tab-content">
                                            <!-- Upcoming Appointment Tab -->
                                            <div class="tab-pane show active" id="upcoming-appointments">
                                                <div class="card card-table mb-0">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="table table-hover table-center mb-0">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Customer Name</th>
                                                                        <th>Appointment Date</th>
                                                                        <th>Bird Name</th>
                                                                        <th>Bird Breed</th>
                                                                        <th class="text-center">Service</th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach>
                                                                        <tr>
                                                                            <td>
                                                                                <h2 class="table-avatar">
                                                                                    <a href="patient-profile.jsp" class="avatar avatar-sm mr-2"
                                                                                       ><img class="avatar-img rounded-circle" src="assets/img/patients/patient.jpg" alt="User Image"
                                                                                          /></a>
                                                                                    <a href="patient-profile.jsp">${customer.name}</a>
                                                                                </h2>
                                                                            </td>
                                                                            <td>${appoitment.appTime}<span class="d-block text-info">${appoitment.timeslot}</span></td>
                                                                            <td>
                                                                                <h2 class="table-avatar">
                                                                                    <a href="../Common/bird-details.jsp" class="avatar avatar-sm mr-2"
                                                                                       ><img class="avatar-img rounded-circle" src="assets/img/bird/bird-2.webp" alt="User Image"
                                                                                          /></a>
                                                                                    <a href="../Common/bird-details.jsp">${bird.birdFullname}</a>
                                                                                </h2>
                                                                            </td>
                                                                            <td>${bird.breed}</td>
                                                                            <td>${appointment.service_}</td>
                                                                            <td class="text-right">
                                                                                <div class="table-action">
                                                                                    <a href="../Common/client-appointments-details.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Upcoming Appointment Tab -->

                                            <!-- Today Appointment Tab -->
                                            <div class="tab-pane" id="today-appointments">
                                                <div class="card card-table mb-0">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="table table-hover table-center mb-0">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Customer Name</th>
                                                                        <th>Appointment Date</th>
                                                                        <th>Bird Name</th>
                                                                        <th>Bird Breed</th>
                                                                        <th class="text-center">Service</th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach>
                                                                        <tr>
                                                                            <td>
                                                                                <h2 class="table-avatar">
                                                                                    <a href="patient-profile.jsp" class="avatar avatar-sm mr-2"
                                                                                       ><img class="avatar-img rounded-circle" src="assets/img/patients/patient.jpg" alt="User Image"
                                                                                          /></a>
                                                                                    <a href="patient-profile.jsp">${customer.name}</a>
                                                                                </h2>
                                                                            </td>
                                                                            <td>${appoitment.appTime}<span class="d-block text-info">${appoitment.timeslot}</span></td>
                                                                            <td>
                                                                                <h2 class="table-avatar">
                                                                                    <a href="../Common/bird-details.jsp" class="avatar avatar-sm mr-2"
                                                                                       ><img class="avatar-img rounded-circle" src="assets/img/bird/bird-2.webp" alt="User Image"
                                                                                          /></a>
                                                                                    <a href="../Common/bird-details.jsp">${bird.birdFullname}</a>
                                                                                </h2>
                                                                            </td>
                                                                            <td>${bird.breed}</td>
                                                                            <td>${appointment.service_}</td>
                                                                            <td class="text-right">
                                                                                <div class="table-action">
                                                                                    <a href="client-appointments-details-for-doctor-today.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                                    <a href="add-prescription.jsp" class="btn btn-sm bg-info-light"> <i class="fa fa-flask"></i> Prescribe </a>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Today Appointment Tab -->
                                            
                                            <!-- Done Appointment Tab -->
                                            <div class="tab-pane" id="done-appointments">
                                                <div class="card card-table mb-0">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="table table-hover table-center mb-0">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Customer Name</th>
                                                                        <th>Appointment Date</th>
                                                                        <th>Bird Name</th>
                                                                        <th>Bird Breed</th>
                                                                        <th class="text-center">Service</th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach>
                                                                        <tr>
                                                                            <td>
                                                                                <h2 class="table-avatar">
                                                                                    <a href="patient-profile.jsp" class="avatar avatar-sm mr-2"
                                                                                       ><img class="avatar-img rounded-circle" src="assets/img/patients/patient.jpg" alt="User Image"
                                                                                          /></a>
                                                                                    <a href="patient-profile.jsp">${customer.name}</a>
                                                                                </h2>
                                                                            </td>
                                                                            <td>${appoitment.appTime}<span class="d-block text-info">${appoitment.timeslot}</span></td>
                                                                            <td>
                                                                                <h2 class="table-avatar">
                                                                                    <a href="../Common/bird-details.jsp" class="avatar avatar-sm mr-2"
                                                                                       ><img class="avatar-img rounded-circle" src="assets/img/bird/bird-2.webp" alt="User Image"
                                                                                          /></a>
                                                                                    <a href="../Common/bird-details.jsp">${bird.birdFullname}</a>
                                                                                </h2>
                                                                            </td>
                                                                            <td>${bird.breed}</td>
                                                                            <td>${appointment.service_}</td>
                                                                            <td class="text-right">
                                                                                <div class="table-action">
                                                                                    <a href="../Common/client-appointments-details.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Done Appointment Tab -->
                                        </div>
                                    </div>
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
