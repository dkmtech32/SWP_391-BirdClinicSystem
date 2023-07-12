<%-- 
    Document   : admin-home-page-accounts
    Created on : Jul 11, 2023, 10:16:16 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../Common/head-admin.jsp"/>
    <body>
        <!-- Main Wrapper -->

        <jsp:include page="../Admin/loader.jsp"/>

        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="../Admin/sidebar.jsp"/>
            <!-- sidebar-wrapper  -->

            <!-- Start Page Content -->
            <!--            <div class="search-bar p-0 d-none d-lg-block ms-2">
                            <div id="search" class="menu-search mb-0">
                                <form role="search" method="get" id="searchform" class="searchform">
                                    <div>
                                        <input type="text" class="form-control border rounded-pill" name="s" id="s" placeholder="Search Keywords..." />
                                        <input type="submit" id="searchsubmit" value="Search" />
                                    </div>
                                </form>
                            </div>
                        </div>-->
            <main class="page-content bg-light">
                <div class="top-header">
                    <div class="header-bar d-flex justify-content-between border-bottom">
                        <div class="d-flex align-items-center">
                            <a href="#" class="logo-icon">
                                <img src="../assets/images/logo-icon.png" height="30" class="small" alt />
                                <span class="big">
                                    <img src="../assets/images/logo-dark.png" height="24" class="logo-light-mode" alt />
                                    <img src="../assets/images/logo-light.png" height="24" class="logo-dark-mode" alt />
                                </span>
                            </a>
                        </div>

                        <ul class="list-unstyled mb-0">
                            <li class="list-inline-item mb-0 ms-1">
                                <div class="dropdown dropdown-primary">
                                    <button
                                        type="button"
                                        class="btn btn-pills btn-soft-primary dropdown-toggle p-0"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <img src="../assets/images/doctors/01.jpg" class="avatar avatar-ex-small rounded-circle" alt />
                                    </button>
                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px">
                                        <a class="dropdown-item d-flex align-items-center text-dark" href="https://shreethemes.in/doctris/layouts/admin/profile.html">
                                            <img src="../assets/images/doctors/01.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt />
                                            <div class="flex-1 ms-2">
                                                <span class="d-block mb-1">Calvin Carlo</span>
                                                <small class="text-muted">Orthopedic</small>
                                            </div>
                                        </a>
                                        <a class="dropdown-item text-dark" href="admin-home-page-charts.jsp"
                                           ><span class="mb-0 d-inline-block me-1"><i class="uil uil-dashboard align-middle h6"></i></span> Dashboard</a
                                        >
                                        <a class="dropdown-item text-dark" href="admin-profile.jsp"
                                           ><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a
                                        >
                                        <div class="dropdown-divider border-top"></div>
                                        <a class="dropdown-item text-dark" href="../Common/index.jsp"
                                           ><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a
                                        >
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <nav class="user-tabs">
                            <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                <li class="nav-item">
                                    <a class="nav-link" href="admin-home-page-accounts.jsp">Accounts</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" href="admin-home-page-charts.jsp">Statistics</a>
                                </li>
                            </ul>
                        </nav>
                        <div class="row">
                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <div
                                    class="card features feature-primary rounded border-0 shadow p-4"
                                    >
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-bed h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">558</h5>
                                            <p class="text-muted mb-0">Patients</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end col-->

                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <div
                                    class="card features feature-primary rounded border-0 shadow p-4"
                                    >
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-file-medical-alt h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">$2164</h5>
                                            <p class="text-muted mb-0">Avg. costs</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end col-->

                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <div
                                    class="card features feature-primary rounded border-0 shadow p-4"
                                    >
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-social-distancing h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">112</h5>
                                            <p class="text-muted mb-0">Staff Members</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end col-->

                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <div
                                    class="card features feature-primary rounded border-0 shadow p-4"
                                    >
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-ambulance h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">16</h5>
                                            <p class="text-muted mb-0">Vehicles</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end col-->

                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <div
                                    class="card features feature-primary rounded border-0 shadow p-4"
                                    >
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-medkit h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">220</h5>
                                            <p class="text-muted mb-0">Appointment</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end col-->

                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <div
                                    class="card features feature-primary rounded border-0 shadow p-4"
                                    >
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-medical-drip h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">10</h5>
                                            <p class="text-muted mb-0">Operations</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end col-->
                        </div>
                        <div class="chart-tab-container">
                            <div class="chart-tab">
                                <div class="col-md-12">
                                    <nav class="user-tabs">
                                        <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                            <li class="nav-item">
                                                <a class="nav-link active" href="#pat_appointments" data-bs-toggle="pill">Doctors</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#pat_medical_records" data-bs-toggle="pill">Staff</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#pat_billing" data-bs-toggle="pill">Customers</a>
                                            </li>
                                        </ul>
                                    </nav>
                                    <div class="tab-content pt-0">
                                        <!-- Appointment Tab -->
                                        <div id="pat_appointments" class="tab-pane fade show active">
                                            <div class="card card-table mb-0">
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-center mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th style="width: 20rem;">Doctor's Image</th>
                                                                    <th></th>
                                                                    <th style="width: 20rem;">Doctor's Name</th>
                                                                    <th></th>
                                                                    <th style="width: 20rem;">Specialty</th>
                                                                    <th></th>
                                                                    <th style="width: 20rem;">Degree</th> 
                                                                    <th></th>                                 
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="doctor" items="${doctor}">
                                                                    <tr>
                                                                        <td>
                                                                            <h2 class="table-avatar">
                                                                                <a href="dr-profile.jsp" class="avatar avatar-sm mr-2">
                                                                                    <img class="avatar-img rounded-circle" src="${doctor.userImg}" alt="User Image" />
                                                                                </a>
                                                                            </h2>
                                                                        </td>                                    
                                                                        <td></td>
                                                                        <td>${doctor.userName}</td>
                                                                        <td></td>
                                                                        <td>${doctor.speciality}</td>
                                                                        <td></td>
                                                                        <td>${doctor.degree}</td>
                                                                        <td>
                                                                            <div class="table-action">
                                                                                <a href="" class="btn btn-sm bg-danger-light">Delete</a>
                                                                                <c:choose>
                                                                                    <c:when test="${user.status_ =='true'}">
                                                                                        <a href="" class="btn btn-sm bg-primary-light">Ban</a>
                                                                                    </c:when>
                                                                                    <c:when test="${user.status_ =='False'}">
                                                                                        <a href="" class="btn btn-sm bg-primary-light">Active</a>
                                                                                    </c:when>
                                                                                </c:choose>
                                                                                <a href="dr-profile.jsp" class="btn btn-sm bg-info-light">View</a>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <a href="add-doctor.jsp" class="btn btn-primary">Add more doctor+</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Medical Records Tab -->
                                        <div id="pat_medical_records" class="tab-pane fade">
                                            <div class="card card-table mb-0">
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-center mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th style="width: 20rem;">Staff's Image</th>
                                                                    <th></th>
                                                                    <th style="width: 20rem;"></th>
                                                                    <th></th>
                                                                    <th style="width: 20rem;">Staff's Name</th>
                                                                    <th></th>
                                                                    <th style="width: 20rem;"></th> 
                                                                    <th></th>                                 
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="staff" items="${staff}">
                                                                    <tr>
                                                                        <td>
                                                                            <h2 class="table-avatar">
                                                                                <a href="staff-profile.jsp" class="avatar avatar-sm mr-2">
                                                                                    <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-07.jpg" alt="User Image" />
                                                                                </a>
                                                                            </h2>
                                                                        </td>                                    
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>${user.userName}</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <div class="table-action">
                                                                                <a href="" class="btn btn-sm bg-danger-light">Delete</a>
                                                                                <c:choose>
                                                                                    <c:when test="${user.status_ =='true'}">
                                                                                        <a href="" class="btn btn-sm bg-primary-light">Ban</a>
                                                                                    </c:when>
                                                                                    <c:when test="${user.status_ =='False'}">
                                                                                        <a href="" class="btn btn-sm bg-primary-light">Active</a>
                                                                                    </c:when>
                                                                                </c:choose>
                                                                                <a href="staff-profile.jsp" class="btn btn-sm bg-info-light">View</a>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <a href="add-staff.jsp" class="btn btn-primary">Add more staff+</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Medical Records Tab -->

                                        <!-- Billing Tab -->
                                        <div id="pat_billing" class="tab-pane fade">
                                            <div class="card card-table mb-0">
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-center mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th style="width: 20rem;">Customer's Image</th>
                                                                    <th></th>
                                                                    <th style="width: 20rem;"></th>
                                                                    <th></th>
                                                                    <th style="width: 20rem;">Customer's Name</th>
                                                                    <th></th>
                                                                    <th style="width: 20rem;"></th> 
                                                                    <th></th>                                 
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach>
                                                                    <tr>
                                                                        <td>
                                                                            <h2 class="table-avatar">
                                                                                <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                    <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-07.jpg" alt="User Image" />
                                                                                </a>
                                                                            </h2>
                                                                        </td>                                    
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>${user.userName}</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <div class="table-action">
                                                                                <a href="javascript:void(0);" class="btn btn-sm bg-danger-light">Delete</a>
                                                                                <c:choose>
                                                                                    <c:when test="${user.status_ =='true'}">
                                                                                        <a href="" class="btn btn-sm bg-primary-light">Ban</a>
                                                                                    </c:when>
                                                                                    <c:when test="${user.status_ =='False'}">
                                                                                        <a href="" class="btn btn-sm bg-primary-light">Active</a>
                                                                                    </c:when>
                                                                                </c:choose>
                                                                                <a href="customer-profile.jsp" class="btn btn-sm bg-info-light">View</a>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <a href="add-customer.jsp" class="btn btn-primary">Add more customer+</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Billing Tab -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end row-->
                    </div>
                    <!--end container-->
                </div>
                <!-- End -->
                <!--End page-content" -->
        </div>

        <!-- Script -->
        <jsp:include page="../Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
