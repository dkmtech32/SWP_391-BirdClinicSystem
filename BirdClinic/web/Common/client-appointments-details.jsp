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
                        <div class="col-md-12">
                            <table class="table table-bordered" >
                                <h2>General Information</h2>
                                <thead>
                                    <tr>
                                        <th>Date of diagnosis</th>
                                        <th>Appointment Time</th>
                                        <th>Service</th>
                                        <th>Owner's Note</th>
                                        <th>Diagnosis</th>
                                        <th>Doctor's Note</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr >
                                        <td>${appointment.appTime}</td>
                                        <td>${medicalRecord.recordTime}</td>
                                        <td>${appointment.service_.serviceName}</td>
                                        <td style="word-wrap: break-word; max-width: 300px;">${appointment.notes}</td> <!-- chưa có -->
                                        <td>${medicalRecord.diagnosis}</td>
                                        <td style="word-wrap: break-word; max-width: 300px;">${medicalRecord.doctorNotes}</td>  <!-- chưa có -->                    
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-bordered" >
                                <h2>Medicines</h2>
                                <thead>
                                    <tr>
                                        <th>Medicine</th>
                                        <th>Quantity</th>
                                        <!--                    <th>Unit</th>-->
                                        <th>Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="med" items="${recordMedicines}">
                                        <tr>
                                            <td>${med.medicine.medicineName}</td>
                                            <td>${med.quantity} (${med.medicine.unit})</td>
                                            <!--                    <td></td>  chưa có, này nghĩa là đơn vị (2 viên, 2 gram, vv) -->
                                            <td>${med.description}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>                       
                        </div>
                       
                    </div>
                </div>
            </div>
            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include page="../Common/footer.jsp"/>
            <!-- /Footer -->
        </div>
    </div>
</div>
<jsp:include page="../Common/script.jsp"/>
</body>
</html>
