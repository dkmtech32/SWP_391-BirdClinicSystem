<%-- 
    Document   : index
    Created on : Jun 19, 2023, 11:25:16 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="../Common/head.jsp"/>
    <body>
        <!-- Main Wrapper -->

        <jsp:include page="../Common/header-guest.jsp"/>

        <!-- Home Banner -->
        <div class="container-fluid p-0">
            <div id="header-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="w-100" src="../assets/img/bposter1.jpg" alt="Image" />
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 900px">
                                <h3 class="text-white mb-3 d-none d-sm-block">Best Bird Services</h3>
                                <h1 class="display-3 text-white mb-3">Keep Your Bird Happy</h1>
                                <h5 class="text-white mb-3 d-none d-sm-block">Duo nonumy et dolor tempor no et. Diam sit
                                    diam sit diam erat</h5>
                                <!-- <a href="booking.jsp" class="btn btn-lg btn-primary mt-3 mt-md-4 px-4">Book Now</a> -->
                                <a href="service-list.jsp" class="btn btn-lg btn-secondary mt-3 mt-md-4 px-4">Learn
                                    More</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="w-100" src="../assets/img/bposter2.jpg" alt="Image" />
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 900px">
                                <h3 class="text-white mb-3 d-none d-sm-block">Best Bird Services</h3>
                                <h1 class="display-3 text-white mb-3">Bird Spa & Grooming</h1>
                                <h5 class="text-white mb-3 d-none d-sm-block">Duo nonumy et dolor tempor no et. Diam sit
                                    diam sit diam erat</h5>
                                <!-- <a href="" class="btn btn-lg btn-primary mt-3 mt-md-4 px-4">Book Now</a> -->
                                <a href="service-list.jsp" class="btn btn-lg btn-secondary mt-3 mt-md-4 px-4">Learn
                                    More</a>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                    <div class="btn btn-primary rounded" style="width: 45px; height: 45px">
                        <span class="carousel-control-prev-icon mb-n2"></span>
                    </div>
                </a>
                <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                    <div class="btn btn-primary rounded" style="width: 45px; height: 45px">
                        <span class="carousel-control-next-icon mb-n2"></span>
                    </div>
                </a>
            </div>
        </div>
        <!-- /Home Banner -->

        <!-- Availabe Features -->

        <section class="section section-specialities" style="padding: 0;">
            <div class="container py-5">
                <div class="row py-5">
                    <div class="col-lg-7 pb-5 pb-lg-0 px-3 px-lg-5">
                        <h4 class="text-secondary mb-3">About Us</h4>
                        <h1 class="display-4 mb-4"><span class="text-primary">Boarding</span> & <span
                                class="text-secondary">Daycare</span></h1>
                        <h5 class="text-muted mb-3">
                            Amet stet amet ut. Sit no vero vero no dolor. Sed erat ut sea. Just clita ut stet kasd at
                            diam sit erat vero sit.
                        </h5>
                        <p class="mb-4">
                            Dolores lorem lorem ipsum sit et ipsum. Sadip sea amet diam dolore sed et. Sit rebum labore
                            sit sit ut vero no sit. Et elitr stet
                            dolor sed sit et sed ipsum et kasd ut. Erat duo eos et erat sed diam duo
                        </p>
                        <ul class="list-inline">
                            <li>
                                <h5><i class="fa fa-check-double text-secondary mr-3"></i>Best In Industry</h5>
                            </li>
                            <li>
                                <h5><i class="fa fa-check-double text-secondary mr-3"></i>Emergency Services</h5>
                            </li>
                            <li>
                                <h5><i class="fa fa-check-double text-secondary mr-3"></i>24/7 Customer Support</h5>
                            </li>
                        </ul>
                        <a href="service-list.jsp" class="btn btn-lg btn-primary mt-3 px-4">Learn More</a>
                    </div>
                    <div class="col-lg-5">
                        <div class="row px-3">
                            <div class="col-12 p-0">
                                <img class="img-fluid w-100 h-100" src="../assets/img/about-1.jpg" alt="" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Availabe Features -->

        <!-- Popular Section -->

        <!-- /Popular Section -->

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

        <!-- blog Section -->
        <div class="container pt-5">
            <div class="d-flex flex-column text-center mb-5">
                <h4 class="text-secondary mb-3">Bird Blog</h4>
                <h1 class="display-4 m-0"><span class="text-primary">Updates</span> From Blog</h1>
            </div>
            <div class="row pb-3">
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 mb-2">
                        <img class="card-img-top" src="../assets/img/blog-1.jpg" alt="" />
                        <div class="card-body bg-light p-4">
                            <h4 class="card-title text-truncate">Diam amet eos at no eos</h4>
                            <div class="d-flex mb-3">
                                <small class="mr-2"><i class="fa fa-user text-muted"></i> Admin</small>
                                <small class="mr-2"><i class="fa fa-folder text-muted"></i> Web Design</small>
                                <small class="mr-2"><i class="fa fa-comments text-muted"></i> 15</small>
                            </div>
                            <p>Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet, diam sea est diam eos,
                                rebum sit vero stet justo</p>
                            <a class="font-weight-bold" href="blog-detail.jsp">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 mb-2">
                        <img class="card-img-top" src="../assets/img/about-2.jpg" alt="" />
                        <div class="card-body bg-light p-4">
                            <h4 class="card-title text-truncate">Diam amet eos at no eos</h4>
                            <div class="d-flex mb-3">
                                <small class="mr-2"><i class="fa fa-user text-muted"></i> Admin</small>
                                <small class="mr-2"><i class="fa fa-folder text-muted"></i> Web Design</small>
                                <small class="mr-2"><i class="fa fa-comments text-muted"></i> 15</small>
                            </div>
                            <p>Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet, diam sea est diam eos,
                                rebum sit vero stet justo</p>
                            <a class="font-weight-bold" href="blog-detail.jsp">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 mb-2">
                        <img class="card-img-top" src="../assets/img/blog-1.jpg" alt="" />
                        <div class="card-body bg-light p-4">
                            <h4 class="card-title text-truncate">Diam amet eos at no eos</h4>
                            <div class="d-flex mb-3">
                                <small class="mr-2"><i class="fa fa-user text-muted"></i> Admin</small>
                                <small class="mr-2"><i class="fa fa-folder text-muted"></i> Web Design</small>
                                <small class="mr-2"><i class="fa fa-comments text-muted"></i> 15</small>
                            </div>
                            <p>Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet, diam sea est diam eos,
                                rebum sit vero stet justo</p>
                            <a class="font-weight-bold" href="blog-detail.jsp">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- blog Section -->

        <jsp:include page="Common/footer.jsp"/>

        <!-- /Main Wrapper -->

        <jsp:include page="Common/script.jsp"/>

    </body>
</html>
