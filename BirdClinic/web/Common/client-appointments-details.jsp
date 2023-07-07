<%-- 
    Document   : client-appoitments-details
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
            <jsp:include page="Common/header-guest.jsp"/>
            <!--/Header -->

            <!-- Breadcrumb -->
            <jsp:include page="Common/breadcrumb.jsp"/>
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
                        <jsp:include page="../Common/owner-feedback.jsp"/> <!-- chỉ hiện khi user đưa feedback rồi -->
                        <jsp:include page="../Common/payment-info.jsp"/>
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
