<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Doctris - Doctor Appointment Booking System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="admin-home-page.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico.png" />
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <!-- Select2 -->
        <link href="assets/css/select2.min.css" rel="stylesheet" />
        <!-- simplebar -->
        <link href="assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- SLIDER -->
        <link href="assets/css/tiny-slider.css" rel="stylesheet" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet" />
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
    </head>
    <body>
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
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Doctor Profile & Settings</h5>
                        </div>

                        <div class="card bg-white rounded shadow overflow-hidden mt-4 border-0">
                            <div class="p-5 bg-primary bg-gradient"></div>
                            <div class="avatar-profile d-flex margin-nagative mt-n5 position-relative ps-3">
                                <img src="assets/images/doctors/01.jpg" class="rounded-circle shadow-md avatar avatar-medium" alt />
                                <div class="mt-4 ms-3 pt-3">
                                    <h5 class="mt-3 mb-1">${doctor.doctor}</h5>
                                    <p class="text-muted mb-0">Doctor</p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 mt-4">
                                    <div class="card border-0 rounded-0 p-4">
                                        <ul
                                            class="nav nav-pills nav-justified flex-column flex-sm-row rounded shadow overflow-hidden bg-light"
                                            id="pills-tab"
                                            role="tablist"
                                            >
                                            <li class="nav-item">
                                                <a class="nav-link rounded-0" data-bs-toggle="pill" href="#pills-settings">
                                                    <div class="text-center pt-1 pb-1">
                                                        <h4 class="title fw-normal mb-0">Profile</h4>
                                                    </div> 
                                                </a><!--end nav link-->
                                            </li>

                                            <li class="nav-item">
                                                <a class="nav-link rounded-0" data-bs-toggle="pill" href="#pills-timetable">
                                                    <div class="text-center pt-1 pb-1">
                                                        <h4 class="title fw-normal mb-0">Time Table</h4>
                                                    </div> 
                                                </a><!--end nav link-->
                                            </li>
                                        </ul>

                                        <div class="tab-content mt-2" id="pills-tabContent">											
                                            <div class="tab-pane fade" id="pills-timetable" role="tabpanel" aria-labelledby="timetable-tab">
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-12">
                                                        <div class="card border-0 p-3 rounded shadow">
                                                            <ul class="list-unstyled mb-0">
                                                                <li class="d-flex justify-content-between mt-2">
                                                                    <div class="text-primary mb-0 d-flex align-items-center">
                                                                        <p class="text-muted mb-0"><i class="ri-time-fill text-primary align-middle h5 mb-0"></i> Monday</p>
                                                                    </div>
                                                                    <div class="text-primary mb-0 d-flex align-items-center">

                                                                        <div class="text-primary mb-0 d-flex align-items-center">
                                                                            <span class="m-2 text-dark">Time:</span>
                                                                            <div class="flex-grow-1">
                                                                                <select class="form-control time-during select2input" name="time2">
                                                                                    <option value="9:00 AM - 10:00 AM">9:00 AM - 10:00 AM</option>
                                                                                    <option value="10:00 AM - 11:00 AM">10:00 AM - 11:00 AM</option>
                                                                                    <option value="1:00 PM - 2:00 PM">1:00 PM - 2:00 PM</option>
                                                                                    <option value="2:00 PM - 3:00 PM">2:00 PM - 3:00 PM</option>																			
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                </li>
                                                                <li class="d-flex justify-content-between mt-2">
                                                                    <div class="text-primary mb-0 d-flex align-items-center">
                                                                        <p class="text-muted mb-0"><i class="ri-time-fill text-primary align-middle h5 mb-0"></i>Tuesday</p>
                                                                    </div>
                                                                    <div class="text-primary mb-0 d-flex align-items-center">

                                                                        <div class="text-primary mb-0 d-flex align-items-center">
                                                                            <span class="m-2 text-dark">Time:</span>
                                                                            <div class="flex-grow-1">
                                                                                <select class="form-control time-during select2input" name="time2">
                                                                                    <option value="9:00 AM - 10:00 AM">9:00 AM - 10:00 AM</option>
                                                                                    <option value="10:00 AM - 11:00 AM">10:00 AM - 11:00 AM</option>
                                                                                    <option value="1:00 PM - 2:00 PM">1:00 PM - 2:00 PM</option>
                                                                                    <option value="2:00 PM - 3:00 PM">2:00 PM - 3:00 PM</option>																			
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <!--end col-->

                                                    <div class="col-lg-4 col-md-12">
                                                        <div class="card border-0 p-3 rounded shadow">
                                                            <ul class="list-unstyled mb-0">
                                                                <li class="d-flex justify-content-between mt-2">
                                                                    <div class="text-primary mb-0 d-flex align-items-center">
                                                                        <p class="text-muted mb-0"><i class="ri-time-fill text-primary align-middle h5 mb-0"></i>Wednesday</p>
                                                                    </div>
                                                                    <div class="text-primary mb-0 d-flex align-items-center">

                                                                        <div class="text-primary mb-0 d-flex align-items-center">
                                                                            <span class="m-2 text-dark">Time:</span>
                                                                            <div class="flex-grow-1">
                                                                                <select class="form-control time-during select2input" name="time2">
                                                                                    <option value="9:00 AM - 10:00 AM">9:00 AM - 10:00 AM</option>
                                                                                    <option value="10:00 AM - 11:00 AM">10:00 AM - 11:00 AM</option>
                                                                                    <option value="1:00 PM - 2:00 PM">1:00 PM - 2:00 PM</option>
                                                                                    <option value="2:00 PM - 3:00 PM">2:00 PM - 3:00 PM</option>																			
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                </li>
                                                                <li class="d-flex justify-content-between mt-2">
                                                                    <div class="text-primary mb-0 d-flex align-items-center">
                                                                        <p class="text-muted mb-0"><i class="ri-time-fill text-primary align-middle h5 mb-0"></i>Thursday</p>
                                                                    </div>
                                                                    <div class="text-primary mb-0 d-flex align-items-center">

                                                                        <div class="text-primary mb-0 d-flex align-items-center">
                                                                            <span class="m-2 text-dark">Time:</span>
                                                                            <div class="flex-grow-1">
                                                                                <select class="form-control time-during select2input" name="time2">
                                                                                    <option value="9:00 AM - 10:00 AM">9:00 AM - 10:00 AM</option>
                                                                                    <option value="10:00 AM - 11:00 AM">10:00 AM - 11:00 AM</option>
                                                                                    <option value="1:00 PM - 2:00 PM">1:00 PM - 2:00 PM</option>
                                                                                    <option value="2:00 PM - 3:00 PM">2:00 PM - 3:00 PM</option>																			
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4 col-md-12">
                                                        <div class="card border-0 p-3 rounded shadow">
                                                            <ul class="list-unstyled mb-0">
                                                                <li class="d-flex justify-content-between mt-2">
                                                                    <div class="text-primary mb-0 d-flex align-items-center">
                                                                        <p class="text-muted mb-0"><i class="ri-time-fill text-primary align-middle h5 mb-0"></i>Friday</p>
                                                                    </div>
                                                                    <div class="text-primary mb-0 d-flex align-items-center">

                                                                        <div class="text-primary mb-0 d-flex align-items-center">
                                                                            <span class="m-2 text-dark">Time:</span>
                                                                            <div class="flex-grow-1">
                                                                                <select class="form-control time-during select2input" name="time2">
                                                                                    <option value="9:00 AM - 10:00 AM">9:00 AM - 10:00 AM</option>
                                                                                    <option value="10:00 AM - 11:00 AM">10:00 AM - 11:00 AM</option>
                                                                                    <option value="1:00 PM - 2:00 PM">1:00 PM - 2:00 PM</option>
                                                                                    <option value="2:00 PM - 3:00 PM">2:00 PM - 3:00 PM</option>																			
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                </li>
                                                                <li class="d-flex justify-content-between mt-2">
                                                                    <div class="text-primary mb-0 d-flex align-items-center">
                                                                        <p class="text-muted mb-0"><i class="ri-time-fill text-primary align-middle h5 mb-0"></i>Saturday</p>
                                                                    </div>
                                                                    <div class="text-primary mb-0 d-flex align-items-center">

                                                                        <div class="text-primary mb-0 d-flex align-items-center">
                                                                            <span class="m-2 text-dark">Time:</span>
                                                                            <div class="flex-grow-1">
                                                                                <select class="form-control time-during select2input" name="time2">
                                                                                    <option value="9:00 AM - 10:00 AM">9:00 AM - 10:00 AM</option>
                                                                                    <option value="10:00 AM - 11:00 AM">10:00 AM - 11:00 AM</option>
                                                                                    <option value="1:00 PM - 2:00 PM">1:00 PM - 2:00 PM</option>
                                                                                    <option value="2:00 PM - 3:00 PM">2:00 PM - 3:00 PM</option>																			
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12" style="margin-top: 1rem;">
                                                    <input type="submit" class="rounded btn btn-primary" value="Save" />
                                                </div>
                                                <!--end row-->
                                            </div>
                                            <!--end teb pane-->

                                            <div class="tab-pane fade show active" id="pills-settings" role="tabpanel" aria-labelledby="settings-tab">
                                                <h5 class="mb-1">Settings</h5>
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="rounded shadow mt-4">
                                                            <div class="p-4 border-bottom">
                                                                <h6 class="mb-0">Personal Information :</h6>
                                                            </div>

                                                            <div class="p-4">
                                                                <div class="row align-items-center">
                                                                    <div class="col-lg-2 col-md-4">
                                                                        <img src="assets/images/doctors/01.jpg" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt />
                                                                    </div>
                                                                    <!--end col-->

                                                                    <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                                                        <h6 class>Upload your picture</h6>
                                                                        <p class="text-muted mb-0">
                                                                            For best results, use an image at least 256px by 256px in either .jpg or .png format
                                                                        </p>
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
                                                                                <input name="name" id="name" type="text" class="form-control" value="${user.fullName}"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        
                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Username</label>
                                                                                <input name="name" id="name2" type="text" class="form-control" value="${user.userName}"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->

                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Staff Email</label>
                                                                                <input name="email" id="email" type="email" class="form-control" value="${user.email}" />
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->

                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Phone</label>
                                                                                <input name="number" id="number" type="text" class="form-control"  value="${user.phoneNumber}"/>
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
                                                                                <input name="date" id="number" type="date" class="form-control" value="${appointment.bird.customer.dob}"/>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Degree</label>
                                                                                <input name="degree" id="text" type="text" class="form-control" value="${doctor.degree}"/>								
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Academic Title</label>
                                                                                <input name="date" id="text" type="text" class="form-control" value="${doctor.academicTitle}"/>								
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!--end row-->

                                                                    <div class="row">
                                                                        <div class="col-sm-12">
                                                                            <input type="submit" id="submit" name="send" class="btn btn-primary" value="Save changes" />
                                                                        </div>
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
                                                            <div class="p-4 border-bottom">
                                                                <h6 class="mb-0">Reset password:</h6>
                                                            </div>

                                                            <div class="p-4">
                                                                <form>
                                                                    <div class="row">

                                                                        <div class="col-lg-12">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">New password :</label>
                                                                                <input type="password" class="form-control" placeholder="New password" required />
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->

                                                                        <div class="col-lg-12">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Re-type New password :</label>
                                                                                <input type="password" class="form-control" placeholder="Re-type New password" required />
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->

                                                                        <div class="col-lg-12 mt-2 mb-0">
                                                                            <button class="btn btn-primary">Save password</button>
                                                                        </div>
                                                                        <!--end col-->
                                                                    </div>
                                                                    <!--end row-->
                                                                </form>
                                                            </div>
                                                        </div>

                                                        <div class="rounded shadow mt-4">
                                                            <div class="p-4">
                                                                <div class="p-4 border-bottom">
                                                                    <h5 class="mb-0 text-danger">Account disable:</h5>
                                                                </div>

                                                                <div class="p-4">
                                                                    <h6 class="mb-0 fw-normal">Do you want to delete the account? Please press below "Delete" button</h6>
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
                                                </div>
                                                <!--end row-->
                                            </div>
                                            <!--end teb pane-->
                                        </div>
                                        <!--end tab content-->
                                    </div>
                                </div>
                                <!--end col-->
                            </div>
                            <!--end row-->
                        </div>
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
