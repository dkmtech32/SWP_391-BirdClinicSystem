<%-- 
    Document   : owner-info
    Created on : Jul 7, 2023, 8:23:17 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <body>
        <div class="col-md-6 col-lg-7 col-xl-8">
            <div class="card">
                <div class="card-body">
                    <div class="row form-row">
                        <div class="col-6 col-md-6">
                            <div class="form-group">
                                <div class="change-avatar">
                                    <div class="profile-img">
                                        <img src="<c:url value='/images/customer/${appointment.bird.customer.image.imageURLName}'/>" alt="User Image" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Full Name</label>
                                <div class="form-control">${appointment.bird.customer.fullName}</div>
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Date of Birth</label>
                                <div class="cal-icon">
                                    <div class="form-control datetimepicker">${appointment.bird.customer.dob}</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Address</label>
                                <div class="form-control">${appointment.bird.customer.customerAddress}</div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Email</label>
                                <div class="form-control">${appointment.bird.customer.email}</div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Mobile</label>
                                <div class="form-control">${appointment.bird.customer.phoneNumber}</div> 
                            </div>
                        </div>


                    </div>
                    <c:if test="${sessionScope.service.currentUser.userRole=='staff' && appointment.appStatus=='complete'}">
                        <form class="row" style="justify-content: center;">
                            <label>Re-examination</label>
                            <select name="serviceID" id="serviceSelect">
                                <option value="">-</option>
                                <c:forEach var="service" items="${services}">
                                    <option value="${service.serviceID}" id="${service.speciality.specialityID}">${service.serviceName}</option>
                                </c:forEach>
                            </select>
                            <select name="doctorID" id="doctorSelect" >
                                <option value="" style="display: none">-</option>
                                <c:forEach var="doc" items="${doctors}">
                                    <option style="display: none" value="${doc.userID}" data-specialityid="${doc.speciality.specialityID}">${doc.fullName}</option>
                                </c:forEach>
                            </select>
                            <input name="appID" style="display: none" value="${appointment.appointmentID}"/>
                            <button class="btn btn-primary" type="submit">Retake</button>
                        </form>
                        <script>
                            const serviceSelect = document.getElementById('serviceSelect');
                            const doctorSelect = document.getElementById('doctorSelect');
                            const allDoctors = Array.from(doctorSelect.options);

                            serviceSelect.addEventListener('change', (event) => {
                                const selectedSpecialityID = event.target.selectedOptions[0].id;
                                if (!selectedSpecialityID) {
                                    // If no service is selected, disable the doctor select element
                                    doctorSelect.disabled = true;
                                    // Reset doctor selection to the default option
                                    doctorSelect.value = '';
                                } else {
                                    // Enable the doctor select element
                                    doctorSelect.disabled = false;
                                    // Filter doctors based on the selected service's specialityID
                                    allDoctors.forEach(option => {
                                        const doctorSpecialityID = option.getAttribute('data-specialityid');
                                        if (doctorSpecialityID === selectedSpecialityID) {
                                            option.style.display = 'block';
                                        } else {
                                            option.style.display = 'none';
                                        }
                                    });
                                }
                            });
                        </script>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>
