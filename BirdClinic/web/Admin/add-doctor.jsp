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
                            <h5 class="mb-0">Add New Doctor</h5>
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
                                            <!--end col-->
                                        </div>
                                        <!--end row-->


                                        <input value="doctor" name="userRole" hidden="hidden"/>
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
                                                    <input name="password" id="text" type="password" class="form-control" required/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Doctor Age</label>
                                                    <input name="doctor-age" id="text" type="number" class="form-control" value="26" required="required" oninput="validateQuantity(this)" />
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
                                                    <input name="degree" id="text" type="text" class="form-control" required/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Academic Title</label>
                                                    <input name="academic-title" id="text" type="text" class="form-control" required/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Years of experience</label>
                                                    <input name="years-of-experience" id="text" type="number" class="form-control" value="1" required="required" oninput="validateYearOfExperienceQuantity(this)"/>
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
    <script>
        function validateQuantity(input) {
            if (input.value < 26) {
                input.value = 26;
            }
        }
        function validateYearOfExperienceQuantity(input) {
            if (input.value < 1) {
                input.value = 1;
            }
        }
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
</html>
