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
                        <!-- Profile Sidebar -->
                        <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
                            <div class="profile-sidebar">
                                <div class="widget-profile pro-widget-content">
                                    <div class="profile-info-widget">
                                        <a href="#" class="booking-doc-img">
                                            <img src="assets/img/patients/patient.jpg" alt="User Image" />
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>Richard Wilson</h3>
                                            <div class="patient-details">
                                                <h5><i class="fas fa-birthday-cake"></i> 24 Jul 1983, 38 years</h5>
                                                <h5 class="mb-0"><i class="fas fa-map-marker-alt"></i> Newyork, USA</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dashboard-widget">
                                    <nav class="dashboard-menu">
                                        <ul>
                                            <li>
                                                <a href="#">
                                                    <i class="fas fa-columns"></i>
                                                    <span>Dashboard</span>
                                                </a>
                                            </li>


                                            <li class="active">
                                                <a href="profile-settings.html">
                                                    <i class="fas fa-user-cog"></i>
                                                    <span>Profile Settings</span>
                                                </a>
                                            </li>

                                            <li>
                                                <a href="birdlist.jsp">
                                                    <i class="fa fa-tasks"></i>
                                                    <span>Birds List</span>
                                                </a>
                                            </li>

                                            <li>
                                                <a href="change-password.html">
                                                    <i class="fas fa-lock"></i>
                                                    <span>Change Password</span>
                                                </a>
                                            </li>

                                            <li>
                                                <a href="index.html">
                                                    <i class="fas fa-sign-out-alt"></i>
                                                    <span>Logout</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <!-- /Profile Sidebar -->

                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="card">
                                <div class="card-body">
                                    <!-- Profile Settings Form -->
                                    <form>
                                        <div class="row form-row">
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <div class="change-avatar">
                                                        <div class="profile-img">
                                                            <img src="assets/img/bird/bird-1.webp" alt="Bird Image" />
                                                        </div>
                                                        <div class="upload-img">
                                                            <div class="change-photo-btn">
                                                                <span><i class="fa fa-upload"></i> Upload Photo</span>
                                                                <input type="file" class="upload" />
                                                            </div>
                                                            <small class="form-text text-muted">Allowed JPG, GIF or PNG. Max size of 2MB</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Bird's Name</label>
                                                    <input type="text" class="form-control" value="Chó" required />
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Hatching Date</label>
                                                    <div class="cal-icon">
                                                        <input type="text" class="form-control datetimepicker" value="24-07-2022" required/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Breed</label>
                                                    <input type="text" class="form-control" value="Sparrow" required/>
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Sex</label>
                                                    <select class="form-control" required>
                                                        <option>Male</option>
                                                        <option>Female</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Weight (in grams)</label>
                                                    <input type="number" class="form-control" name="weight" placeholder="Enter weight in grams" step="0.1" value="35" required />
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Band/Microchip ID</label>
                                                    <input type="text" class="form-control" name="weight" value="emdeplam123" required/>
                                                </div>
                                            </div>

                                            <div class="submit-section">
                                                <button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
                                            </div>
                                    </form>
                                    <!-- /Profile Settings Form -->
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
