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
        <!-- Loader -->
        <jsp:include page="../Admin/loader.jsp"/>

        <!-- Loader -->

        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="../Admin/sidebar.jsp"/>

            <!-- sidebar-wrapper  -->

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <jsp:include page="../Admin/admin-dropdown-menu.jsp"/>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="row">
                            <div class="col-lg-12 col-md-7 mt-4">
                                <div class="card border-0 shadow overflow-hidden">
                                    <ul
                                        class="nav nav-pills nav-justified flex-column flex-sm-row rounded-0 shadow overflow-hidden bg-white mb-0"
                                        id="pills-tab"
                                        role="tablist"
                                        >
                                        <li class="nav-item">
                                            <a class="nav-link rounded-0 active" id="overview-tab" data-bs-toggle="pill" href="#pills-customer-profile" role="tab">
                                                <div class="text-center pt-1 pb-1">
                                                    <h4 class="title fw-normal mb-0">Customer Profile</h4>
                                                </div> </a
                                            ><!--end nav link-->
                                        </li>
                                        <!--end nav item-->

                                        <li class="nav-item">
                                            <a class="nav-link rounded-0" id="experience-tab" data-bs-toggle="pill" href="#pills-bird-list" role="tab">
                                                <div class="text-center pt-1 pb-1">
                                                    <h4 class="title fw-normal mb-0">Bird List</h4>
                                                </div> </a
                                            ><!--end nav link-->
                                        </li>
                                        <!--end nav item-->
                                    </ul>
                                    <div class="tab-content p-4" id="pills-tabContent">
                                        <div class="tab-pane fade show active" id="pills-customer-profile">
                                            <div class="row">
                                                <div class="col-12 mt-4">
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="rounded shadow mt-4">
                                                                <div class="p-4 border-bottom">
                                                                    <h6 class="mb-0">Personal Information :</h6>
                                                                </div>

                                                                <div class="p-4">
                                                                    <div class="row align-items-center">
                                                                        <div class="col-lg-2 col-md-4">
                                                                            <img src="<c:url value="/assets/images/customer/${customer.image.imageURLName}"/>" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt/>
                                                                        </div>
                                                                        <!--end col-->

                                                                        <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                                                            <h6 class>Upload your picture</h6>
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
                                                                                    <label class="form-label">Full Name</label>
                                                                                    <div class="form-control">${customer.fullName}</div>
                                                                                </div>
                                                                            </div>
                                                                            <!--end col-->

                                                                            <div class="col-md-6">
                                                                                <div class="mb-3">
                                                                                    <label class="form-label">Email</label>
                                                                                    <div class="form-control">${customer.email}</div>
                                                                                </div>
                                                                            </div>
                                                                            <!--end col-->

                                                                            <div class="col-md-6">
                                                                                <div class="mb-3">
                                                                                    <label class="form-label">Phone</label>
                                                                                    <div class="form-control">${customer.phoneNumber}</div>
                                                                                </div>
                                                                            </div>
                                                                            <!--end col-->

                                                                            <div class="col-md-6">
                                                                                <div class="mb-3">
                                                                                    <label class="form-label">Gender</label>
                                                                                    <div class="form-control">${customer.gender}</div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <!--end row-->

                                                                        <div class="row">
                                                                            <div class="col-sm-12">
                                                                                <input type="submit" id="submit" name="send" class="btn btn-primary" value="Save changes"/>
                                                                            </div>
                                                                            <!--end col-->
                                                                        </div>
                                                                        <!--end row-->
                                                                    </form>
                                                                    <!--end form-->
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!--end col-->

                                                        <div class="col-lg-6">
                                                            <div class="rounded shadow mt-4">
                                                                <div class="p-4">
                                                                    <div class="p-4 border-bottom">
                                                                        <h5 class="mb-0 text-danger">
                                                                            Account disable:
                                                                        </h5>
                                                                    </div>

                                                                    <div class="p-4">
                                                                        <h6 class="mb-0 fw-normal">
                                                                            Do you want to delete the account?
                                                                            Please press below "Delete" button
                                                                        </h6>
                                                                        <div class="mt-4">
                                                                            <button class="btn btn-danger">Delete Account</button>
                                                                            <button class="btn btn-primary">Ban</button>
                                                                        </div>
                                                                        <!--end col-->
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!--end col-->

                                                        <!--end row-->

                                                        <!--end teb pane-->
                                                    </div>
                                                </div>
                                                <!--end col-->
                                            </div>
                                        </div>

                                        <div class="tab-pane fade" id="pills-bird-list" role="tabpanel" aria-labelledby="experience-tab">
                                            <div class="rounded shadow mt-4">
                                                <div class="p-4 border-bottom">
                                                    <h6 class="mb-0">Bird List :</h6>
                                                </div>

                                                <div class="row">
                                                    <div class="col-12 mt-4">
                                                        <div class="table-responsive shadow rounded">
                                                            <table class="table table-center bg-white mb-0">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="border-bottom p-3" style="min-width: 180px">Bird Name</th>
                                                                        <th class="border-bottom p-3">Microchip</th>
                                                                        <th class="border-bottom p-3">Breed</th>
                                                                        <th class="border-bottom p-3">Sex</th>
                                                                        <th class="border-bottom p-3">Feather color</th>
                                                                        <th class="border-bottom p-3">Weight</th>
                                                                        <th class="border-bottom p-3" style="min-width: 100px">Hatching Date</th>
                                                                        <th class="border-bottom p-3"style="min-width: 80px"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach items="${birds}" var="bird">
                                                                        <tr>
                                                                            <td class="py-3">
                                                                                <a href="" class="text-dark">
                                                                                    <div class="d-flex align-items-center">
                                                                                        <img
                                                                                            src="<c:url value="/assets/images/bird/${bird.image.imageURLName}"/>"
                                                                                            class="avatar avatar-md-sm rounded-circle shadow"
                                                                                            alt
                                                                                            />
                                                                                        <span class="ms-2">${bird.birdFullname}</span>
                                                                                    </div>
                                                                                </a>
                                                                            </td>
                                                                            <td class="p-3">${bird.band_Chip}</td>
                                                                            <td class="p-3">${bird.breed}</td>
                                                                            <td class="p-3">${bird.birdGender}</td>
                                                                            <td class="p-3">${bird.featherColor}</td>
                                                                            <td class="p-3">${bird.birdWeight}</td>
                                                                            <td class="p-3">${bird.hatchingDate}</td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->


        <!-- Script -->
        <jsp:include page="../Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
