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
        <!-- Loader -->
        <jsp:include page="../Admin/loader.jsp"/>

        <!-- Loader -->

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
                        <div class="row">
                            <div class="col-xl-9 col-lg-6 col-md-4">
                                <h5 class="mb-0">Staff List</h5>
                                <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                                    <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Staff List</li>
                                    </ul>
                                </nav>
                            </div>
                            <!--end col-->

                            <div class="col-xl-3 col-lg-6 col-md-8 mt-4 mt-md-0">
                                <div class="justify-content-md-end">
                                    <div class="search-bar p-0 d-none d-lg-block ms-2">
                                        <div id="search" class="menu-search mb-0">
                                            <form role="search" method="get" id="searchform" class="searchform">
                                                <div>
                                                    <input type="text" class="form-control border rounded-pill" name="s" id="s" placeholder="Search by Staff name" />
                                                    <input type="submit" id="searchsubmit" value="Search" />
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end col-->
                        </div>
                        <!--end row-->

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive bg-white shadow rounded">
                                    <table class="table mb-0 table-center">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px">#</th>
                                                <th class="border-bottom p-3" style="min-width: 170px">Name</th>
                                                <th class="border-bottom p-3" style="min-width: 100px">Full Name</th>
                                                <th class="border-bottom p-3" style="min-width: 120px">Email</th>
                                                <th class="border-bottom p-3" style="min-width: 120px">Phone</th>
                                                <th class="border-bottom p-3">Gender</th>
                                                <th class="border-bottom p-3" style="min-width: 100px">Date of Birth</th>
                                                <th class="border-bottom p-3" style="min-width: 100px"></th>

                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach var="list" items="${requestScope.stafflist}">
                                                <tr>
                                                    <th class="p-3">${list.no}</th>
                                                    <td class="p-3">
                                                        <a href="staff-profile.html" class="text-dark">
                                                            <div class="d-flex align-items-center">
                                                                <img src="../assets/images/client/${list.img}" class="avatar avatar-md-sm rounded-circle border shadow" alt />
                                                                <span class="ms-2">${list.name}</span>
                                                            </div>
                                                        </a>
                                                    </td>
                                                    <td class="p-3">${list.username}</td>
                                                    <td class="p-3">${list.mail}</td>
                                                    <td class="p-3">${list.phone}</td>
                                                    <td class="p-3">${list.sex}</td>
                                                    <td class="p-3">${list.dob}</td>
                                                    <td class="text-end p-3">
                                                        <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"
                                                           ><i class="uil uil-pen"></i
                                                            ></a>
                                                        <a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!--end row-->

                        <div class="row text-center">
                            <!-- PAGINATION START -->
                            <div class="col-12 mt-4">
                                <div class="d-md-flex align-items-center text-center justify-content-between">
                                    <span class="text-muted me-3">Showing 1 - 10 out of 50</span>
                                    <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Previous">Prev</a></li>
                                        <li class="page-item active"><a class="page-link" href="javascript:void(0)">1</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Next">Next</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!--end col-->
                            <!-- PAGINATION END -->
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
        <!-- page-wrapper -->
        <!-- Script -->
        <jsp:include page="../Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
