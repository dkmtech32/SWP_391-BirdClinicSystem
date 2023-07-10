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

        <div class="row">
            <div class="col-md-12">
                <h4 class="mb-4">Patient Appointment</h4>
                <div class="appointment-tab">
                    <!-- Appointment Tab -->
                    <div>
                        <a href="<c:url value="/Dashboard/Appointments?filter=upcoming"/>" >Upcoming</a>
                        <form action="<c:url value="/Dashboard/Appointments"/>" method="get">
                            <select onchange="updateFormAction()" name="filter">
                                <option value="">--</option>
                                <option value="processing">Processing</option>
                                <option value="confirm">Confirmed</option>
                                <option value="check-in">Checked-in</option>
                                <option value="cancelled">Canceled</option>
                                <option value="complete">Completed</option>
                            </select>
                        </form>
                        <a href="/Dashboard/Appointments?filter=complete" >Completed</a>
                    </div>
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
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="<c:url value="/View/Bird?birdID=${appointment.bird.birdID}"/>" class="avatar avatar-sm mr-2"
                                                                   ><img class="avatar-img rounded-circle" src="../assets/images/bird/${appointment.bird.image.imageURLName}" alt="User Image"
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
