<%-- 
    Document   : bird-details
    Created on : Jul 7, 2023, 10:12:44 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../Common/head.jsp"/>



    <body>
        <!-- Main Wrapper -->
        <div class="main-wrapper">
            <!-- Header -->
            <jsp:include page="../Common/header.jsp"/>
            <!--/Header -->

            <!-- Breadcrumb -->
            <jsp:include page="../Common/breadcrumb.jsp"/>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="bird-detail-page-container">
                <div class="bird-detail-page">  
                    <div class="card">
                        <div class="card-body">
                            <div class="row bird-info">

                                <div class="widget-profile pro-widget-content">
                                    <div class="profile-info-widget">
                                        <a href="#" class="booking-doc-img">
                                            <img src="<c:url value='/images/bird/${bird.image.imageURLName}'/>" alt="User Image">
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>${bird.birdFullname}</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row bird-information-boxes">
                                    <!--                <div class="col-12 col-md-6">
                                                        <p class="header">Bird's name</p>
                                                        <p class="information"></p>
                                                    </div>-->
                                    <div class="col-12 col-md-6">
                                        <p class="title">Hatching Day: </p>
                                        <p class="information">${bird.hatchingDate}</p>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <p class="title">Breed: </p>
                                        <p class="information">${bird.breed}</p>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <p class="title">Sex: </p>
                                        <p class="information">${bird.birdGender}</p>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <p class="title">Weight: </p>
                                        <p class="information">${bird.birdWeight}</p>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <p class="title">Microchip: </p>  
                                        <p class="information">${bird.band_Chip}</p>
                                    </div>
                                    <!--                            <div class="col-12 col-md-6">
                                                                    <p>Sex Method</p>
                                                                    <p class="information"></p>
                                                                </div>-->
                                    <div class="col-12 col-md-6">
                                        <p class="title">Feather Color: </p>
                                        <p class="information">${bird.featherColor}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 col-xl-6">
                            <div class="card">
                                <div class="card-body pt-0">
                                    <!-- Tab Menu -->
                                    <nav class="user-tabs mb-4">
                                        <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                            <li class="nav-item">
                                                <a class="nav-link active" href="#pat_appointments" data-toggle="tab">Bird Appointment</a>
                                            </li>

                                        </ul>
                                    </nav>
                                    <!-- /Tab Menu -->

                                    <!-- Tab Content -->
                                    <div class="tab-content pt-0">
                                        <!-- Appointment Tab -->
                                        <div id="pat_appointments" class="tab-pane fade show active">
                                            <div class="card card-table mb-0">
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-center mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th class="text-center">Appointment Date</th>

                                                                    <th class="text-center">Service</th>

                                                                    <th class="text-center">Doctor</th>
                                                                    <th class="text-center">Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="app" items="${appointments}">
                                                                    <tr> <!-- làm vòng lặp xổ tất cả danh sách medical record của con chim này -->

                                                                        <td class="text-center">${app.appTime}</td>

                                                                        <td class="text-center">
                                                                            <c:forEach var="service" items="${app.service_}" >
                                                                                ${service.serviceName} <br/>
                                                                            </c:forEach>
                                                                        </td>

                                                                        <td class="text-center">${app.doctor.fullName}</td>

                                                                        <td class="text-center">
                                                                            <div class="table-action">
                                                                                <a href="<c:url value="/View/Appointment?appointmentID=${app.appointmentID}"/>" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                            </div>
                                                                        </td>
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
                        <div class="col-md-7 col-xl-6">
                            <div class="card">
                                <div class="card-body pt-0">
                                    <!-- Tab Menu -->
                                    <nav class="user-tabs mb-4">
                                        <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                            <li class="nav-item">
                                                <a class="nav-link active" href="#pat_appointments" data-toggle="tab">Medical Record</a>
                                            </li>

                                        </ul>
                                    </nav>
                                    <!-- /Tab Menu -->

                                    <!-- Tab Content -->
                                    <div class="tab-content pt-0">
                                        <!-- Appointment Tab -->
                                        <div id="pat_appointments" class="tab-pane fade show active">
                                            <div class="card card-table mb-0">
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-center mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th class="text-center">Diagnosis</th>

                                                                    <th class="text-center">Treatment days</th>

                                                                    <th class="text-center">Doctor's note</th>

                                                                    <th class="text-center">Date</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="medRec" items="${medicalrecords}">
                                                                    <tr> <!-- làm vòng lặp xổ tất cả danh sách medical record của con chim này -->

                                                                        <td class="text-center">${medRec.diagnosis}</td>

                                                                        <td class="text-center">${medRec.treatmentDays}</td>

                                                                        <td class="text-center">${medRec.doctorNotes}</td>

                                                                        <td class="text-center">${medRec.recordTime.toString().split(" ")[0]}</td>
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
                    </div>
                </div>
            </div>

            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include page="../Common/footer.jsp"/>
            <!-- /Footer -->
        </div>
        <!-- /Main Wrapper -->

        <!-- Script -->
        <jsp:include page="../Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>

