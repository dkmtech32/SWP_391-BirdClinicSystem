<%-- 
    Document   : client-appointments-details-for-doctor-today
    Created on : Jul 7, 2023, 10:27:05 AM
    Author     : ASUS
--%>

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
                        <jsp:include page="../Common/appointment-general-info.jsp"/>
                    </div>
                    <button onclick="" class="btn btn-dark d-flex justify-content-center mx-auto mt-2">
                        <a href="add-prescription.jsp" class="prescription-submit"> <i class="fa fa-flask"></i>Prescribe</a>
                    </button>
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
