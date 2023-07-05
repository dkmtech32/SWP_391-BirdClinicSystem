<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
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
                                        <a class="dropdown-item text-dark" href="dr-profile.html"
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
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Add New Staff</h5>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html">Doctris</a></li>
                                    <li class="breadcrumb-item"><a href="doctors.html">Doctors</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Add Staff</li>
                                </ul>
                            </nav>
                        </div>

                        <div class="row">
                            <div class="col-lg-8 mt-4">
                                <div class="card border-0 p-4 rounded shadow">
                                    <div class="row align-items-center">
                                        <div class="col-lg-2 col-md-4">
                                            <img src="../assets/images/client/02.jpg" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt />
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                            <h5 class>Upload your picture</h5>
                                            <p class="text-muted mb-0">For best results, use an image at least 600px by 600px in either .jpg or .png format</p>
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                            <a href="#" class="btn btn-primary">Upload</a>
                                        </div>
                                        <!--end col-->
                                    </div>
                                    <!--end row-->

                                    <form class="mt-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">First Name</label>
                                                    <input name="name" id="name" type="text" class="form-control" value="Leo" />
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Last Name</label>
                                                    <input name="name" id="name2" type="text" class="form-control" value="Bard" />
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Email</label>
                                                    <input name="email" id="email" type="email" class="form-control" value="doctor@birdlover.com" />
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Phone</label>
                                                    <input name="number" id="number" type="text" class="form-control" value="(+84) 123 456 78" />
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Gender</label>
                                                    <select class="form-control time-during">
                                                        <option value="">Male</option>
                                                        <option value="">Female</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Date of Birth</label>
                                                    <input name="date" id="number" type="date" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        <!--end row-->

                                        <div class="row">
                                            <div class="col-sm-12">
                                                <input type="submit" id="submit" name="send" class="btn btn-primary" value="Save changes" />
                                            </div>
                                            <!--end col-->
                                        </div>
                                        <!--end row-->
                                    </form>
                                </div>
                            </div>
                            <!--end col-->

                            <div class="col-lg-4 mt-4">
                                <div class="card rounded border-0 shadow">
                                    <div class="p-4 border-bottom">
                                        <h5 class="mb-0">Doctors List</h5>
                                    </div>

                                    <ul class="list-unstyled mb-0 p-4" data-simplebar style="height: 664px">
                                        <li class="d-md-flex align-items-center text-center text-md-start">
                                            <img src="../assets/images/doctors/01.jpg" class="avatar avatar-medium rounded-md shadow" alt />

                                            <div class="ms-md-3 mt-4 mt-sm-0">
                                                <a href="#" class="text-dark h6">Dr. Calvin Carlo</a>
                                                <p class="text-muted my-1">Cardiologist</p>
                                                <p class="text-muted mb-0">3 Years Experienced</p>
                                            </div>
                                        </li>

                                        <li class="d-md-flex align-items-center text-center text-md-start mt-4">
                                            <img src="../assets/images/doctors/02.jpg" class="avatar avatar-medium rounded-md shadow" alt />

                                            <div class="ms-md-3 mt-4 mt-sm-0">
                                                <a href="#" class="text-dark h6">Dr. Alex Smith</a>
                                                <p class="text-muted my-1">Dentist</p>
                                                <p class="text-muted mb-0">1 Years Experienced</p>
                                            </div>
                                        </li>

                                        <li class="d-md-flex align-items-center text-center text-md-start mt-4">
                                            <img src="../assets/images/doctors/03.jpg" class="avatar avatar-medium rounded-md shadow" alt />

                                            <div class="ms-md-3 mt-4 mt-sm-0">
                                                <a href="#" class="text-dark h6">Dr. Cristina Luly</a>
                                                <p class="text-muted my-1">Orthopedic</p>
                                                <p class="text-muted mb-0">5 Years Experienced</p>
                                            </div>
                                        </li>

                                        <li class="d-md-flex align-items-center text-center text-md-start mt-4">
                                            <img src="../assets/images/doctors/04.jpg" class="avatar avatar-medium rounded-md shadow" alt />

                                            <div class="ms-md-3 mt-4 mt-sm-0">
                                                <a href="#" class="text-dark h6">Dr. Dwayen Maria</a>
                                                <p class="text-muted my-1">Gastrologist</p>
                                                <p class="text-muted mb-0">2 Years Experienced</p>
                                            </div>
                                        </li>

                                        <li class="d-md-flex align-items-center text-center text-md-start mt-4">
                                            <img src="../assets/images/doctors/05.jpg" class="avatar avatar-medium rounded-md shadow" alt />

                                            <div class="ms-md-3 mt-4 mt-sm-0">
                                                <a href="#" class="text-dark h6">Dr. Jenelia Focia</a>
                                                <p class="text-muted my-1">Psychotherapist</p>
                                                <p class="text-muted mb-0">3 Years Experienced</p>
                                            </div>
                                        </li>

                                        <li class="mt-4">
                                            <a href="doctors.html" class="btn btn-primary">All Doctors</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!--end row-->
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
        <!-- Script -->
        <jsp:include page="../Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
