<%-- 
    Document   : booking-list
    Created on : Jun 20, 2023, 12:12:36 PM
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
            <section class="section section-doctor">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="section-header">
                                <h2>Book Our Doctor</h2>
                                <p>Certified Avian Practice</p>
                            </div>
                            <div class="about-content">
                                <p>
                                    BirdLovers Clinic, is home to Dr. Kiet, a Certified Avian Specialist offering 
                                    an exceptional level of veterinary care to all types of birds. We work with pet 
                                    owners, bird breeders, zoos and other facilities treating birds, from exotic 
                                    toucans and parrots, to cockatoos, parakeets, and more.
                                </p>
                                <p>
                                    We feature a state-of-the-art surgical center, ICU, specialized avian radiography, 
                                    anesthesia, endoscopy, boarding, in-house laboratory, and more. Schedule your appointment today.
                                </p>
                                <a class="btn" href="<c:url value="/Customer/prepareDatetime"/>">Book All</a>
                                <!--                                <a class="btn" href="javascript:;">Read More..</a>-->
                            </div>
                        </div>

                        <div class="col-lg-8">
                            <div class="row filter">						
                                <div class="form-group col-lg-6">
                                    <label>Specialty</label>
                                    <select class="form-control" id="specialty-selector">
                                        <option value="all">All</option>
                                        <c:forEach var="specs" items="${requestScope.specs}">
                                            <option value="${specs.specialityName}" style="text-transform: capitalize">${specs.specialityName}</option>
                                        </c:forEach>                                        
                                    </select>
                                </div>
                                <div class="doctor-slider slider"  id="doctors-container">


                                    <c:forEach items="${doctors}" var="doctor">
                                        <!-- Doctor Widget -->
                                        <div class="profile-widget ${doctor.speciality.specialityName}" data-specialty="${doctor.speciality.specialityName}">
                                            <div class="doc-img">   
                                                <a href="doctor-profile.jsp?doctorID=${doctor.userID}">
                                                    <img class="img-fluid" alt="User Image"
                                                         src="../images/doctors/${doctor.image.imageURLName}" style="height: 200px; object-fit: cover" />
                                                </a>
                                                <a href="javascript:void(0)" class="fav-btn">
                                                    <i class="far fa-bookmark"></i>
                                                </a>
                                            </div>
                                            <div class="pro-content">
                                                <h3 class="title">
                                                    <a href="doctor-profile.jsp?doctorID=${doctor.userID}">${doctor.fullName}</a>
                                                    <i class="fas fa-check-circle verified"></i>
                                                </h3>
                                                <p class="specialty" style="text-transform: capitalize">${doctor.speciality.specialityName}</p>
                                                <!--                                                <div class="rating">
                                                                                                    <i class="fas fa-star filled"></i>
                                                                                                    <i class="fas fa-star filled"></i>
                                                                                                    <i class="fas fa-star filled"></i>
                                                                                                    <i class="fas fa-star filled"></i>
                                                                                                    <i class="fas fa-star filled"></i>
                                                                                                    <span class="d-inline-block average-rating">(17)</span>
                                                                                                </div>
                                                                                                <ul class="available-info">
                                                                                                    <li><i class="fas fa-map-marker-alt"></i> Florida, USA</li>
                                                                                                    <li><i class="far fa-clock"></i> Available on Fri, 22 Mar</li>
                                                                                                    <li>
                                                                                                        <i class="far fa-money-bill-alt"></i> $300 - $1000
                                                                                                        <i class="fas fa-info-circle" data-toggle="tooltip"
                                                                                                           title="Lorem Ipsum"></i>
                                                                                                    </li>
                                                                                                </ul>-->
                                                <div class="row row-sm">
                                                    <div class="col-6">
                                                        <a href="<c:url value="/View/Doctor?userID=${doctor.userID}"/>" class="btn view-btn">View Profile</a>
                                                    </div>
                                                    <div class="col-6">
                                                        <a href="<c:url value="/Customer/prepareDatetime?doctorID=${doctor.userID}"/>" class="btn book-btn">Book Now</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Doctor Widget -->
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
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
