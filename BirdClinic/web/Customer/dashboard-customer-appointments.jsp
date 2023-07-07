<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <div class="col-md-7 col-lg-8 col-xl-9">
        <div class="card">
            <div class="card-body pt-0">
                <!-- Tab Menu -->
                <nav class="user-tabs mb-4">
                    <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                        <li class="nav-item">
                            <a class="nav-link active" href="#pat_appointments" data-toggle="tab">Appointments</a>
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
                                                <th>Doctor</th>
                                                <th>Appointment Date</th>
                                                <th>Bird</th>
                                                <th>Bird Breed</th>
                                                <th>Service</th>
                                                <th>Status</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="appointment" items="${requestScope.appointments}">
                                                <tr>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="doctor-profile.jsp" class="avatar avatar-sm mr-2">
                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-07.jpg" alt="User Image" />
                                                            </a>
                                                            <a href="doctor-profile.jsp">${appointment.doctor}<span>${doctor.userRole}</span></a> <!-- userRole này ý ông là chuyên ngành của bác sĩ? -->
                                                        </h2>
                                                    </td>
                                                    <td>${appointment.appTime}<span class="d-block text-info">${appointment.timeslot}</span></td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="../Common/bird-details.jsp" class="avatar avatar-sm mr-2"
                                                               ><img class="avatar-img rounded-circle" src="assets/img/bird/bird-3.jpg" alt="User Image"
                                                                  /></a>
                                                            <a href="../Common/bird-details.jsp">${bird.birdFullname}</a>
                                                        </h2>
                                                    </td>
                                                    <td>${bird.breed}</td>
                                                    <td>${appointment.service_}</td>
                                                    <c:choose>
                                                        <c:when test="${appointment.appStatus =='processing'}">
                                                            <td><span class="badge badge-pill bg-warning-light">Processing</span></td>
                                                        </c:when>
                                                        <c:when test="${appointment.appStatus =='confirmed'}">
                                                            <td><span class="badge badge-pill bg-success-light">Confirmed</span></td>
                                                        </c:when>
                                                        <c:when test="${appointment.appStatus =='checkin'}">
                                                            <td><span class="badge badge-pill bg-purple-light">Check In</span></td>
                                                        </c:when>
                                                        <c:when test="${appointment.appStatus =='complete'}">
                                                            <td><span class="badge badge-pill bg-primary-light">Completed</span></td>
                                                        </c:when>
                                                        <c:when test="${appointment.appStatus =='cancel'}">
                                                            <td><span class="badge badge-pill bg-danger-light">Canceled</span></td>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${appointment.appStatus =='processing'}">
                                                            <td class="text-right">
                                                                <div class="table-action">
                                                                    <a href="" class="btn btn-sm bg-danger-light"> <i class="fa fa-times"></i> Cancel </a>
                                                                    <!--                                                                                    <a href="javascript:void(0);" class="btn btn-sm bg-primary-light"> <i class="fas fa-print"></i> Print </a>-->
                                                                    <a href="../Common/client-appointments-details.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                </div>
                                                            </td>
                                                        </c:when>
                                                        <c:when test="${appointment.appStatus =='confirmed'}">
                                                            <td class="text-right">
                                                                <div class="table-action">
                                                                    <!-- <a href="javascript:void(0);" class="btn btn-sm bg-primary-light"> <i class="fas fa-print"></i> Print </a>-->
                                                                    <a href="../Common/client-appointments-details.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                </div>
                                                            </td>
                                                        </c:when>
                                                        <c:when test="${appointment.appStatus =='check in'}">
                                                            <td class="text-right">
                                                                <div class="table-action">
                                                                    <!-- <a href="javascript:void(0);" class="btn btn-sm bg-primary-light"> <i class="fas fa-print"></i> Print </a>-->
                                                                    <a href="../Common/client-appointments-details.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                </div>
                                                            </td>
                                                        </c:when>
                                                        <c:when test="${appointment.appStatus =='complete'}">
                                                            <td class="text-right">
                                                                <div class="table-action">
                                                                    <a href="view-prescription.jsp" class="btn btn-sm bg-info-light"> <i class="fa fa-flask"></i> Prescription </a>
                                                                    <!--<a href="javascript:void(0);" class="btn btn-sm bg-primary-light"> <i class="fas fa-print"></i> Print </a>-->
                                                                    <a href="../Common/client-appointments-details.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                </div>
                                                            </td>
                                                        </c:when>
                                                        <c:when test="${appointment.appStatus =='cancel'}">
                                                            <td class="text-right">
                                                                <div class="table-action">
                                                                    <!-- <a href="javascript:void(0);" class="btn btn-sm bg-primary-light"> <i class="fas fa-print"></i> Print </a>-->
                                                                    <a href="client-appointments-details-feedback.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                </div>
                                                            </td>
                                                        </c:when>
                                                    </c:choose>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Appointment Tab -->

                </div>
                <!-- Tab Content -->
            </div>
        </div>
    </div>
</html>
