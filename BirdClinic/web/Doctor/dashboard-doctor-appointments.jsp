<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <div class="col-md-8 col-lg-9 col-xl-10">


        <div class="row">
            <div class="col-md-12">
                <h4 class="mb-4">Patient Appointment</h4>
                <div class="appointment-tab">
                    <!-- Appointment Tab -->
                    <nav class="user-tabs mb-4">
                    <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab">Upcoming</a>
                        </li>
                    </ul>
                </nav>
                    <!-- /Appointment Tab -->

                    <div class="tab-content">
                        <!-- Upcoming Appointment Tab -->
                        <div class="tab-pane show active" id="upcoming-appointments">
                            <div class="card card-table mb-0">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Customer Name</th>
                                                    <th>Appointment Date</th>
                                                    <th>Bird Name</th>
                                                    <th>Bird Breed</th>
                                                    <th class="text-center">Service</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="appointment" items="${requestScope.appointments}">
                                                    <tr>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="doctor-profile.jsp" class="avatar avatar-sm mr-2">
                                                                    <img class="avatar-img rounded-circle" src="<c:url value="/assets/images/client/${appointment.bird.customer.image.imageURLName}"/>" alt="User Image" />
                                                                </a>
                                                                <a href="doctor-profile.jsp">${appointment.bird.customer.fullName} </a> 
                                                            </h2>
                                                        </td>
                                                        <td>${appointment.appTime}<span class="d-block text-info">${appointment.timeslot.timeSlot}</span></td>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="<c:url value="/View/Bird?birdID=${appointment.bird.birdID}"/>" class="avatar avatar-sm mr-2"
                                                                   ><img class="avatar-img rounded-circle" src="<c:url value="/assets/images/bird/${appointment.bird.image.imageURLName}"/>" alt="User Image"
                                                                      /></a>
                                                                <a href="<c:url value="/View/Bird?birdID=${appointment.bird.birdID}"/>">${appointment.bird.birdFullname}</a>
                                                            </h2>
                                                        </td>
                                                        <td>${appointment.bird.breed}</td>
                                                        <td>${appointment.service_.serviceName}</td>

                                                        <td class="text-right">
                                                            <div class="table-action">
                                                                <a href="<c:url value="/View/Appointment?appointmentID=${appointment.appointmentID}"/>" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                <a href="<c:url value='/Doctor/Prescription?appointmentID=${appointment.appointmentID}&new=new'/>" class="btn btn-sm bg-info-light"> <i class="fa fa-flask"></i> Prescribe </a>
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
                        <!-- /Upcoming Appointment Tab -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</html>
