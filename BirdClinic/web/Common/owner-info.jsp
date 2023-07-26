<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Owner Info</title>
        <!-- Add Bootstrap CSS link here -->

    </head>
    <body>

        <div class="col-md-6 col-lg-5 col-xl-7">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 col-md-3">
                            <div class="form-group">
                                <div class="change-avatar">
                                    <div class="profile-img">
                                        <img src="<c:url value='/images/customer/${appointment.bird.customer.image.imageURLName}'/>" alt="User Image" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-9">
                            <div class="form-group">
                                <label for="addressInput">Address</label>
                                <input type="text" class="form-control" id="addressInput" value="${appointment.bird.customer.customerAddress}" readonly>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label for="fullNameInput">Full Name</label>
                                <input type="text" class="form-control" id="fullNameInput" value="${appointment.bird.customer.fullName}" readonly>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label for="dobInput">Date of Birth</label>
                                <div class="cal-icon">
                                    <input type="text" class="form-control" id="dobInput" value="${appointment.bird.customer.dob}" readonly>
                                </div>
                            </div>
                        </div>


                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label for="emailInput">Email</label>
                                <input type="email" class="form-control" id="emailInput" value="${appointment.bird.customer.email}" readonly>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label for="mobileInput">Mobile</label>
                                <input type="tel" class="form-control" id="mobileInput" value="${appointment.bird.customer.phoneNumber}" readonly>
                            </div>
                        </div>

                    </div>
                    <c:if test="${sessionScope.service.currentUser.userRole=='staff' && appointment.appStatus=='complete'}">

                    </c:if>

                </div>
            </div>
        </div>



    </body>
</html>
