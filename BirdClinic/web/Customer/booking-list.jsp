<%-- 
    Document   : booking-list
    Created on : Jun 20, 2023, 12:12:36 PM
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
            <section class="section section-doctor">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="section-header">
                                <h2>Book Our Doctor</h2>
                                <p>Lorem Ipsum is simply dummy text</p>
                            </div>
                            <div class="about-content">
                                <p>
                                    It is a long established fact that a reader will be distracted by the readable content
                                    of a page when looking at its layout. The
                                    point of using Lorem Ipsum.
                                </p>
                                <p>
                                    web page editors now use Lorem Ipsum as their default model text, and a search for
                                    'lorem ipsum' will uncover many web sites still
                                    in their infancy. Various versions have evolved over the years, sometimes
                                </p>
                                <a class="btn" onclick="location.href='booking.jsp?doctor=all'">Book All</a>
                                <a class="btn" href="javascript:;">Read More..</a>
                            </div>
                        </div>

                        <div class="col-lg-8">
                            <div class="row filter">						
                                <div class="form-group col-lg-6">
                                    <label>Specialty</label>
                                    <select class="form-control" id="specialty-selector">
                                        <option value="all">All</option>
                                        <option value="general">General</option>
                                        <option value="surgery">Surgery</option>
                                        <option value="imaging">Imaging</option>
                                        <option value="nutrition">Nutrition</option>
                                        <option value="genetics">Genetics</option>
                                    </select>
                                </div>
                                <div class="doctor-slider slider" id="doctors-container">

                                    <!-- Doctor Widget -->
                                    <div class="profile-widget nutrition" data-specialty="nutrition">
                                        <div class="doc-img">
                                            <a href="doctor-profile.jsp">
                                                <img class="img-fluid" alt="User Image"
                                                     src="assets/img/doctors/doctor-01.jpg" />
                                            </a>
                                            <a href="javascript:void(0)" class="fav-btn">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </div>
                                        <div class="pro-content">
                                            <h3 class="title">
                                                <a href="doctor-profile.jsp">Ruby Perrin</a>
                                                <i class="fas fa-check-circle verified"></i>
                                            </h3>
                                            <p class="specialty">Nutrition</p>
                                            <div class="rating">
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
                                            </ul>
                                            <div class="row row-sm">
                                                <div class="col-6">
                                                    <a href="doctor-profile.jsp" class="btn view-btn">View Profile</a>
                                                </div>
                                                <div class="col-6">
                                                    <a onclick="location.href='booking.jsp?doctor=doc'" class="btn book-btn">Book Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Doctor Widget -->

                                    <!-- Doctor Widget -->
                                    <div class="profile-widget general" data-specialty="general">
                                        <div class="doc-img">
                                            <a href="doctor-profile.jsp">
                                                <img class="img-fluid" alt="User Image"
                                                     src="assets/img/doctors/doctor-02.jpg" />
                                            </a>
                                            <a href="javascript:void(0)" class="fav-btn">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </div>
                                        <div class="pro-content">
                                            <h3 class="title">
                                                <a href="doctor-profile.jsp">Darren Elder</a>
                                                <i class="fas fa-check-circle verified"></i>
                                            </h3>
                                            <p class="specialty">General</p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">(35)</span>
                                            </div>
                                            <ul class="available-info">
                                                <li><i class="fas fa-map-marker-alt"></i> Newyork, USA</li>
                                                <li><i class="far fa-clock"></i> Available on Fri, 22 Mar</li>
                                                <li>
                                                    <i class="far fa-money-bill-alt"></i> $50 - $300
                                                    <i class="fas fa-info-circle" data-toggle="tooltip"
                                                       title="Lorem Ipsum"></i>
                                                </li>
                                            </ul>
                                            <div class="row row-sm">
                                                <div class="col-6">
                                                    <a href="doctor-profile.jsp" class="btn view-btn">View Profile</a>
                                                </div>
                                                <div class="col-6">
<a onclick="location.href='booking.jsp?doctor=doc'" class="btn book-btn">Book Now</a>                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Doctor Widget -->

                                    <!-- Doctor Widget -->
                                    <div class="profile-widget genetics" data-specialty="genetics">
                                        <div class="doc-img">
                                            <a href="doctor-profile.jsp">
                                                <img class="img-fluid" alt="User Image"
                                                     src="assets/img/doctors/doctor-03.jpg" />
                                            </a>
                                            <a href="javascript:void(0)" class="fav-btn">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </div>
                                        <div class="pro-content">
                                            <h3 class="title">
                                                <a href="doctor-profile.jsp">Deborah Angel</a>
                                                <i class="fas fa-check-circle verified"></i>
                                            </h3>
                                            <p class="specialty">Genetics</p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">(27)</span>
                                            </div>
                                            <ul class="available-info">
                                                <li><i class="fas fa-map-marker-alt"></i> Georgia, USA</li>
                                                <li><i class="far fa-clock"></i> Available on Fri, 22 Mar</li>
                                                <li>
                                                    <i class="far fa-money-bill-alt"></i> $100 - $400
                                                    <i class="fas fa-info-circle" data-toggle="tooltip"
                                                       title="Lorem Ipsum"></i>
                                                </li>
                                            </ul>
                                            <div class="row row-sm">
                                                <div class="col-6">
                                                    <a href="doctor-profile.jsp" class="btn view-btn">View Profile</a>
                                                </div>
                                                <div class="col-6">
                                                    <a onclick="location.href='booking.jsp?doctor=doc'" class="btn book-btn">Book Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Doctor Widget -->

                                    <!-- Doctor Widget -->
                                    <div class="profile-widget surgery" data-specialty="surgery">
                                        <div class="doc-img">
                                            <a href="doctor-profile.jsp">
                                                <img class="img-fluid" alt="User Image"
                                                     src="assets/img/doctors/doctor-04.jpg" />
                                            </a>
                                            <a href="javascript:void(0)" class="fav-btn">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </div>
                                        <div class="pro-content">
                                            <h3 class="title">
                                                <a href="doctor-profile.jsp">Sofia Brient</a>
                                                <i class="fas fa-check-circle verified"></i>
                                            </h3>
                                            <p class="specialty">Surgery</p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">(4)</span>
                                            </div>
                                            <ul class="available-info">
                                                <li><i class="fas fa-map-marker-alt"></i> Louisiana, USA</li>
                                                <li><i class="far fa-clock"></i> Available on Fri, 22 Mar</li>
                                                <li>
                                                    <i class="far fa-money-bill-alt"></i> $150 - $250
                                                    <i class="fas fa-info-circle" data-toggle="tooltip"
                                                       title="Lorem Ipsum"></i>
                                                </li>
                                            </ul>
                                            <div class="row row-sm">
                                                <div class="col-6">
                                                    <a href="doctor-profile.jsp" class="btn view-btn">View Profile</a>
                                                </div>
                                                <div class="col-6">
                                                    <a onclick="location.href='booking.jsp?doctor=doc'" class="btn book-btn">Book Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Doctor Widget -->

                                    <!-- Doctor Widget -->
                                    <div class="profile-widget nutrition" data-specialty="nutrition">
                                        <div class="doc-img">
                                            <a href="doctor-profile.jsp">
                                                <img class="img-fluid" alt="User Image"
                                                     src="assets/img/doctors/doctor-05.jpg" />
                                            </a>
                                            <a href="javascript:void(0)" class="fav-btn">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </div>
                                        <div class="pro-content">
                                            <h3 class="title">
                                                <a href="doctor-profile.jsp">Marvin Campbell</a>
                                                <i class="fas fa-check-circle verified"></i>
                                            </h3>
                                            <p class="specialty">Nutrition</p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">(66)</span>
                                            </div>
                                            <ul class="available-info">
                                                <li><i class="fas fa-map-marker-alt"></i> Michigan, USA</li>
                                                <li><i class="far fa-clock"></i> Available on Fri, 22 Mar</li>
                                                <li>
                                                    <i class="far fa-money-bill-alt"></i> $50 - $700
                                                    <i class="fas fa-info-circle" data-toggle="tooltip"
                                                       title="Lorem Ipsum"></i>
                                                </li>
                                            </ul>
                                            <div class="row row-sm">
                                                <div class="col-6">
                                                    <a href="doctor-profile.jsp" class="btn view-btn">View Profile</a>
                                                </div>
                                                <div class="col-6">
                                                    <a onclick="location.href='booking.jsp?doctor=doc'" class="btn book-btn">Book Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Doctor Widget -->

                                    <!-- Doctor Widget -->
                                    <div class="profile-widget imaging" data-specialty="imaging">
                                        <div class="doc-img">
                                            <a href="doctor-profile.jsp">
                                                <img class="img-fluid" alt="User Image"
                                                     src="assets/img/doctors/doctor-06.jpg" />
                                            </a>
                                            <a href="javascript:void(0)" class="fav-btn">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </div>
                                        <div class="pro-content">
                                            <h3 class="title">
                                                <a href="doctor-profile.jsp">Katharine Berthold</a>
                                                <i class="fas fa-check-circle verified"></i>
                                            </h3>
                                            <p class="specialty">Imaging</p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">(52)</span>
                                            </div>
                                            <ul class="available-info">
                                                <li><i class="fas fa-map-marker-alt"></i> Texas, USA</li>
                                                <li><i class="far fa-clock"></i> Available on Fri, 22 Mar</li>
                                                <li>
                                                    <i class="far fa-money-bill-alt"></i> $100 - $500
                                                    <i class="fas fa-info-circle" data-toggle="tooltip"
                                                       title="Lorem Ipsum"></i>
                                                </li>
                                            </ul>
                                            <div class="row row-sm">
                                                <div class="col-6">
                                                    <a href="doctor-profile.jsp" class="btn view-btn">View Profile</a>
                                                </div>
                                                <div class="col-6">
                                                    <a onclick="location.href='booking.jsp?doctor=doc'" class="btn book-btn">Book Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Doctor Widget -->

                                    <!-- Doctor Widget -->
                                    <div class="profile-widget general" data-specialty="general">
                                        <div class="doc-img">
                                            <a href="doctor-profile.jsp">
                                                <img class="img-fluid" alt="User Image"
                                                     src="assets/img/doctors/doctor-07.jpg" />
                                            </a>
                                            <a href="javascript:void(0)" class="fav-btn">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </div>
                                        <div class="pro-content">
                                            <h3 class="title">
                                                <a href="doctor-profile.jsp">Linda Tobin</a>
                                                <i class="fas fa-check-circle verified"></i>
                                            </h3>
                                            <p class="specialty">General</p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">(43)</span>
                                            </div>
                                            <ul class="available-info">
                                                <li><i class="fas fa-map-marker-alt"></i> Kansas, USA</li>
                                                <li><i class="far fa-clock"></i> Available on Fri, 22 Mar</li>
                                                <li>
                                                    <i class="far fa-money-bill-alt"></i> $100 - $1000
                                                    <i class="fas fa-info-circle" data-toggle="tooltip"
                                                       title="Lorem Ipsum"></i>
                                                </li>
                                            </ul>
                                            <div class="row row-sm">
                                                <div class="col-6">
                                                    <a href="doctor-profile.jsp" class="btn view-btn">View Profile</a>
                                                </div>
                                                <div class="col-6">
                                                    <a onclick="location.href='booking.jsp?doctor=doc'" class="btn book-btn">Book Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Doctor Widget -->

                                    <!-- Doctor Widget -->
                                    <div class="profile-widget surgery" data-specialty="surgery">
                                        <div class="doc-img">
                                            <a href="doctor-profile.jsp">
                                                <img class="img-fluid" alt="User Image"
                                                     src="assets/img/doctors/doctor-08.jpg" />
                                            </a>
                                            <a href="javascript:void(0)" class="fav-btn">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </div>
                                        <div class="pro-content">
                                            <h3 class="title">
                                                <a href="doctor-profile.jsp">Paul Richard</a>
                                                <i class="fas fa-check-circle verified"></i>
                                            </h3>
                                            <p class="specialty">Surgery</p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">(49)</span>
                                            </div>
                                            <ul class="available-info">
                                                <li><i class="fas fa-map-marker-alt"></i> California, USA</li>
                                                <li><i class="far fa-clock"></i> Available on Fri, 22 Mar</li>
                                                <li>
                                                    <i class="far fa-money-bill-alt"></i> $100 - $400
                                                    <i class="fas fa-info-circle" data-toggle="tooltip"
                                                       title="Lorem Ipsum"></i>
                                                </li>
                                            </ul>
                                            <div class="row row-sm">
                                                <div class="col-6">
                                                    <a href="doctor-profile.jsp" class="btn view-btn">View Profile</a>
                                                </div>
                                                <div class="col-6">
                                                    <a onclick="location.href='booking.jsp?doctor=doc'" class="btn book-btn">Book Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Doctor Widget -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
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
