<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../Admin/head-admin.jsp"/>
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
                                <img src="assets/images/logo-icon.png" height="30" class="small" alt />
                                <span class="big">
                                    <img src="assets/images/logo-dark.png" height="24" class="logo-light-mode" alt />
                                    <img src="assets/images/logo-light.png" height="24" class="logo-dark-mode" alt />
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
                                        <img src="<c:url value="assets/images/doctors/01.jpg"/>" class="avatar avatar-ex-small rounded-circle" alt />
                                    </button>
                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px">
                                        <a class="dropdown-item d-flex align-items-center text-dark" href="https://shreethemes.in/doctris/layouts/admin/profile.html">
                                            <img src="assets/images/doctors/01.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt />
                                            <div class="flex-1 ms-2">
                                                <span class="d-block mb-1"></span>
                                            </div>
                                        </a>
                                        <a class="dropdown-item text-dark" href="<c:url value="/Admin/Charts"/>"
                                           ><span class="mb-0 d-inline-block me-1"><i class="uil uil-dashboard align-middle h6"></i></span> Dashboard</a
                                        >

                                        <div class="dropdown-divider border-top"></div>
                                        <a class="dropdown-item text-dark" href="<c:url value="/logout"/>"
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
                            <h5 class="mb-0">Add New Doctor</h5>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 mt-4">
                                <div class="card border-0 p-4 rounded shadow">
                                    <div class="row align-items-center">
                                        <div class="col-lg-2 col-md-4">
                                            <img src="assets/images/doctors/01.jpg" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt />
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                            <h5>Upload your picture</h5>
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                            <a href="#" class="btn btn-primary">Upload</a>
                                        </div>
                                        <!--end col-->
                                    </div>
                                    <!--end row-->

                                    <form class="mt-4" method="POST" action="<c:url value="/Admin/Accounts/Create"/>">
                                        <input value="doctor" name="userRole" hidden="hidden"/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Full Name</label>
                                                    <input name="full-name" id="name" type="text" class="form-control"/>
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">User Name</label>
                                                    <input name="username" id="name2" type="text" class="form-control"/>
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Email</label>
                                                    <input name="email" id="email" type="email" class="form-control"/>
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Phone</label>
                                                    <input name="phone-number" id="number" type="text" class="form-control"/>
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label name="gender" class="form-label">Gender</label>
                                                    <select class="form-control" id="gender" name="gender">
                                                        <option value="male">Male</option>
                                                        <option value="female">Female</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Password</label>
                                                    <input name="password" id="text" type="password" class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Doctor Age</label>
                                                    <input name="doctor-age" id="text" type="number" class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Specialty</label>
                                                    <select class="form-control" id="speciality" name="specialityID">
                                                        <option value="4a30b3f33f96b639ab20dce9f0b8b8db">image analysation</option>
                                                        <option value="52f6743e4719de9a35e1e2e1c09d6d52">surgery</option>
                                                        <option value="7e2dc1364e2e1bdc9efc1669a17a9e45">beautify</option>
                                                        <option value="8c15dfb7f4f3d4789ed0c043b1512e34">resuscitation</option>
                                                        <option value="bfiwafjnbeaffaiuwhfa9fhawfa56565">genetics</option>
                                                        <option value="e6157a31d2c5e20dc446f4f42fc0d40f">general</option>
                                                    </select>
                                                </div>
                                            </div> 

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Degree</label>
                                                    <input name="degree" id="text" type="text" class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Academic Title</label>
                                                    <input name="academic-title" id="text" type="text" class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Years of experience</label>
                                                    <input name="years-of-experience" id="text" type="number" class="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end row-->

                                        <div class="row">
                                            <div class="col-sm-12">
                                                <input type="submit" id="submit" name="send" class="btn btn-primary" value="Create" />
                                            </div>
                                            <!--end col-->
                                        </div>
                                        <!--end row-->
                                    </form>
                                </div>
                            </div>
                            <!--end row-->

                            
                            <!--end row-->
                        </div>
                    </div>
                    <!--end col-->
                </div>
                <!--end row-->

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
        <jsp:include page="../Admin/script-admin.jsp"/>
        <!-- /Script -->
    </body>
</html>
