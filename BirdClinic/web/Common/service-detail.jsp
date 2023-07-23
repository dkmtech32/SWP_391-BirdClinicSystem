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

            <!-- Page Content -->

            <section class="section section-specialities" style="padding: 0;">
                <div class="container py-5">
                    <div class="row py-5">
                        <div class="col-lg-7 pb-5 pb-lg-0 px-3 px-lg-5">
                            <h4 class="text-secondary mb-3">Service Detail</h4>
                            <h1 class="display-4 mb-4"><span
                                    class="text-primary">Bird Boarding</span>
                                <span class="text-secondary">Service</span></h1>
                            <h5 class="text-muted mb-3">
                                Take Flight with BirdLover: Where Birds Find a
                                Home Away from Home
                            </h5>
                            <p class="mb-4">
                                Welcome to BirdLover: Where Feathers Find a
                                Home.
                            </p>
                            <p class="mb-4">
                                Discover a premier Bird Boarding Service that
                                offers your avian companions a safe and
                                enriching retreat. Our state-of-the-art facility
                                provides spacious enclosures, stimulating
                                activities, and expert care to ensure their
                                happiness and well-being.
                            </p>
                            <p class="mb-4">

                                Experience the ultimate bird boarding experience
                                at BirdLover. Contact us now to secure a spot
                                for your feathered friends.
                            </p>

                            <ul class="list-inline">
                                <li>
                                    <h5><i
                                            class="fa fa-check-double text-secondary mr-3"></i>Best
                                        In Industry</h5>
                                </li>
                                <li>
                                    <h5><i
                                            class="fa fa-check-double text-secondary mr-3"></i>Emergency
                                        Services</h5>
                                </li>
                                <li>
                                    <h5><i
                                            class="fa fa-check-double text-secondary mr-3"></i>24/7
                                        Customer Support</h5>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-5">
                            <div class="row px-3">
                                <div class="col-12 p-0">
                                    <img class="img-fluid w-100 h-100"
                                        src="https://images.unsplash.com/photo-1614685761174-e67b8d6badcf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"
                                        alt>
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
