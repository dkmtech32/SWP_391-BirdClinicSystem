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
                            <h5 class="mb-0">Doctor Profile & Settings</h5>
                        </div>

                        <div class="card bg-white rounded shadow overflow-hidden mt-4 border-0">
                            <div class="p-5 bg-primary bg-gradient"></div>
                            <div class="avatar-profile d-flex margin-nagative mt-n5 position-relative ps-3">
                                <img src="<c:url value="/assets/images/doctors/${doctor.image.imageURLName}"/>" class="rounded-circle shadow-md avatar avatar-medium" alt />
                                <div class="mt-4 ms-3 pt-3">
                                    <h5 class="mt-3 mb-1">${doctor.fullName}</h5> 
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
                                                <div class="card booking-schedule schedule-widget" style="width: 82rem">
                                                    <!-- Schedule Header -->
                                                    <div class="schedule-header">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <!-- Day Slot -->
                                                                <div class="day-slot">
                                                                    <ul>
                                                                        <li>
                                                                            <span>Mon</span>
                                                                        </li>
                                                                        <li>
                                                                            <span>Tue</span>
                                                                        </li>
                                                                        <li>
                                                                            <span>Wed</span>
                                                                        </li>
                                                                        <li>
                                                                            <span>Thu</span>
                                                                        </li>
                                                                        <li>
                                                                            <span>Fri</span>
                                                                        </li>
                                                                        <li>
                                                                            <span>Sat</span>
                                                                        </li>
                                                                        <li>
                                                                            <span>Sun</span>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <!-- /Day Slot -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /Schedule Header -->

                                                    <!-- Schedule Content -->
                                                    <div class="schedule-cont">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <!-- Time Slot -->
                                                                <div class="time-slot">
                                                                    <ul class="clearfix">
                                                                        <li>
                                                                            <a class="timing"><span>7:00</span></a>
                                                                            <a class="timing"><span>8:00</span></a>
                                                                            <a class="timing"><span>9:00</span></a>
                                                                            <a class="timing"><span>10:00</span></a>
                                                                            <a class="timing"><span>13:00</span></a>
                                                                            <a class="timing"><span>14:00</span></a>
                                                                            <a class="timing"><span>15:00</span></a>
                                                                            <a class="timing"><span>16:00</span></a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="timing"><span>7:00</span></a>
                                                                            <a class="timing"><span>8:00</span></a>
                                                                            <a class="timing"><span>9:00</span></a>
                                                                            <a class="timing"><span>10:00</span></a>
                                                                            <a class="timing"><span>13:00</span></a>
                                                                            <a class="timing"><span>14:00</span></a>
                                                                            <a class="timing"><span>15:00</span></a>
                                                                            <a class="timing"><span>16:00</span></a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="timing"><span>7:00</span></a>
                                                                            <a class="timing"><span>8:00</span></a>
                                                                            <a class="timing"><span>9:00</span></a>
                                                                            <a class="timing"><span>10:00</span></a>
                                                                            <a class="timing"><span>13:00</span></a>
                                                                            <a class="timing"><span>14:00</span></a>
                                                                            <a class="timing"><span>15:00</span></a>
                                                                            <a class="timing"><span>16:00</span></a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="timing"><span>7:00</span></a>
                                                                            <a class="timing"><span>8:00</span></a>
                                                                            <a class="timing"><span>9:00</span></a>
                                                                            <a class="timing"><span>10:00</span></a>
                                                                            <a class="timing"><span>13:00</span></a>
                                                                            <a class="timing"><span>14:00</span></a>
                                                                            <a class="timing"><span>15:00</span></a>
                                                                            <a class="timing"><span>16:00</span></a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="timing"><span>7:00</span></a>
                                                                            <a class="timing"><span>8:00</span></a>
                                                                            <a class="timing"><span>9:00</span></a>
                                                                            <a class="timing"><span>10:00</span></a>
                                                                            <a class="timing"><span>13:00</span></a>
                                                                            <a class="timing"><span>14:00</span></a>
                                                                            <a class="timing"><span>15:00</span></a>
                                                                            <a class="timing"><span>16:00</span></a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="timing"><span>7:00</span></a>
                                                                            <a class="timing"><span>8:00</span></a>
                                                                            <a class="timing"><span>9:00</span></a>
                                                                            <a class="timing"><span>10:00</span></a>
                                                                            <a class="timing"><span>13:00</span></a>
                                                                            <a class="timing"><span>14:00</span></a>
                                                                            <a class="timing"><span>15:00</span></a>
                                                                            <a class="timing"><span>16:00</span></a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="timing"><span>7:00</span></a>
                                                                            <a class="timing"><span>8:00</span></a>
                                                                            <a class="timing"><span>9:00</span></a>
                                                                            <a class="timing"><span>10:00</span></a>
                                                                            <a class="timing"><span>13:00</span></a>
                                                                            <a class="timing"><span>14:00</span></a>
                                                                            <a class="timing"><span>15:00</span></a>
                                                                            <a class="timing"><span>16:00</span></a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <!-- /Time Slot -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /Schedule Content -->
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
                                                                        <img src="<c:url value="/assets/images/doctors/${doctor.image.imageURLName}"/>" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt />
                                                                    </div>
                                                                    <!-- này là avatar của doctor-->

                                                                    <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                                                        <h6>Upload your picture</h6>
                                                                    </div>
                                                                    <!--end col-->

                                                                    <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                                                        <a href="#" class="btn btn-primary">Upload</a>

                                                                    </div>
                                                                    <!--end col-->
                                                                </div>
                                                                <!--end row-->

                                                                <form class="mt-4" method='POST' action="<c:url value="/Admin/Doctors/Update/Info?doctorID=${doctor.userID}"/>">
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Full Name</label>
                                                                                <div class="form-control">${doctor.fullName}</div>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->

                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Email</label>
                                                                                <div class="form-control">${doctor.email}</div>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->

                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Phone</label>
                                                                                <div class="form-control">${doctor.phoneNumber}</div>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->

                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Gender</label>
                                                                                <div class="form-control">${doctor.gender}</div>
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
                                                                                <input name="academic-title" id="text" type="text" class="form-control" value="${doctor.academicTitle}"/>								
                                                                            </div>
                                                                        </div>
                                                                            
                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Year of experience</label>
                                                                                <input name="years-of-experience" id="text" type="text" class="form-control" value="${doctor.yearsOfExperience}"/>								
                                                                            </div>
                                                                        </div>
                                                                            
                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Doctor Age</label>
                                                                                <input name="age" id="text" type="text" class="form-control" value="${doctor.docAge}"/>								
                                                                            </div>
                                                                        </div>
                                                                            
                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Specialty</label>
                                                                                <select class="form-control" name="specialityID" type="select">
                                                                                    ${doctor.speciality.specialityName}
                                                                                    <option value="4a30b3f33f96b639ab20dce9f0b8b8db" 
                                                                                        <c:if test="${doctor.speciality.specialityID.equals('4a30b3f33f96b639ab20dce9f0b8b8db')}">
                                                                                            selected
                                                                                        </c:if>>
                                                                                        image analysation
                                                                                    </option>
                                                                                    <option value="52f6743e4719de9a35e1e2e1c09d6d52" 
                                                                                        <c:if test="${doctor.speciality.specialityID.equals('52f6743e4719de9a35e1e2e1c09d6d52')}">
                                                                                            selected
                                                                                        </c:if>>
                                                                                        surgery
                                                                                    </option>
                                                                                    <option value="7e2dc1364e2e1bdc9efc1669a17a9e45" 
                                                                                        <c:if test="${doctor.speciality.specialityID.equals('7e2dc1364e2e1bdc9efc1669a17a9e45')}">
                                                                                            selected
                                                                                        </c:if>>
                                                                                        beautify
                                                                                    </option>
                                                                                    <option value="8c15dfb7f4f3d4789ed0c043b1512e34" 
                                                                                        <c:if test="${doctor.speciality.specialityID.equals('8c15dfb7f4f3d4789ed0c043b1512e34')}">
                                                                                            selected
                                                                                        </c:if>>
                                                                                        resuscitation
                                                                                    </option>
                                                                                    <option value="bfiwafjnbeaffaiuwhfa9fhawfa56565" 
                                                                                        <c:if test="${doctor.speciality.specialityID.equals('bfiwafjnbeaffaiuwhfa9fhawfa56565')}">
                                                                                            selected
                                                                                        </c:if>>
                                                                                        genetics
                                                                                    </option>
                                                                                    <option value="e6157a31d2c5e20dc446f4f42fc0d40f" 
                                                                                        <c:if test="${doctor.speciality.specialityID.equals('e6157a31d2c5e20dc446f4f42fc0d40f')}">
                                                                                            selected
                                                                                        </c:if>>
                                                                                        general
                                                                                    </option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!--end row-->

                                                                    <div class="row">
                                                                        <div class="col-sm-12">
                                                                            <input type="submit" class="btn btn-primary" value="Save changes" />
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
                                                            <div class="p-4">
                                                                <div class="p-4 border-bottom">
                                                                    <h5 class="mb-0 text-danger">Account disable:</h5>
                                                                </div>

                                                                <div class="p-4">
                                                                    <h6 class="mb-0 fw-normal">If you want to ban/active this account, press the button Ban/Active below </h6>
                                                                    <div class="mt-4">
                                                                        <c:choose>
                                                                            <c:when test="${user.status_}">
                                                                                <button class="btn btn-primary">Ban</button>
                                                                            </c:when>
                                                                            <c:when test="${!user.status_}">
                                                                                <button class="btn btn-primary">Active</button>
                                                                            </c:when>
                                                                        </c:choose>
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
        <script>
            var timingElements = document.getElementsByClassName("timing");
            for (var i = 0; i < timingElements.length; i++) {
                timingElements[i].addEventListener("click", function() {
                    this.classList.toggle("selected");
                });
            }
        </script>
        <!-- Script -->
        <jsp:include page="../Admin/script-admin.jsp"/>
        <!-- /Script -->
    </body>
</html>
