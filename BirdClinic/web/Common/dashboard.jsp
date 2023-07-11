<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../Common/head.jsp"/>
    <body>
        <!-- Main Wrapper -->
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
                        <div class="col-md-4 col-lg-3 col-xl-2 theiaStickySidebar">
                            <div class="profile-sidebar">
                                <div class="widget-profile pro-widget-content">
                                    <div class="profile-info-widget">
                                        <a href="#" class="booking-doc-img">
                                            <c:if test="${service.currentUser.userRole=='customer'}">
                                                <img src="<c:url value='/assets/images/client/${service.currentUser.image.imageURLName}'/>" alt="User Image" />
                                            </c:if>
                                            <c:if test="${service.currentUser.userRole=='doctor'}">
                                                <img src="<c:url value='/assets/images/doctors/${service.currentUser.image.imageURLName}'/>" alt="User Image" />
                                            </c:if>
                                            <c:if test="${service.currentUser.userRole=='staff'}">
                                                <img src="<c:url value='/assets/images/${service.currentUser.image.imageURLName}'/>" alt="User Image" />
                                            </c:if>

                                        </a>
                                        <div class="profile-det-info">
                                            <h3>${service.currentUser.fullName}</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="dashboard-widget">
                                    <nav class="dashboard-menu">
                                        <ul>
                                            <li class="active">
                                                <c:if test="${service.currentUser.userRole!='staff'}">
                                                   <a href="<c:url value="/Dashboard/Appointments"/>">
                                                    <i class="fas fa-columns"></i>
                                                    <span>Dashboard</span>
                                                </a> 
                                                </c:if>
                                                <c:if test="${service.currentUser.userRole=='staff'}">
                                                   <a href="<c:url value="/Dashboard/Appointments?filter=processing"/>">
                                                    <i class="fas fa-columns"></i>
                                                    <span>Dashboard</span>
                                                </a> 
                                                </c:if>
                                                
                                            </li>
                                            <li>
                                                <a href="<c:url value="/Update/Profile"/>">
                                                    <i class="fas fa-user-cog"></i>
                                                    <span>Profile Settings</span>
                                                </a>
                                            </li>
                                            
                                            <c:if test="${service.currentUser.userRole=='customer'}">

                                                <li>
                                                    <a href="<c:url value="/Dashboard/Birds"/>">
                                                        <i class="fa-solid fa-dove"></i>                                                   
                                                        <span>Bird list</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                                
                                            <li>
                                                <a href="<c:url value="/Dashboard/Update/Password"/>">
                                                    <i class="fas fa-lock"></i>
                                                    <span>Change Password</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="<c:url value="/logout"/>">
                                                    <i class="fas fa-sign-out-alt"></i>
                                                    <span>Logout</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <!-- / Profile Sidebar -->
                        <jsp:include page="${url}"/>

                    </div>
                </div>
            </div>
            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include page="../Common/footer.jsp"/>
            <!-- /Footer -->
        </div>
        <!-- /Main Wrapper -->

        <!-- Script -->
        <jsp:include page="../Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
