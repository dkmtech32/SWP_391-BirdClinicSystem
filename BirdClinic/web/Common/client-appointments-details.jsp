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

                                <jsp:include page="../Common/payment-info.jsp"/> 
                            </div>
                        </div>
                        <c:if test="${requestScope.appointment.appStatus=='check-in' && sessionScope.service.currentUser.userRole=='staff'}">


                            <select style="width:200px; max-width: 200px; white-space: nowrap;
                                    overflow: hidden;" id="${appointment.payment}" class="form-select" name="payment" onchange="changePaymentSelection(this)" required>
                                <option value="">--</option>
                                <option value="cash">Cash</option>
                                <option value="banking account">Banking</option>
                                <option value="credit card">Credit Card</option>
                            </select>  


                            <form action="<c:url value="/Dashboard/Appointments/updateApp"/>" name="docForm" method="get">
                                <input type="hidden" id="hidden${appointment.payment}" name="payment" <c:if test="${not empty appointment.payment}"> value="${appointment.payment}"</c:if> required>
                                    <input type="hidden"  name="action" value="update">
                                    <input type="hidden"  name="filter" value="complete">
                                    <input type="hidden" class="appID" name="appointmentID" value="${appointment.appointmentID}">
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
        </script>
        <jsp:include page="../Common/script.jsp"/>

    </body>
</html>
