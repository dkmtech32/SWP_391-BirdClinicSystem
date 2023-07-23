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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3 col-lg-4 col-xl-5">
                        <div class="card">
                            <div class="card-body">
                                <div class="row form-row">
                                    <div class="col-6 col-md-3">
                                        <div class="form-group">
                                            <div class="change-avatar">
                                                <div class="profile-img">
                                                    <img src="<c:url value='../images/customer/${requestScope.customer.image.imageURLName}'/>" alt="User Image" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-5">
                                        <div class="form-group">
                                            <label>Full Name</label>
                                            <div class="form-control">${requestScope.customer.fullName}</div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4">
                                        <div class="form-group">
                                            <label>Date of Birth</label>
                                            <div class="cal-icon">
                                                <div class="form-control datetimepicker">${requestScope.customer.dob}</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-12">
                                        <div class="form-group">
                                            <label>Address</label>
                                            <div class="form-control">${requestScope.customer.customerAddress}</div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <div class="form-control">${requestScope.customer.email}</div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Mobile</label>
                                            <div class="form-control">${requestScope.customer.phoneNumber}</div> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-table mb-0">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover table-center mb-0" >
                                        <thead class="table-dark">
                                            <tr>
                                                <th>Appointment Date</th>
                                                <th>Bird</th>
                                                <th>Service</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="appointment" items="${requestScope.appointments}">
                                                <tr>
                                                    
                                                    <td>${appointment.appTime}<span class="d-block text-info">${appointment.timeslot.timeSlot}</span></td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="<c:url value="/View/Bird?birdID=${appointment.bird.birdID}"/>" class="avatar avatar-sm mr-2"
                                                               ><img class="avatar-img rounded-circle" src="../images/bird/${appointment.bird.image.imageURLName}" alt="User Image"
                                                                  /></a>
                                                            <a href="<c:url value="/View/Bird?birdID=${appointment.bird.birdID}"/>">${appointment.bird.birdFullname}</a>
                                                        </h2>
                                                    </td>
                                                    <td>${appointment.service_.serviceName}</td>
                                                    <c:choose>
                                                        <c:when test="${appointment.appStatus =='processing'}">
                                                            <td><span class="badge badge-pill bg-warning-light">Processing</span></td>
                                                        </c:when>
                                                        <c:when test="${appointment.appStatus =='confirm'}">
                                                            <td><span class="badge badge-pill bg-success-light">Confirmed</span></td>
                                                        </c:when>
                                                        <c:when test="${appointment.appStatus =='check-in'}">
                                                            <td><span class="badge badge-pill bg-purple-light">Check In</span></td>
                                                        </c:when>
                                                        <c:when test="${appointment.appStatus =='complete'}">
                                                            <td><span class="badge badge-pill bg-primary-light">Completed</span></td>
                                                        </c:when>
                                                        <c:when test="${appointment.appStatus =='cancelled'}">
                                                            <td><span class="badge badge-pill bg-danger-light">Canceled</span></td>
                                                        </c:when>
                                                    </c:choose>
                                                    

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 col-lg-8 col-xl-7">
                        <div class="row">
                            <c:forEach var="bird" items="${requestScope.birds}">
                                <div class="card col-md-6">
                                    <div class="card-body">
                                        <div class="row bird-info">

                                            <div class="widget-profile pro-widget-content">
                                                <div class="profile-info-widget">
                                                    <a href="#" class="booking-doc-img">
                                                        <img src="<c:url value='../images/bird/${bird.image.imageURLName}'/>" alt="User Image">
                                                    </a>
                                                    <div class="profile-det-info">
                                                        <h3>${bird.birdFullname}</h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row bird-information-boxes">
                                                <!--                <div class="col-12 col-md-6">
                                                                    <p class="header">Bird's name</p>
                                                                    <p class="information"></p>
                                                                </div>-->
                                                <div class="col-12 col-md-12">
                                                    <p class="title">Hatching Day: </p>
                                                    <p class="information">${bird.hatchingDate}</p>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <p class="title">Breed: </p>
                                                    <p class="information">${bird.breed}</p>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <p class="title">Sex: </p>  
                                                    <p class="information">${bird.birdGender}</p>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <p class="title">Weight: </p>
                                                    <p class="information">${bird.birdWeight}</p>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <p class="title">Microchip: </p>  
                                                    <p class="information">${bird.band_Chip}</p>
                                                </div>
                                                <!--                            <div class="col-12 col-md-6">
                                                                                <p>Sex Method</p>
                                                                                <p class="information"></p>
                                                                            </div>-->
                                                <div class="col-12 col-md-6">
                                                    <p class="title">Feather Color: </p>
                                                    <p class="information">${bird.featherColor}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
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
