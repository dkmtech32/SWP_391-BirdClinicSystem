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
                            <a class="nav-link active" href="<c:url value="/Dashboard/Appointments"/>" data-toggle="tab">Appointments</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/Dashboard/Birds"/>" data-toggle="tab">Birds</a>
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
                                                                <img class="avatar-img rounded-circle" src="../assets/img/doctors/doctor-thumb-07.jpg" alt="User Image" />
                                                            </a>
                                                            <a href="doctor-profile.jsp">${appointment.doctor.fullName} <span>${doctor.speciality.specialityName}</span></a> 
                                                        </h2>
                                                    </td>
                                                    <td>${appointment.appTime}<span class="d-block text-info">${appointment.timeslot.timeSlot}</span></td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="<c:url value="/View/Bird?birdID=${appointment.bird.birdID}"/>" class="avatar avatar-sm mr-2"
                                                               ><img class="avatar-img rounded-circle" src="assets/img/bird/bird-3.jpg" alt="User Image"
                                                                  /></a>
                                                            <a href="<c:url value="/View/Bird?birdID=${appointment.bird.birdID}"/>">${appointment.bird.birdFullname}</a>
                                                        </h2>
                                                    </td>
                                                    <td>${appointment.bird.breed}</td>
                                                    <td>${appointment.service_.serviceName}</td>
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
                                                    <td class="text-right">
                                                        <div class="table-action">
                                                            <c:if test="${appointment.appStatus =='processing'}">
                                                                <a href="<c:url value="/Dashboard/Appointments/Cancel?appointmentID=${appointment.appointmentID}"/>" class="btn btn-sm bg-danger-light"> 
                                                                    <i class="fa fa-times"></i> Cancel 
                                                                </a>
                                                            </c:if>
                                                            <!--                                                                                    <a href="javascript:void(0);" class="btn btn-sm bg-primary-light"> <i class="fas fa-print"></i> Print </a>-->
                                                            <a href="<c:url value="/View/Appointment?appointmentID=${appointment.appointmentID}"/>" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
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
                    <!-- /Appointment Tab -->

                </div>
                <!-- Tab Content -->
            </div>
        </div>
    </div>
</html>
