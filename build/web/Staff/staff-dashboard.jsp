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
                                                <a href="staff-dashboard.jsp">
                                                    <i class="fas fa-columns"></i>
                                                    <span>Dashboard</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="staff-profile-settings.jsp">
                                                    <i class="fas fa-user-cog"></i>
                                                    <span>Profile Settings</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="staff-change-password.jsp">
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
                                                            <h6>Appoinments</h6>
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
                                                <a class="nav-link active" href="#requesting-appointments" data-toggle="tab">Requests</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#upcoming-today-appointments" data-toggle="tab">Upcoming Today</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#checking-out-today-appointments" data-toggle="tab">Check Out</a>
                                            </li>
                                        </ul>
                                        <!-- /Appointment Tab -->

                                        <div class="tab-content">
                                            <!-- Requests -->
                                            <div class="tab-pane show active" id="requesting-appointments">
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
                                                                        <th>Status</th>
                                                                        <th class="text-center">Doctor</th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <c:forEach>
                                                                            <td>
                                                                                <h2 class="table-avatar">
                                                                                    <a href="bird-details.jsp" class="avatar avatar-sm mr-2"
                                                                                       ><img class="avatar-img rounded-circle" src="assets/img/patients/patient.jpg" alt="User Image"
                                                                                          /></a>
                                                                                    <a href="bird-details.jsp">${customer.name}</a>
                                                                                </h2>
                                                                            </td>
                                                                            <td>${appoitment.appTime}<span class="d-block text-info">${appoitment.timeslot}</span></td>
                                                                            <td>
                                                                                <h2 class="table-avatar">
                                                                                    <a href="bird-details.jsp" class="avatar avatar-sm mr-2"
                                                                                       ><img class="avatar-img rounded-circle" src="assets/img/bird/bird-2.webp" alt="User Image"
                                                                                          /></a>
                                                                                    <a href="bird-details.jsp">${bird.birdFullname}</a>
                                                                                </h2>
                                                                            </td>
                                                                            <td>${bird.breed}</td>
                                                                            <td><span class="badge badge-pill bg-warning-light">Processing</span></td> <!-- này để code cứng vì requests thì status auto là processsing -->
                                                                            <td class="text-center">
                                                                                <div class="d-flex justify-content-center">
                                                                                    <select class="form-control select w-75">
                                                                                        <c:forEach>
                                                                                            <option>${appointment.doctor}</option> <!-- này liệt kê tên mấy ông bác sĩ có chuyên môn khớp với service-->
                                                                                        </c:forEach>
                                                                                    </select>
                                                                                </div>
                                                                            </td>
                                                                            <td class="text-right">
                                                                                <div class="table-action">
                                                                                    <a href="client-appointments-details-not-yet-for-staff.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                                    <a href="" class="btn btn-sm bg-success-light"> <i class="fas fa-check"></i> Confirm </a> <!-- nhấn xong chuyển status từ Processing qua Confirmed -->
                                                                                    <a href="" class="btn btn-sm bg-danger-light"> <i class="fas fa-times"></i> Cancel </a>
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
                                            <!-- /Request -->

                                            <!-- Today Appointment Tab -->
                                            <!-- này là lịch hẹn của hôm nay, cái nào tới ngày mới hiện lên -->
                                            <div class="tab-pane" id="upcoming-today-appointments">
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
                                                                        <th>Status</th>
                                                                        <th class="text-center">Doctor</th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="bird-details.jsp" class="avatar avatar-sm mr-2"
                                                                               ><img class="avatar-img rounded-circle" src="assets/img/patients/patient.jpg" alt="User Image"
                                                                                  /></a>
                                                                            <a href="bird-details.jsp">${customer.name}</a>
                                                                        </h2>
                                                                    </td>
                                                                    <td>${appoitment.appTime}<span class="d-block text-info">${appoitment.timeslot}</span></td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="bird-details.jsp" class="avatar avatar-sm mr-2"
                                                                               ><img class="avatar-img rounded-circle" src="assets/img/bird/bird-2.webp" alt="User Image"
                                                                                  /></a>
                                                                            <a href="bird-details.jsp">${bird.birdFullname}</a>
                                                                        </h2>
                                                                    </td>
                                                                    <td>${bird.breed}</td>
                                                                    <td><span class="badge badge-pill bg-success-light">Confirmed</span></td> <!-- này để code cứng vì upcoming today thì status auto là confirm -->
                                                                    <td class="text-center">
                                                                        <div class="d-flex justify-content-center">
                                                                            <select class="form-control select w-75">
                                                                                <c:forEach>
                                                                                    <option>${appointment.doctor}</option> <!-- này liệt kê tên mấy ông bác sĩ có chuyên môn khớp với service-->
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="client-appointments-details-not-yet-for-staff.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                            <a href="" class="btn btn-sm bg-success-light"> <i class="fas fa-check"></i> Confirm </a> <!-- nhấn xong chuyển status từ confirmed qua check in -->
                                                                            <a href="" class="btn btn-sm bg-danger-light"> <i class="fas fa-times"></i> Cancel </a>
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
                                            <div class="tab-pane" id="checking-out-today-appointments">
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
                                                                        <th>Status</th>
                                                                        <th>Doctor</th>
                                                                        <th>Payment Method</th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach>
                                                                        <tr>
                                                                            <td>
                                                                                <h2 class="table-avatar">
                                                                                    <a href="bird-details.jsp" class="avatar avatar-sm mr-2"
                                                                                       ><img class="avatar-img rounded-circle" src="assets/img/patients/patient.jpg" alt="User Image"
                                                                                          /></a>
                                                                                    <a href="bird-details.jsp">${customer.name}</a>
                                                                                </h2>
                                                                            </td>
                                                                            <td>${appoitment.appTime}<span class="d-block text-info">${appoitment.timeslot}</span></td>
                                                                            <td>
                                                                                <h2 class="table-avatar">
                                                                                    <a href="bird-details.jsp" class="avatar avatar-sm mr-2"
                                                                                       ><img class="avatar-img rounded-circle" src="assets/img/bird/bird-2.webp" alt="User Image"
                                                                                          /></a>
                                                                                    <a href="bird-details.jsp">${bird.birdFullname}</a>
                                                                                </h2>
                                                                            </td>
                                                                            <td>${bird.breed}</td>
                                                                            <td><span class="badge badge-pill bg-success-light">Check In</span></td> <!-- này để code cứng vì chỗ này thì status auto là check in -->
                                                                            <td>${appointment.doctor}</td>
                                                                            <td>
                                                                                <select class="form-control select w-75" required>
                                                                                    <c:forEach>
                                                                                        <option>${appoitment.payment}</option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </td>
                                                                            <td class="text-right">
                                                                                <div class="table-action">
                                                                                    <a href="client-appointments-details-for-staff.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                                    <a href="" class="btn btn-sm bg-success-light"> <i class="fas fa-check"></i> Confirm </a> <!-- nhấn xong chuyển status từ check in qua completed -->
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
