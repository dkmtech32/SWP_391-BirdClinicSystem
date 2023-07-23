<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
                            <form class="nav-link" action="<c:url value="/Dashboard/Appointments"/>" name="filterForm" method="get">
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
                        <li class="nav-item">
                            <input class="nav-link" type="text" id="searchInput" placeholder="Search by customer name" onkeyup="filterTable()" />

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
                                                    <th>Service</th>
                                                    <th>Status</th>
                                                    <th>Doctor</th>
                                                    <c:if test="${param.filter.equals('check-in')}">
                                                    <th>Payment Method</th>
                                                    </c:if>
                                                    <c:if test="${param.filter.equals('complete')}">
                                                    <th>Rating</th>
                                                    </c:if>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach var="appointment" items="${requestScope.appointments}">

                                                <tr>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="<c:url value="/View/Customer?userID=${appointment.bird.customer.userID}"/>" class="avatar avatar-sm mr-2">
                                                                <img class="avatar-img rounded-circle" src="<c:url value="/images/customer/${appointment.bird.customer.image.imageURLName}"/>" alt="User Image" />
                                                            </a>
                                                            <a href="<c:url value="/View/Customer?userID=${appointment.bird.customer.userID}"/>">${appointment.bird.customer.fullName} </a> 
                                                        </h2>
                                                    </td>
                                                    <td>${appointment.appTime}<span class="d-block text-info">${appointment.timeslot.timeSlot}</span></td>

                                                    <td style="width:150px; max-width: 150px; white-space: nowrap;
                                                        overflow: hidden;
                                                        text-overflow: ellipsis">${appointment.service_.serviceName}
                                                    </td>
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

                                                    <td >
                                                        <c:if test="${appointment.appStatus =='processing'||appointment.appStatus =='confirm' }">
                                                            <select style="width: 200px; max-width: 200px" id="${appointment.appointmentID}" class="form-select" name="doctorID" onchange="changeDoctorSelection(this)">
                                                                <option value="">--</option>
                                                                <c:forEach var="doc" items="${docSpec[appointment.service_.speciality.specialityID]}">
                                                                    <option value="${doc.userID}"<c:if test="${not empty appointment.doctor && appointment.doctor.userID.equals(doc.userID)}"> selected</c:if> >${doc.fullName}</option>
                                                                </c:forEach>
                                                            </select>   
                                                        </c:if>
                                                        <c:if test="${appointment.appStatus !='processing' && appointment.appStatus !='confirm'}">
                                                            <h2  class="table-avatar">
                                                                <a href="doctor-profile.jsp" class="avatar avatar-sm mr-2">
                                                                    <img class="avatar-img rounded-circle" src="<c:url value="/images/doctors/${appointment.doctor.image.imageURLName}"/>" alt="User Image" />
                                                                </a>
                                                                <a style="width:100px; max-width: 100px; white-space: nowrap;
                                                                   overflow: hidden;" href="doctor-profile.jsp">${appointment.doctor.fullName} <span>${doctor.speciality.specialityName}</span></a> 
                                                            </h2>
                                                        </c:if>                                                            
                                                    </td>
                                                    <c:if test="${param.filter.equals('check-in')}">
                                                        <td>
                                                            <select style="width:200px; max-width: 200px; white-space: nowrap;
                                                                    overflow: hidden;" id="${appointment.payment}" class="form-select" name="payment" onchange="changePaymentSelection(this)" required>
                                                                <option value="">--</option>
                                                                <option value="cash">Cash</option>
                                                                <option value="banking account">Banking</option>
                                                                <option value="credit card">Credit Card</option>
                                                            </select>  
                                                        </td>
                                                    </c:if>
                                                    <td class="text-right">
                                                        <div class="table-action">
                                                            <a href="<c:url value="/View/Appointment?appointmentID=${appointment.appointmentID}"/>" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                        </div>
                                                    </td>

                                                    <c:if test="${appointment.appStatus.equals('processing')}">

                                                        <td class="text-right">
                                                            <div class="table-action">
                                                                <form  action="<c:url value="/Dashboard/Appointments/updateApp"/>" name="docForm" method="get">
                                                                    <input type="hidden" id="hidden${appointment.appointmentID}" name="doctorID" <c:if test="${not empty appointment.doctor}"> value="${appointment.doctor.userID}"</c:if> required>
                                                                        <input type="hidden"  name="action" value="update">
                                                                        <input type="hidden"  name="filter" value="confirm">
                                                                        <input type="hidden" class="appID" name="appointmentID" value="${appointment.appointmentID}">
                                                                    <button class=" btn btn-sm bg-success-light" type="submit">
                                                                        <i class="fa fa-check"></i>
                                                                        Confirm
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </td>
                                                        <td class="text-right">
                                                            <div class="table-action">
                                                                <a href="<c:url value="/Dashboard/Appointments/updateApp?appointmentID=${appointment.appointmentID}&action=cancel"/>" class="btn btn-sm bg-danger-light"> <i class="fa fa-times"></i> Cancel </a>
                                                            </div>
                                                        </td>
                                                    </c:if>

                                      <%--              <td  class="text-right">
                                                        <button class="btn btn-sm btn-info" onclick="showServiceAndDoctorInfo('${appointment.service_.serviceName}', '${appointment.doctor.fullName}')">View Info</button>
                                                    </td>--%>


                                                    <c:if test="${appointment.appStatus.equals('check-in')}">

                                                        <td class="text-right">
                                                            <%--   --%>
                                                            <a class="btn btn-primary" href="<c:url value="/View/Appointment?appointmentID=${appointment.appointmentID}"/>" ><i class="fa fa-check"></i> Checkout</a>
                                                        </td>
                                                    </c:if>

                                                    <c:if test="${appointment.appStatus.equals('confirm')}">
                                                        <td class="text-right">
                                                            <div class="table-action">
                                                                <a href="<c:url value="/Dashboard/Appointments/updateApp?appointmentID=${appointment.appointmentID}&action=update&filter=check-in"/>" class="btn btn-sm bg-warning-light"> <i class="fa fa-check"></i> Check-in </a>
                                                            </div>
                                                        </td>
                                                    </c:if>
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
<!-- Add this modal markup at the end of your JSP file -->
<!--<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="infoModalLabel">Service and Doctor Information</h5>

            </div>
            <div class="modal-body">
                 Placeholder elements to display service and doctor information 
                <div id="serviceInfo"></div>
                <div id="doctorInfo"></div>
            </div>

        </div>
    </div>
</div>-->

<script>
    function updateFormAction() {
        var filterValue = document.querySelector('select[name="filter"]').value;
        var form = document.querySelector('form[name="filterForm"]');
        var baseUrl = form.action.split('?')[0]; // Get the base URL without query parameters
        form.action = baseUrl + '?filter=' + encodeURIComponent(filterValue);
        form.submit();
    }
//        function updateDoctorAction() {
//            var form = document.forms["docForm"];
//            var appointmentID = form.elements["appointmentID"].value;
//            var doctorID = form.elements["doctorID"].value;
//
//            // Build the URL with the required parameters
//            var url = form.action + "?appointmentID=" + encodeURIComponent(appointmentID) +
//                    "&doctorID=" + encodeURIComponent(doctorID) +
//                    "&action=update";
//
//            // Redirect to the updated URL
//            window.location.href = url;
//
//            return false; // Prevents the default form submission
//        }
    function changeDoctorSelection(selectElement) {
        var selectedValue = selectElement.value;
        var appID = selectElement.id;
        console.log("hidden" + appID);
        document.getElementById("hidden" + appID).value = selectedValue;
    }

    function filterTable() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput");
        filter = toLowerCaseNonAccentVietnamese(input.value); // Convert the search input to lowercase without accents
        table = document.querySelector(".table.table-hover.table-center");
        tr = table.getElementsByTagName("tr");

        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0]; // Assuming the customer name is in the first column
            if (td) {
                txtValue = toLowerCaseNonAccentVietnamese(td.textContent || td.innerText); // Convert the customer name to lowercase without accents
                if (txtValue.indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

    function showServiceAndDoctorInfo(serviceName, doctorName) {
        // Set the service and doctor information in the modal
        document.getElementById("serviceInfo").innerText = "Service: " + serviceName;
        document.getElementById("doctorInfo").innerText = "Doctor: " + doctorName;

        // Show the modal
        $('#infoModal').modal('show');
    }
</script>
