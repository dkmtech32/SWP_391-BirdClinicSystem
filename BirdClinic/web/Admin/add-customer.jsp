<%-- 
    Document   : add-customer
    Created on : Jul 12, 2023, 11:43:24 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../Admin/head-admin.jsp"/>
    <body>
        <jsp:include page="../Admin/loader.jsp"/>
        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="../Admin/sidebar.jsp"/>

            <main class="page-content bg-light">
                <jsp:include page="../Admin/admin-dropdown-menu.jsp"/>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Add New Patient</h5>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 mt-4">
                                <div class="card border-0 p-4 rounded shadow">
                                    <div class="row align-items-center">
                                        <div class="col-lg-2 col-md-4">
                                            <img src="${user.image}" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt />
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                            <h5 class>Upload your picture</h5>
                                            <p class="text-muted mb-0">For best results, use an image at least 600px by 600px in either .jpg or .png format</p>
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                            <a href="#" class="btn btn-primary">Upload</a>
                                            <a href="#" class="btn btn-soft-primary ms-2">Remove</a>
                                        </div>
                                        <!--end col-->
                                    </div>
                                    <!--end row-->

                                    <form class="mt-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Full Name</label>
                                                    <input name="name" id="name" type="text" class="form-control" placeholder="Full Name :" />
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">User Name</label>
                                                    <input name="name" id="name2" type="text" class="form-control" placeholder="User Name :" />
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Your Email</label>
                                                    <input name="email" id="email" type="email" class="form-control" placeholder="Your email :" />
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Phone no.</label>
                                                    <input name="number" id="number" type="text" class="form-control" placeholder="Phone no. :" />
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label"> Date of Birth: </label>
                                                    <input name="date" type="text" class="flatpickr flatpickr-input form-control" id="checkin-date" />
                                                </div>
                                            </div>
                                        </div>
                                        <!--end row-->

                                        <button type="submit" class="btn btn-primary">Add Patient</button>
                                    </form>
                                </div>
                            </div>
                            <!--end col-->
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
        </div>
        <!-- Script -->
        <jsp:include page="../Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
