<%-- 
    Document   : admin-home-page-accounts
    Created on : Jul 11, 2023, 10:16:16 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../Admin/head-admin.jsp"/>

    <body>
        <jsp:include page="../Admin/loader.jsp"/>

        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="../Admin/sidebar.jsp"/>
            <!-- sidebar-wrapper  -->

            <main class="page-content bg-light">
                <jsp:include page="../Admin/admin-dropdown-menu.jsp"/>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="chart-tab-container">
                            <div class="chart-tab">
                                <div class="col-md-12">
                                    <nav class="user-tabs">
                                        <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                            <li class="nav-item">
                                                <a class="nav-link 
                                                   <c:if test="${empty param.filter}">
                                                       active
                                                   </c:if>
                                                   " href="<c:url value="/Admin/Accounts"/>" >All
                                                </a>
                                            </li>

                                            <li class="nav-item">
                                                <a class="nav-link <c:if test="${param.filter.equals('doctor')}">active</c:if>" href="<c:url value="/Admin/Accounts?filter=doctor"/>">Doctors</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link <c:if test="${param.filter.equals('staff')}">active</c:if>" href="<c:url value="/Admin/Accounts?filter=staff"/>">Staff</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link <c:if test="${param.filter.equals('customer')}">active</c:if>" href="<c:url value="/Admin/Accounts?filter=customer"/>" >Customers</a>
                                                </li>
                                            </ul>
                                        </nav>
                                        <div class="tab-content pt-0">
                                            <!-- Appointment Tab -->
                                            <div id="" class="tab-pane fade show active">
                                                <div class="card card-table mb-0">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="table table-hover table-center mb-0">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 20rem;">User's Image</th>
                                                                        <th></th>
                                                                        <th style="width: 20rem;">User's Full Name</th>
                                                                        <th></th>
                                                                        <th style="width: 20rem;">Email</th>
                                                                        <th></th>
                                                                        <th style="width: 20rem;">Role</th> 
                                                                        <th></th>                                 
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                <c:forEach items="${accounts}" var="user">
                                                                    <tr>
                                                                        <td>
                                                                            <c:choose>
                                                                                <c:when test="${user.userRole=='customer'}" >
                                                                                    <h2 class="table-avatar">
                                                                                        <a href="<c:url value="/View/Customer?userID=${user.userID}"/>" class="avatar avatar-sm mr-2">
                                                                                            <img class="avatar-img rounded-circle" style="object-fit: cover; width: 4rem; height: 4rem;" src="<c:url value="/images/customer/${user.image.imageURLName}"/>" alt="User Image" />
                                                                                        </a>
                                                                                    </h2>
                                                                                </c:when>
                                                                                <c:when test="${user.userRole=='doctor'}" >
                                                                                    <h2 class="table-avatar">
                                                                                        <a href="<c:url value="/View/Doctor?userID=${user.userID}"/>" class="avatar avatar-sm mr-2">
                                                                                            <img class="avatar-img rounded-circle" style="object-fit: cover; width: 4rem; height: 4rem;" src="<c:url value="/images/doctors/${user.image.imageURLName}"/>" alt="User Image" />
                                                                                        </a>
                                                                                    </h2>
                                                                                </c:when>
                                                                                <c:when test="${user.userRole=='staff'||user.userRole=='admin'}" >
                                                                                    <h2 class="table-avatar">
                                                                                        <a class="avatar avatar-sm mr-2" href="<c:url value="/Admin/staff-profile.jsp"/>">
                                                                                            <img class="avatar-img rounded-circle" style="object-fit: cover; width: 4rem; height: 4rem;" src="<c:url value="/images/${user.image.imageURLName}"/>" alt="User Image" />
                                                                                        </a>    
                                                                                    </h2>
                                                                                </c:when>

                                                                            </c:choose>

                                                                        </td>                                    
                                                                        <td></td>
                                                                        <td>${user.fullName}</td>
                                                                        <td></td>
                                                                        <td>${user.email}</td>
                                                                        <td></td>
                                                                        <td>${user.displayRole}</td>
                                                                        <td>
                                                                            <c:choose>
                                                                                <c:when test="${user.userRole =='doctor'}">
                                                                                    <a href="<c:url value="/View/Doctor?userID=${user.userID}"/>" class="btn btn-danger" style="width:103.8px">View</a>
                                                                                </c:when>
                                                                                <c:when test="${user.userRole =='customer'}">
                                                                                    <a href="<c:url value="/View/Customer?userID=${user.userID}"/>" class="btn btn-danger" style="width:103.8px">View</a>
                                                                                </c:when>
                                                                            </c:choose>
                                                                        </td>
                                                                        <td>
                                                                            <div class="table-action">
                                                                                <c:choose>
                                                                                    <c:when test="${user.status_&& user.userRole!='admin'}">
                                                                                        <a href="<c:url value="/Admin/Accounts/Toggle?userID=${user.userID}"/>" class="btn btn-danger" style="width:103.8px">Ban</a>
                                                                                    </c:when> 
                                                                                    <c:when test="${!user.status_}">
                                                                                        <a href="<c:url value="/Admin/Accounts/Toggle?userID=${user.userID}"/>" class="btn btn-success">Activate</a>
                                                                                    </c:when>
                                                                                </c:choose>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end row-->
                    </div>
                    <!--end container-->
                </div>
                <!-- End -->
                <!--End page-content" -->
            </main>
        </div>

        <!-- Script -->
        <jsp:include page="../Admin/script-admin.jsp"/>
        <!-- /Script -->
    </body>
</html>
