<%-- 
    Document   : admin-home-page
    Created on : Jul 10, 2023, 9:38:41 AM
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
                            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                                <i class="uil uil-bars"></i>
                            </a>
                            <div class="search-bar p-0 d-none d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <form role="search" method="get" id="searchform" class="searchform">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="s" id="s" placeholder="Search Keywords..." />
                                            <input type="submit" id="searchsubmit" value="Search" />
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <ul class="list-unstyled mb-0">
                            <li class="list-inline-item mb-0">
                                <div class="dropdown dropdown-primary">
                                    <button
                                        type="button"
                                        class="btn btn-pills btn-soft-primary dropdown-toggle p-0"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <img src="../assets/images/language/american.png" class="avatar avatar-ex-small rounded-circle p-2" alt />
                                    </button>
                                    <div
                                        class="dropdown-menu dd-menu drop-ups dropdown-menu-end bg-white shadow border-0 mt-3 p-2"
                                        data-simplebar
                                        style="height: 175px"
                                        >
                                        <a href="javascript:void(0)" class="d-flex align-items-center">
                                            <img src="../assets/images/language/chinese.png" class="avatar avatar-client rounded-circle shadow" alt />
                                            <div class="flex-1 text-left ms-2 overflow-hidden">
                                                <small class="text-dark mb-0">Chinese</small>
                                            </div>
                                        </a>

                                        <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                            <img src="../assets/images/language/european.png" class="avatar avatar-client rounded-circle shadow" alt />
                                            <div class="flex-1 text-left ms-2 overflow-hidden">
                                                <small class="text-dark mb-0">European</small>
                                            </div>
                                        </a>

                                        <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                            <img src="../assets/images/language/indian.png" class="avatar avatar-client rounded-circle shadow" alt />
                                            <div class="flex-1 text-left ms-2 overflow-hidden">
                                                <small class="text-dark mb-0">Indian</small>
                                            </div>
                                        </a>

                                        <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                            <img src="../assets/images/language/japanese.png" class="avatar avatar-client rounded-circle shadow" alt />
                                            <div class="flex-1 text-left ms-2 overflow-hidden">
                                                <small class="text-dark mb-0">Japanese</small>
                                            </div>
                                        </a>

                                        <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                            <img src="../assets/images/language/russian.png" class="avatar avatar-client rounded-circle shadow" alt />
                                            <div class="flex-1 text-left ms-2 overflow-hidden">
                                                <small class="text-dark mb-0">Russian</small>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </li>

                            <li class="list-inline-item mb-0 ms-1">
                                <a href="javascript:void(0)" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                                    <div class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="settings" class="fea icon-sm"></i></div>
                                </a>
                            </li>

                            <li class="list-inline-item mb-0 ms-1">
                                <div class="dropdown dropdown-primary">
                                    <button
                                        type="button"
                                        class="btn btn-icon btn-pills btn-soft-primary dropdown-toggle p-0"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <i data-feather="mail" class="fea icon-sm"></i>
                                    </button>
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                          >4 <span class="visually-hidden">unread mail</span></span
                                    >

                                    <div
                                        class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow rounded border-0 mt-3 px-2 py-2"
                                        data-simplebar
                                        style="height: 320px; width: 300px"
                                        >
                                        <a href="#" class="d-flex align-items-center justify-content-between py-2">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="../assets/images/client/02.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt />
                                                <small class="text-dark mb-0 d-block text-truncat ms-3"
                                                       >You received a new email from <b>Janalia</b> <small class="text-muted fw-normal d-inline-block">1 hour ago</small></small
                                                >
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="../assets/images/client/Codepen.svg" class="avatar avatar-md-sm rounded-circle shadow" alt />
                                                <small class="text-dark mb-0 d-block text-truncat ms-3"
                                                       >You received a new email from <b>codepen</b> <small class="text-muted fw-normal d-inline-block">4 hour ago</small></small
                                                >
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="../assets/images/client/03.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt />
                                                <small class="text-dark mb-0 d-block text-truncat ms-3"
                                                       >You received a new email from <b>Cristina</b> <small class="text-muted fw-normal d-inline-block">5 hour ago</small></small
                                                >
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="../assets/images/client/dribbble.svg" class="avatar avatar-md-sm rounded-circle shadow" alt />
                                                <small class="text-dark mb-0 d-block text-truncat ms-3"
                                                       >You received a new email from <b>Dribbble</b> <small class="text-muted fw-normal d-inline-block">24 hour ago</small></small
                                                >
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="../assets/images/client/06.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt />
                                                <small class="text-dark mb-0 d-block text-truncat ms-3"
                                                       >You received a new email from <b>Donald Aghori</b>
                                                    <small class="text-muted fw-normal d-inline-block">1 day ago</small></small
                                                >
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="../assets/images/client/07.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt />
                                                <small class="text-dark mb-0 d-block text-truncat ms-3"
                                                       >You received a new email from <b>Calvin</b> <small class="text-muted fw-normal d-inline-block">2 day ago</small></small
                                                >
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </li>

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
                                        <a class="dropdown-item text-dark" href="index.html"
                                           ><span class="mb-0 d-inline-block me-1"><i class="uil uil-dashboard align-middle h6"></i></span> Dashboard</a
                                        >
                                        <a class="dropdown-item text-dark" href="dr-profile.jsp"
                                           ><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a
                                        >
                                        <div class="dropdown-divider border-top"></div>
                                        <a class="dropdown-item text-dark" href="lock-screen.html"
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
                        <h5 class="mb-0">Dashboard</h5>
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
                        <div class="row">
                            <div class="chart-tab">
                                <div class="col-md-12">
                                    <ul class="nav nav-tabs nav-tabs-solid nav-tabs-rounded">
                                        <li class="nav-item">
                                            <a class="nav-link active" href="#upcoming-appointments" data-toggle="tab">Doctor Charts</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#today-appointments" data-toggle="tab">Staff Charts</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#done-appointments" data-toggle="tab">Services Charts</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="upcoming-appointments">
                                            <div class="row">
                                                <div class="col-xl-8 col-lg-7 mt-4">
                                                    <div class="card shadow border-0 p-4">
                                                        <div class="justify-content-between align-items-center mb-3">
                                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                                <div class="mb-0 position-relative">
                                                                    <select class="form-select form-control" id="yearchart">
                                                                        <option value="" data-service-price='-'>--</option>
                                                                        <c:forEach var="doctor" items="${doctorList}">
                                                                            <option value="${doctor.userID}" >
                                                                                ${doctor.fullName}
                                                                            </option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div style="width: 200rem; height: 30rem">
                                                                <canvas id="myChart"></canvas>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end col-->

                                                <div class="col-xl-4 col-lg-5 mt-4">
                                                    <div class="card shadow border-0 p-4">
                                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                                            <div style="width: 27rem; height: 20rem">
                                                                <canvas id="piechart"></canvas>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                            </div>
                                            <div class="col-xl-12 col-lg-7 mt-4">
                                                <div class="card shadow border-0 p-4">
                                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                                        <div class="mb-0 position-relative">
                                                            <select class="form-select form-control" id="dailychart">
                                                                <option value="" data-service-price='-'>--</option>
                                                                <c:forEach var="doctor" items="${doctorList}">
                                                                    <option value="${doctor.userID}" >
                                                                        ${doctor.fullName}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div style="width: 90rem; height: 50rem">
                                                        <canvas id="doctor_number_appointment"></canvas>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="tab-pane" id="today-appointments">
                                            <div class="row">
                                                <div class="col-xl-8 col-lg-7 mt-4">
                                                    <div class="card shadow border-0 p-4">
                                                        <div class="justify-content-between align-items-center mb-3">
                                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                                <div class="mb-0 position-relative">
                                                                    <select class="form-select form-control" id="yearchart2">
                                                                        <option value="" data-service-price='-'>--</option>
                                                                        <c:forEach var="service" items="${serviceList}">
                                                                            <option value="${service.serviceID}" >
                                                                                ${service.serviceName}
                                                                            </option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div style="width: 200rem; height: 30rem">
                                                                <canvas id="serviceIncomeByMonth"></canvas>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end col-->

                                                <div class="col-xl-4 col-lg-5 mt-4">
                                                    <div class="card shadow border-0 p-4">
                                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                                            <div style="width: 30rem; height: 30rem">
                                                                <canvas id="barChartHighestServiceIncome"></canvas>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                            </div>
                                        </div>

                                        <div class="tab-pane" id="done-appointments">
                                            <div class="row">
                                                <div class="col-xl-8 col-lg-7 mt-4">
                                                    <div class="card shadow border-0 p-4">
                                                        <div class="justify-content-between align-items-center mb-3">
                                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                                <div class="mb-0 position-relative">
                                                                    Select month
                                                                    <select class="form-select form-control" id="dailychart">
                                                                        <option selected>January</option>
                                                                        <option>February</option>
                                                                        <option>March</option>
                                                                        <option>April</option>
                                                                        <option>May</option>
                                                                        <option>June</option>
                                                                        <option>July</option>
                                                                        <option>August</option>
                                                                        <option>September</option>
                                                                        <option>October</option>
                                                                        <option>November</option>
                                                                        <option>December</option>
                                                                    </select>
                                                                </div>
                                                                <div class="mb-0 position-relative">
                                                                    Select year
                                                                    <select class="form-select form-control" id="dailychart">
                                                                        <option selected>2023</option>
                                                                        <option>2022</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div style="width: 90rem; height: 50rem; margin-left: 20rem;">
                                                                <canvas id="pieChartBooking"></canvas>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end row-->
                    </div>
                    <!--end container-->

                    <!--                     Footer Start 
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
                                                    end col
                                                </div>
                                                end row
                                            </div>
                                            end container
                                        </footer>
                                        end footer-->
                    <!-- End -->
            </main>
            <!--End page-content" -->
        </div>
        <script>
            // Sample data for the chart
            const data = {
            labels: [
                    "January",
                    "February",
                    "March",
                    "April",
                    "May",
                    "June",
                    "July",
                    "August",
                    "September",
                    "October",
                    "November",
                    "December"
            ],
                    datasets: [
                    {
                    data: [
                        <c:forEach items="${doctorRatingbyMonth}" var="doctor" varStatus="status">
                            ${doctor.rating}${!status.last ? ',' : ''}
                        </c:forEach>
                    ],
                    backgroundColor: [
                        "rgba(75, 192, 192, 0.6)",
                        "rgba(250, 225, 169, 255)",
                        "rgba(4, 43, 99, 255)",
                        "#6c2b2d",
                        "rgba(221, 44, 44, 255)",
                        "rgba(25, 25, 25, 255)"
                    ],
                    borderColor: [
                        "rgba(75, 192, 192, 0.6)",
                        "rgba(250, 225, 169, 255)",
                        "rgba(4, 43, 99, 255)",
                        "#6c2b2d",
                        "rgba(221, 44, 44, 255)",
                        "rgba(25, 25, 25, 255)"
                    ],
                    borderWidth: 1
                    }
                ]
            };
            // Chart configuration
            const config = {
                type: "line",
                data: data,
                options: {
                    // scales: {
                    //   x: {
                    //     type: "category",
                    //   },
                    // },
                    plugins: {
                        title: {
                            display: true,
                            text: "Doctor's average rating by month",
                            font: {
                                size: 25,
                            },
                        },
                    },
                    layout: {
                        margin: {
                            left: 70,
                            right: 50,
                            bottom: 50,
                            top: 50,
                        },
                    },
                },
            };
            const barChartData = {
                labels: [
                    <c:forEach items="${highestRated}" var="doctor" varStatus="status">
                        ${doctor.highestRatedDoctor}${!status.last ? ',' : ''}
                    </c:forEach>
                ],
                datasets: [
                    {
                    label: "Population",
                    data: [
                        <c:forEach items="${highestRated}" var="doctor" varStatus="status">
                            ${doctor.highestRatedPoint}${!status.last ? ',' : ''}
                        </c:forEach>
                    ],
                    backgroundColor: [
                                    "rgba(75, 192, 192, 0.6)",
                                    "rgba(250,225,169,255)",
                                    "rgba(4,43,99,255)",
                                    "#6c2b2d",
                                    "rgba(221,44,44,255)",
                                    "rgba(25,25,25,255)",
                            ],
                            borderColor: [
                                    "rgba(75, 192, 192, 0.6)",
                                    "rgba(250,225,169,255)",
                                    "rgba(4,43,99,255)",
                                    "#6c2b2d",
                                    "rgba(221,44,44,255)",
                                    "rgba(25,25,25,255)",
                            ],
                            borderWidth: 1,
                    },
                    ],
            };
            // Chart configuration
            const configBarChart = {
                type: "bar",
                data: barChartData,
                options: {
                    // scales: {
                    //   x: {
                    //     type: "category",
                    //   },
                    // },
                    plugins: {
                        title: {
                            display: true,
                            text: "Top 5 highest rated doctors",
                            font: {
                                size: 25,
                            },
                        },
                    },
                    layout: {
                        margin: {
                            left: 70,
                            right: 50,
                            bottom: 50,
                            top: 50,
                        },
                    },
                },
            };
            const barChartNumberAppointmentData = {
                labels: [
                    "January",
                    "February",
                    "March",
                    "April",
                    "May",
                    "June",
                    "July",
                    "August",
                    "September",
                    "October",
                    "November",
                    "December",
                ],
                    datasets: [
                    {
                        data: [
                            <c:forEach items="${numberOfAppointMent}" var="doctor" varStatus="status">
                                ${doctor.appoitmentByMonth}${!status.last ? ',' : ''}
                            </c:forEach>
                        ],
                        backgroundColor: [
                            "rgba(75, 192, 192, 0.6)",
                            "rgba(250,225,169,255)",
                            "rgba(4,43,99,255)",
                            "#6c2b2d",
                            "rgba(221,44,44,255)",
                            "rgba(25,25,25,255)",
                        ],
                        borderColor: [
                            "rgba(75, 192, 192, 0.6)",
                            "rgba(250,225,169,255)",
                            "rgba(4,43,99,255)",
                            "#6c2b2d",
                            "rgba(221,44,44,255)",
                            "rgba(25,25,25,255)",
                        ],
                        borderWidth: 1,
                    },
                ],
            };
            // Chart configuration
            const configAppointmentNumberBarChart = {
                type: "bar",
                data: barChartNumberAppointmentData,
                options: {
                    // scales: {
                    //   x: {
                    //     type: "category",
                    //   },
                    // },
                    plugins: {
                        title: {
                            display: true,
                            text: "Doctor's number of appointment by month",
                            font:{
                                size: 25,
                            },
                        },
                    },
                    layout: {
                        margin: {
                            left: 70,
                            right: 50,
                            bottom: 50,
                            top: 50,
                        },
                    },
                },
            };
            const barChartServiceIncomeByMonth = {
                labels:[
                    "January",
                    "February",
                    "March",
                    "April",
                    "May",
                    "June",
                    "July",
                    "August",
                    "September",
                    "October",
                    "November",
                    "December",
                ],
                datasets: [
                    {
                        data: [
                            <c:forEach items="${numberOfAppoitment}" var="service" varStatus="status">
                                ${service.numberOfAppointment}${!status.last ? ',' : ''}
                            </c:forEach>
                        ],
                        backgroundColor: [
                            "rgba(75, 192, 192, 0.6)",
                            "rgba(250,225,169,255)",
                            "rgba(4,43,99,255)",
                            "#6c2b2d",
                            "rgba(221,44,44,255)",
                            "rgba(25,25,25,255)",
                        ],
                        borderColor: [
                            "rgba(75, 192, 192, 0.6)",
                            "rgba(250,225,169,255)",
                            "rgba(4,43,99,255)",
                            "#6c2b2d",
                            "rgba(221,44,44,255)",
                            "rgba(25,25,25,255)",
                        ],
                        borderWidth: 1,
                    },
                ],
            };
            // Chart configuration
            const configServiceIncomeByMonth = {
                type: "bar",
                data: barChartServiceIncomeByMonth,
                options: {
                    // scales: {
                    //   x: {
                    //     type: "category",
                    //   },
                    // },
                    plugins: {
                        title: {
                            display: true,
                            text: "Service's imcome by month (by USD $)",
                            font: {
                                size: 25,
                            },
                        },
                    },
                    layout: {
                        margin: {
                            left: 70,
                            right: 50,
                            bottom: 50,
                            top: 50,
                        },
                    },
                },
            };
            const barChartTopIncomeService = {
                labels: [
                    <c:forEach items="${highestIncome}" var="service" varStatus="status">
                        ${service.highestIncomeService}${!status.last ? ',' : ''}
                    </c:forEach>
                ],
                datasets: [
                    {
                        label: "",
                        data: [
                            <c:forEach items="${highestRated}" var="service" varStatus="status">
                                ${service.highestIncomePoint}${!status.last ? ',' : ''}
                            </c:forEach>
                        ],
                        backgroundColor: [
                            "rgba(75, 192, 192, 0.6)",
                            "rgba(250,225,169,255)",
                            "rgba(4,43,99,255)",
                            "#6c2b2d",
                            "rgba(221,44,44,255)",
                            "rgba(25,25,25,255)",
                        ],
                        borderColor: [
                            "rgba(75, 192, 192, 0.6)",
                            "rgba(250,225,169,255)",
                            "rgba(4,43,99,255)",
                            "#6c2b2d",
                            "rgba(221,44,44,255)",
                            "rgba(25,25,25,255)",
                        ],
                        borderWidth: 1,
                    },
                ],
            };
            // Chart configuration
            const configBarChartTopIncomeService = {
                type: "bar",
                data: barChartTopIncomeService,
                options: {
                    // scales: {
                    //   x: {
                    //     type: "category",
                    //   },
                    // },
                    plugins: {
                        title: {
                            display: true,
                            text: "Top 5 highest rated doctors",
                            font: {
                                size: 25,
                            },
                        },
                    },
                    layout: {
                        margin: {
                            left: 70,
                            right: 50,
                            bottom: 50,
                            top: 50,
                        },
                    },
                },
            };
            
            const pieChartBookingData = {
                labels: ["Processing", "Confirmed", "Checked In", "Completed", "Canceled"],
                datasets: [
                    {
                        label: "",
                        data: [
                            <c:forEach items="${highestRated}" var="service" varStatus="status">
                                ${service.highestIncomePoint}${!status.last ? ',' : ''}
                            </c:forEach>
                        ],
                        backgroundColor: [
                            "#f39c12",
                            "#26af48",
                            "#2196f3",
                            "##c580ff",
                            "#e63c3c",
                        ],
                        borderColor: [
                            "#f39c12",
                            "#26af48",
                            "#2196f3",
                            "#c580ff",
                            "#e63c3c",
                        ],
                        borderWidth: 1,
                    },
                ],
            };
            // Chart configuration
            const configPieChartBooking = {
                type: "pie",
                data: pieChartBookingData,
                options: {
                    // scales: {
                    //   x: {
                    //     type: "category",
                    //   },
                    // },
                    plugins: {
                        title: {
                            display: true,
                            text: "Top 5 highest rated doctors",
                            font: {
                                size: 25,
                            },
                        },
                    },
                    layout: {
                        margin: {
                            left: 70,
                            right: 50,
                            bottom: 50,
                            top: 50,
                        },
                    },
                },
            };
            // Create a new instance of Chart
            const myChart = new Chart(document.getElementById("myChart"), config);
            const piechart = new Chart(document.getElementById("piechart"), configBarChart);
            const doctor_number_appointment = new Chart(document.getElementById("doctor_number_appointment"), configAppointmentNumberBarChart);
            const serviceIncomeByMonth = new Chart(document.getElementById("serviceIncomeByMonth"), configServiceIncomeByMonth);
            const barChartHighestServiceIncome = new Chart(document.getElementById("barChartHighestServiceIncome"), configBarChartTopIncomeService);
            const pieChartBooking = new Chart(document.getElementById("pieChartBooking"), configPieChartBooking);
        </script>
        <!-- Script -->
        <jsp:include page="../Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
