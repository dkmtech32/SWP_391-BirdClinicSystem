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
                <jsp:include page="../Admin/admin-dropdown-menu.jsp"/>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Add New Staff</h5>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 mt-4">
                                <div class="card border-0 p-4 rounded shadow">
                                    <form class="mt-4" method="POST" action="<c:url value="/Admin/Accounts/Create"/>" enctype="multipart/form-data">
                                        <div class="row align-items-center">
                                                <div class="col-lg-2 col-md-4" id="bird-image-preview-container">
                                                    <img id="bird-image-preview" style="display: none"  class="avatar avatar-md-md rounded-pill shadow mx-auto " alt />
                                                </div>
                                                <!--end col-->

                                                <div class="upload-img">
                                                    <div class="change-photo-btn">
                                                        <span><i class="fa fa-upload"></i> Upload Photo</span>
                                                        <!-- Add an onchange attribute to the input file element -->
                                                        <input name="user-image" id="bird-image" type="file" class="upload" onchange="previewImage(event)" />
                                                    </div>
                                                    <small class="form-text text-muted">Allowed JPG, GIF or PNG. Max size of 2MB</small>
                                                </div>
                                             
                                        </div>
                                        <!--end row-->

                                        <input value="staff" name="userRole" hidden="hidden"/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Full Name</label>
                                                    <input name="full-name" id="name" type="text" class="form-control" required/>
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">User Name</label>
                                                    <input name="username" id="name2" type="text" class="form-control" required/>
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Email</label>
                                                    <input name="email" id="email" type="email" class="form-control" required/>
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Phone</label>
                                                    <input name="phone-number" id="number" type="text" class="form-control" required/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Password</label>
                                                    <input name="password" id="text" type="password" class="form-control" required/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label  class="form-label">Gender</label>
                                                    <select name="gender" class="form-control time-during" required>
                                                        <option value="male">Male</option>
                                                        <option value="female">Female</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-12">
                                                <input type="submit" id="submit"  class="btn btn-primary"  />
                                            </div>
                                        </div>
                                        <!--end row-->
                                    </form>
                                </div>
                            </div>
                            <!--end col-->

                            <script>
                                function previewImage() {
                                    var input = document.getElementById("bird-image");
                                    var container = document.getElementById("bird-image-preview-container");

                                    // Remove any existing preview image
                                    var existingPreview = document.getElementById("bird-image-preview");
                                    if (existingPreview) {
                                        container.removeChild(existingPreview);
                                    }

                                    if (input.files && input.files[0]) {
                                        var reader = new FileReader();

                                        reader.onload = function (e) {
                                            var previewImage = document.createElement("img");
                                            previewImage.id = "bird-image-preview";
                                            previewImage.src = e.target.result;
                                            previewImage.alt = "Selected Bird Image";
                                            previewImage.style.maxWidth = "200px";
                                            previewImage.style.marginTop = "10px";

                                            // Append the preview image to the container
                                            container.appendChild(previewImage);
                                        };

                                        reader.readAsDataURL(input.files[0]);
                                    }
                                }
                            </script>
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
        <jsp:include page="../Admin/script-admin.jsp"/>
        <!-- /Script -->
    </body>
</html>
