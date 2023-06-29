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
                                            <img src="assets/img/logo.png" alt="User Image" />
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>Staff 1</h3>

                                            <div class="patient-details">
                                                <h5 class="mb-0">BirdLover Clinic</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dashboard-widget">
                                    <nav class="dashboard-menu">
                                        <ul>
                                            <li class="active">
                                                <a href="doctor-dashboard.html">
                                                    <i class="fas fa-columns"></i>
                                                    <span>Dashboard</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="doctor-profile-settings.html">
                                                    <i class="fas fa-user-cog"></i>
                                                    <span>Profile Settings</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="doctor-change-password.html">
                                                    <i class="fas fa-lock"></i>
                                                    <span>Change Password</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="index.html">
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
                                                <a class="nav-link" href="#today-appointments" data-toggle="tab">Today</a>
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
                                                                        <th>Appt Date</th>
                                                                        <th>Bird Name</th>                                                                  
                                                                        <th class="text-center">Doctor</th>
                                                                        <th>Status</th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <h2 class="table-avatar">
                                                                                <a href="patient-profile.html" class="avatar avatar-sm mr-2"
                                                                                   ><img class="avatar-img rounded-circle" src="assets/img/patients/patient.jpg" alt="User Image"
                                                                                      /></a>
                                                                                <a href="patient-profile.html">${customer.lastName}${customer.lastName}</a>
                                                                            </h2>
                                                                        </td>
                                                                        <td>${appointment.date} <span class="d-block text-info">${appointment.time}</span></td>
                                                                        <td>
                                                                            <h2 class="table-avatar">
                                                                                <a href="patient-profile.html" class="avatar avatar-sm mr-2"
                                                                                   ><img class="avatar-img rounded-circle" src="assets/img/bird/bird-2.webp" alt="User Image"
                                                                                      /></a>
                                                                                <a href="patient-profile.html">${bird.birdName}<span>${bird.birdBreed}</span></a>
                                                                            </h2>
                                                                        </td>

                                                                        <td class="text-center">
                                                                            <div class="d-flex justify-content-center">
                                                                                <select class="form-control select w-75">
                                                                                    <option>${doctor.name}</option>  <!-- liệt kê mấy thằng bác sĩ có chuyên ngành trùng với service và có slot trùng với lịch -->
                                                                                </select>
                                                                            </div>
                                                                        </td>

                                                                        <td><span class="badge badge-pill bg-warning-light">${appointment.status}</span></td>
                                                                        <td class="text-right">
                                                                            <div class="table-action">
                                                                                <a href="client-appoitments-details-not-yet-for-staff.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                                <a href="javascript:void(0);" class="btn btn-sm bg-success-light"> <i class="fas fa-check"></i> Confirm </a>
                                                                                <a href="javascript:void(0);" class="btn btn-sm bg-danger-light"> <i class="fas fa-times"></i> Cancel </a>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
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
                                                                        <th>Appt Date</th>
                                                                        <th>Bird Name</th>                                                                  
                                                                        <th class="text-center">Doctor</th>
                                                                        <th>Status</th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <h2 class="table-avatar">
                                                                                <a href="patient-profile.html" class="avatar avatar-sm mr-2"
                                                                                   ><img class="avatar-img rounded-circle" src="assets/img/patients/patient.jpg" alt="User Image"
                                                                                      /></a>
                                                                                <a href="patient-profile.html">${customer.lastName}${customer.lastName}</a>
                                                                            </h2>
                                                                        </td>
                                                                        <td>${appointment.date} <span class="d-block text-info">${appointment.time}</span></td>
                                                                        <td>
                                                                            <h2 class="table-avatar">
                                                                                <a href="patient-profile.html" class="avatar avatar-sm mr-2"
                                                                                   ><img class="avatar-img rounded-circle" src="assets/img/bird/bird-2.webp" alt="User Image"
                                                                                      /></a>
                                                                                <a href="patient-profile.html">${bird.birdName}<span>${bird.birdBreed}</span></a>
                                                                            </h2>
                                                                        </td>

                                                                        <td class="text-center">
                                                                            <div class="d-flex justify-content-center">
                                                                                <select class="form-control select w-75">
                                                                                    <option>${doctor.name}</option>  <!-- liệt kê mấy thằng bác sĩ có chuyên ngành trùng với service và có slot trùng với lịch -->
                                                                                </select>
                                                                            </div>
                                                                        </td>

                                                                        <td><span class="badge badge-pill bg-warning-light">${appointment.status}</span></td>
                                                                        <td class="text-right">
                                                                            <div class="table-action">
                                                                                <a href="client-appoitments-details-not-yet-for-staff.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                                <a href="javascript:void(0);" class="btn btn-sm bg-success-light"> <i class="fas fa-check"></i> Confirm </a>
                                                                                <a href="javascript:void(0);" class="btn btn-sm bg-danger-light"> <i class="fas fa-times"></i> Cancel </a>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Today Appointment Tab -->
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
            <jsp:include page="Common/footer.jsp"/>
            <!-- /Footer -->
        </div>
        <!-- /Main Wrapper -->

        <!-- Script -->
        <jsp:include page="Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>