<%-- 
    Document   : client-appointments-details-feedback
    Created on : Jul 7, 2023, 10:53:24 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                            <jsp:include page="../Common/appointment-general-info.jsp"/>
                            <jsp:include page="../Common/appointment-medicine-list.jsp"/>
                        </div>
                        <jsp:include page="../Customer/give-feedback.jsp"/>
                        <jsp:include page="../Common/payment-info.jsp"/>
                        <div class="table-action-staff">
                            <button class="btn btn-sm bg-success-light"> <i class="fas fa-check"></i> Confirm </button> <!-- nhấn xong cập nhật feedback & rating -->
                        </div>                
                    </div>
                </div>
            </div>
            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include page="../Common/footer.jsp"/>
            <!-- /Footer -->
        </div>
            <jsp:include page="../Common/script.jsp"/>
    </body>
</html>

