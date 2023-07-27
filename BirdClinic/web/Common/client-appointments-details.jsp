<%-- 
    Document   : client-appointments-details
    Created on : Jun 25, 2023, 9:53:59 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../Common/head.jsp"/>
    <link rel="stylesheet" href="../assets/css/print.css">
    <body>
        <div class="main-wrapper">
            <!-- Header -->
            <jsp:include page="../Common/header.jsp"/>
            <!--/Header -->

            <!-- Breadcrumb -->
            <jsp:include page="../Common/breadcrumb.jsp"/>

            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">
                    <c:if test="${appointment.appStatus=='complete'}">
                        <div class="col-12 text-right mb-3">
                            <button class="btn btn-primary print-btn" onclick="printPage()">
                                <i class="fa fa-print"></i> Print
                            </button>
                            <c:if test="${service.currentUser.userRole=='staff'}">
                                <button class="btn btn-secondary re-examination" data-toggle="modal" data-target="#formPopup">
                                    Re-examination
                                </button>
                            </c:if>
                        </div>
                    </c:if>

                    <div class="row">
                        <!-- Profile Sidebar -->
                        <jsp:include page="../Common/bird-general-info.jsp"/>
                        <!-- /Profile Sidebar -->

                        <!-- Profile Settings Form -->
                        <jsp:include page="../Common/owner-info.jsp"/>
                        <!-- /Profile Settings Form -->
                    </div>
                    <div class="prescription">
                        <div class="row">
                            <jsp:include page="../Common/appointment-general-info.jsp"/>
                            <jsp:include page="../Common/appointment-medicine-list.jsp"/>                       
                        </div>

                        <div class="container-fluid mt-4">
                            <div class="row">

                                <c:if test="${requestScope.appointment.bird.customer.userID.equals(sessionScope.service.currentUser.userID)&& empty requestScope.feedback && requestScope.appointment.appStatus.equals('complete')}">
                                    <jsp:include page="../Customer/give-feedback.jsp"/>
                                </c:if>

                                <c:if test="${not empty requestScope.feedback}">
                                    <jsp:include page="../Common/owner-feedback.jsp"/>  
                                </c:if>

                                <div class="col-md-6 ">
                                    <div class="card">
                                        <div class="card-body">
                                            <h2>Payment</h2>
                                            <div class="payment-method">
                                                <h4>Payment Method</h4> 
                                                <div class="form-control w-50" name="payment">
                                                    <p style="padding-top: 0.4rem">${appointment.payment}</p>
                                                </div>
                                            </div>
                                            <div class="booking-item-wrap-in-appointments-details">
                                                <ul class="booking-fee-in-appointments-details">
                                                    <li>Service Fee 
                                                        <c:set var="totalServicePrice" value="0" />
                                                        <c:forEach var="service" items="${appointment.service_}" >
                                                            <c:set var="totalServicePrice" value="${totalServicePrice + service.servicePrice}" />
                                                        </c:forEach>
                                                        <span class="total-cost-in-appointments-details">$${totalServicePrice}</span>
                                                    </li>                        
                                                    <li>Booking Fee <span class="total-cost-in-appointments-details">$10</span></li>
                                                    <li>Medicine Fee 
                                                        <c:set var="totalMedPrice" value="0" />
                                                        <c:forEach var="med" items="${recordMedicines}">
                                                            <c:set var="medPrice" value="${med.quantity * med.medicine.medicinePrice}" />
                                                            <c:set var="totalMedPrice" value="${totalMedPrice + medPrice}" />
                                                        </c:forEach>
                                                        <c:set var="totalPrice" value="${totalServicePrice + totalMedPrice + 10}"/>
                                                        <span class="total-cost-in-appointments-details">$${totalMedPrice}</span>

                                                    </li>

                                                </ul>
                                                <div class="booking-total-in-appointments-details">
                                                    <ul class="booking-total-list-in-appointments-details">
                                                        <li>
                                                            <span>Total</span>
                                                            <c:if test="${appointment.totalPrice==0 ||empty appointment.totalPrice}">
                                                                <span class="total-cost-in-appointments-details">$${totalPrice}</span>
                                                            </c:if>
                                                            <c:if test="${appointment.totalPrice!=0 && not empty appointment.totalPrice}">
                                                                <span class="total-cost-in-appointments-details">$ ${appointment.totalPrice}</span>
                                                            </c:if>


                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:if test="${requestScope.appointment.appStatus=='prescribed' && sessionScope.service.currentUser.userRole=='staff'}">


                            <select style="width:200px; max-width: 200px; white-space: nowrap;
                                    overflow: hidden;" id="${appointment.payment}" class="form-select" name="payment" onchange="changePaymentSelection(this)" required>
                                <option value="">--</option>
                                <option value="Cash">Cash</option>
                                <option value="Bank Transfer">Bank Transfer</option>
                                <option value="Credit/Debit card">Credit/Debit card</option>
                            </select>  


                            <form action="<c:url value="/Dashboard/Appointments/updateApp"/>" name="docForm" method="get">
                                <input type="hidden" id="hidden${appointment.payment}" name="payment" <c:if test="${not empty appointment.payment}"> value="${appointment.payment}"</c:if> required/>
                                    <input type="hidden"  name="action" value="update"/>
                                    <input type="hidden"  name="filter" value="complete"/>
                                    <input type="hidden"  name="totalPrice" value="${totalPrice}"/>
                                <input type="hidden" class="appID" name="appointmentID" value="${appointment.appointmentID}"/>
                                <button class=" btn btn-sm bg-success-light" type="submit">
                                    <i class="fa fa-check"></i>
                                    Check-out
                                </button>
                            </form> 
                        </c:if>
                    </div>
                </div>
            </div>
            <!-- /Page Content -->

            <!-- Add modal markup -->
            <!-- Add modal markup -->
            <div class="modal fade" id="formPopup" tabindex="-1" role="dialog" aria-labelledby="formPopupLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="formPopupLabel">Re-examination</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form class="re-examination" style="justify-content: center;" action="<c:url value="/Staff/prepareDatetime"/>">
                                <div class="col-12 text-center">
                                    <label for="serviceSelect">Select a Service</label>
                                    <select class="form-control" id="serviceSelect" name="serviceID">
                                        <option value="">-</option>
                                        <c:forEach var="service" items="${services}">
                                            <option value="${service.serviceID}" id="${service.speciality.specialityID}">${service.serviceName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-12 text-center mt-2">
                                    <label for="doctorSelect">Select a Doctor</label>
                                    <select class="form-control" id="doctorSelect" name="doctorID">
                                        <option value="" style="display: none">-</option>
                                        <c:forEach var="doc" items="${doctors}">
                                            <option style="display: none" value="${doc.userID}" data-specialityid="${doc.speciality.specialityID}">${doc.fullName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-12 text-center mt-2">
                                    <input name="appointmentID" style="display: none" value="${appointment.appointmentID}"/>
                                    <button class="btn btn-primary" type="submit">Retake</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End of modal markup -->

            <!-- Footer -->
            <jsp:include page="../Common/footer.jsp"/>
            <!-- /Footer -->

        </div>
        <script>
            function changePaymentSelection(selectElement) {
                var selectedValue = selectElement.value;
                var payment = selectElement.id;
                console.log("hidden" + payment);
                document.getElementById("hidden" + payment).value = selectedValue;
            }

            function printPage() {
                window.print();
            }

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
            var totalPrice = 0;
            var medPrices = document.getElementsByName("medPrice");
            for (var i = 0; i < medPrices.length; i++) {
                totalPrice += parseInt(medPrices[i].textContent);
            }
            document.getElementById("medicineFee").textContent = totalPrice;
        </script>
        <jsp:include page="../Common/script.jsp"/>

    </body>
</html>
