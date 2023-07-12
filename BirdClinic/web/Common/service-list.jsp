<%-- 
    Document   : bookInfo-all
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
            <jsp:include page="../Common/header-guest.jsp"/>
            <!--/Header -->

            <!-- Breadcrumb -->
            <jsp:include page="../Common/breadcrumb.jsp"/>
            <!-- /Breadcrumb -->

            <!-- Page Content -->

            <!-- Services Start -->
            <div class="container-fluid bg-light pt-5">
                <div class="container py-5">
                    <div class="d-flex flex-column text-center mb-5">
                        <h4 class="text-secondary mb-3">Our Services</h4>
                        <h1 class="display-4 m-0"><span class="text-primary">Premium</span> Bird Services</h1>
                    </div>
                    <div class="row pb-3">
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5">
                                <h3 class="flaticon-house display-3 font-weight-normal text-secondary mb-3"></h3>
                                <h3 class="mb-3">Bird Boarding</h3>
                                <p>Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet, diam sea est magna diam
                                    eos, rebum sit vero stet ipsum justo</p>
                                <a class="text-uppercase font-weight-bold" href="service-detail.jsp">Read More</a>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5">
                                <h3 class="flaticon-food display-3 font-weight-normal text-secondary mb-3"></h3>
                                <h3 class="mb-3">Bird Feeding</h3>
                                <p>Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet, diam sea est magna diam
                                    eos, rebum sit vero stet ipsum justo</p>
                                <a class="text-uppercase font-weight-bold" href="service-detail.jsp">Read More</a>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5">
                                <h3 class="flaticon-grooming display-3 font-weight-normal text-secondary mb-3"></h3>
                                <h3 class="mb-3">Bird Grooming</h3>
                                <p>Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet, diam sea est magna diam
                                    eos, rebum sit vero stet ipsum justo</p>
                                <a class="text-uppercase font-weight-bold" href="service-detail.jsp">Read More</a>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5">
                                <h3 class="flaticon-care display-3 font-weight-normal text-secondary mb-3"></h3>
                                <h3 class="mb-3">Bird Examine</h3>
                                <p>Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet, diam sea est magna diam
                                    eos, rebum sit vero stet ipsum justo</p>
                                <a class="text-uppercase font-weight-bold" href="service-detail.jsp">Read More</a>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5">
                                <h3 class="flaticon-doctor display-3 font-weight-normal text-secondary mb-3"></h3>
                                <h3 class="mb-3">DNA & Sex testing</h3>
                                <p>Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet, diam sea est magna diam
                                    eos, rebum sit vero stet ipsum justo</p>
                                <a class="text-uppercase font-weight-bold" href="service-detail.jsp">Read More</a>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5">
                                <h3 class="flaticon-vaccine display-3 font-weight-normal text-secondary mb-3"></h3>
                                <h3 class="mb-3">Bird Vaccination</h3>
                                <p>Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet, diam sea est magna diam
                                    eos, rebum sit vero stet ipsum justo</p>
                                <a class="text-uppercase font-weight-bold" href="service-detail.jsp">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Services End -->
            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include page="../Common/footer.jsp"/>
            <!-- /Footer -->
        </div>
        <!-- /Main Wrapper -->

        <!-- Script -->
        <jsp:include page="Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
