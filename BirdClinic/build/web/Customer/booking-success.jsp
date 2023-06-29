<%-- 
    Document   : bookInfo-all
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="Common/head.jsp"/>
    <body>
        <!-- Main Wrapper -->
        <div class="main-wrapper">
            <!-- Header -->
            <jsp:include page="Common/header-guest.jsp"/>
            <!--/Header -->

            <!-- Breadcrumb -->
            <jsp:include page="Common/breadcrumb.jsp"/>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content success-page-cont">
                <div class="container-fluid">
                    <div class="row justify-content-center">
                        <div class="col-lg-6">
                            <!-- Success Card -->
                            <div class="card success-card">
                                <div class="card-body">
                                    <div class="success-cont">
                                        <i class="fas fa-check"></i>
                                        <h3>Appointment booked Successfully!</h3>
                                        <p>
                                            Appointment booked with <strong>Dr. ABC</strong><br />
                                            on <strong>12 June 2023 10:00AM to 11:00AM</strong>
                                        </p>
                                        <a href="patient-dashboard.jsp" class="btn btn-primary view-inv-btn">View appointments</a>
                                    </div>
                                </div>
                            </div>
                            <!-- /Success Card -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include page="Common/footer.jsp"/>
            <!-- /Footer -->
        </div>
        <!-- /Main Wrapper -->

        <!-- Script -->
        <jsp:include page="Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
