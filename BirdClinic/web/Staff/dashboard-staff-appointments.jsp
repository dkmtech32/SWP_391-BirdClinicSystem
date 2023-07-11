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
                    <ul class="nav nav-tabs nav-tabs-solid nav-tabs-rounded">
                        <li class="nav-item">
                            <a class="nav-link <c:if test="${param.filter.equals('upcoming')}">active</c:if> " href="<c:url value="/Dashboard/Appointments?filter=upcoming"/>" >Upcoming</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link <c:if test="${param.filter.equals('complete')}">active</c:if> "  href="<c:url value="/Dashboard/Appointments?filter=complete"/>" >Completed</a>
                            </li>
                            <li class="nav-item">
                                <form class="nav-link" action="<c:url value="/Dashboard/Appointments"/>" method="get">
                                <select onchange="updateFormAction()" name="filter">
                                    <option value="">--</option>
                                    <option value="processing" <c:if test="${param.filter.equals('processing')}">selected</c:if>>Processing</option>
                                    <option value="confirm" <c:if test="${param.filter.equals('confirm')}">selected</c:if> >Confirmed</option>
                                    <option value="check-in" <c:if test="${param.filter.equals('check-in')}">selected</c:if>>Checked-in</option>
                                    <option value="cancelled" <c:if test="${param.filter.equals('cancelled')}">selected</c:if>>Canceled</option>
                                    <option value="complete" <c:if test="${param.filter.equals('complete')}">selected</c:if>>Completed</option>
                                    </select>
                                </form>
                            </li>
                        </ul>
                        <!-- /Appointment Tab -->

                        <div class="tab-content">
                            <!-- Upcoming Appointment Tab -->
                            <div class="tab-pane show active" >
                                <div class="card card-table mb-0">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-hover table-center mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>Customer Name</th>
                                                        <th>Date & time</th>
                                                        <th style="width:150px; max-width: 150px;">Bird Name</th>
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
                                                                    <img class="avatar-img rounded-circle" src="../assets/images/client/${appointment.bird.customer.image.imageURLName}" alt="User Image" />
                                                                </a>
                                                                <a href="doctor-profile.jsp">${appointment.bird.customer.fullName} </a> 
                                                            </h2>
                                                        </td>
                                                        <td>${appointment.appTime}<span class="d-block text-info">${appointment.timeslot.timeSlot}</span></td>
                                                        <td style="width:150px; max-width: 150px; white-space: nowrap;
                                                            overflow: hidden;
                                                            text-overflow: ellipsis">
                                                            <h2 class="table-avatar">
                                                                <a href="<c:url value="/View/Bird?birdID=${appointment.bird.birdID}"/>" class="avatar avatar-sm mr-2"
                                                                   ><img class="avatar-img rounded-circle" src="../assets/images/bird/${appointment.bird.image.imageURLName}" alt="User Image"
                                                                      /></a>
                                                                <a href="<c:url value="/View/Bird?birdID=${appointment.bird.birdID}"/>">${appointment.bird.birdFullname}</a>
                                                            </h2>
                                                        </td>
                                                        <td>${appointment.bird.breed}</td>
                                                        <td style="width:150px; max-width: 150px; white-space: nowrap;
                                                            overflow: hidden;
                                                            text-overflow: ellipsis">${appointment.service_.serviceName}</td>
                                                        <c:choose>
                                                            <c:when test="${appointment.appStatus =='processing'}">
                                                                <td><span class="badge badge-pill bg-warning-light">Processing</span></td>
                                                            </c:when>
                                                            <c:when test="${appointment.appStatus =='confirm'}">
                                                                <td><span class="badge badge-pill bg-success-light">Confirmed</span></td>
                                                            </c:when>
                                                            <c:when test="${appointment.appStatus =='check-in'}">
                                                                <td><span class="badge badge-pill bg-purple-light">Check In</span></td>
                                                            </c:when>
                                                            <c:when test="${appointment.appStatus =='complete'}">
                                                                <td><span class="badge badge-pill bg-primary-light">Completed</span></td>
                                                            </c:when>
                                                            <c:when test="${appointment.appStatus =='cancelled'}">
                                                                <td><span class="badge badge-pill bg-danger-light">Canceled</span></td>
                                                            </c:when>
                                                        </c:choose>

                                                        <td class="text-right">
                                                            <div class="table-action">
                                                                <a href="<c:url value="/View/Appointment?appointmentID=${appointment.appointmentID}"/>" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                            </div>
                                                        </td>
                                                        <td class="text-right">
                                                            <c:if test="${appointment.appStatus.equals('processing')}">
                                                                <div class="table-action">
                                                                    <a href="<c:url value="/Staff/Dashboard/Appointments/Update?appointmentID=${appointment.appointmentID}&action=update"/>" class="btn btn-sm bg-success-light"> <i class="fa fa-check"></i> Confirm </a>
                                                                </div>
                                                            </c:if>
                                                        </td>
                                                        <td class="text-right">
                                                            <c:if test="${appointment.appStatus.equals('processing')}">
                                                                <div class="table-action">
                                                                    <a href="<c:url value="/Staff/Dashboard/Appointments/Update?appointmentID=${appointment.appointmentID}&action=cancel"/>" class="btn btn-sm bg-danger-light"> <i class="fa fa-times"></i> Cancel </a>
                                                                </div>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- /Done Appointment Tab -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function updateFormAction() {
            var filterValue = document.querySelector('select[name="filter"]').value;
            var form = document.querySelector('form');
            var baseUrl = form.action.split('?')[0]; // Get the base URL without query parameters
            form.action = baseUrl + '?filter=' + encodeURIComponent(filterValue);
            form.submit();
        }
    </script>
</html>
