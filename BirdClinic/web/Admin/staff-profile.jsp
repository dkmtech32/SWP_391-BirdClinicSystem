<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../Common/head-admin.jsp"/>
    <body>
        <!-- Main Wrapper -->
        
        <jsp:include page="../Admin/loader.jsp"/>

        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="../Admin/sidebar.jsp"/>

            <!-- sidebar-wrapper  -->

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <div class="top-header">
                    <div class="header-bar d-flex justify-content-between border-bottom">
                        <div class="d-flex align-items-center">
                            <a href="#" class="logo-icon">
                                <img src="../assets/images/logo-icon.png" height="30" class="small" alt />
                                <span class="big">
                                    <img src="../assets/images/logo-dark.png" height="24" class="logo-light-mode" alt />
                                    <img src="../assets/images/logo-light.png" height="24" class="logo-dark-mode" alt />
                                </span>
                            </a>
                            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                                <i class="uil uil-bars"></i>
                            </a>
                            <div class="search-bar p-0 d-none d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <form role="search" method="get" id="searchform" class="searchform">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="s" id="s" placeholder="Search Keywords..." />
                                            <input type="submit" id="searchsubmit" value="Search" />
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <ul class="list-unstyled mb-0">
                            <li class="list-inline-item mb-0">
                                <div class="dropdown dropdown-primary">
                                    <button
                                        type="button"
                                        class="btn btn-pills btn-soft-primary dropdown-toggle p-0"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <img src="../assets/images/language/american.png" class="avatar avatar-ex-small rounded-circle p-2" alt />
                                    </button>
                                    <div
                                        class="dropdown-menu dd-menu drop-ups dropdown-menu-end bg-white shadow border-0 mt-3 p-2"
                                        data-simplebar
                                        style="height: 175px"
                                        >
                                        <a href="javascript:void(0)" class="d-flex align-items-center">
                                            <img src="../assets/images/language/chinese.png" class="avatar avatar-client rounded-circle shadow" alt />
                                            <div class="flex-1 text-left ms-2 overflow-hidden">
                                                <small class="text-dark mb-0">Chinese</small>
                                            </div>
                                        </a>

                                        <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                            <img src="../assets/images/language/european.png" class="avatar avatar-client rounded-circle shadow" alt />
                                            <div class="flex-1 text-left ms-2 overflow-hidden">
                                                <small class="text-dark mb-0">European</small>
                                            </div>
                                        </a>

                                        <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                            <img src="../assets/images/language/indian.png" class="avatar avatar-client rounded-circle shadow" alt />
                                            <div class="flex-1 text-left ms-2 overflow-hidden">
                                                <small class="text-dark mb-0">Indian</small>
                                            </div>
                                        </a>

                                        <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                            <img src="../assets/images/language/japanese.png" class="avatar avatar-client rounded-circle shadow" alt />
                                            <div class="flex-1 text-left ms-2 overflow-hidden">
                                                <small class="text-dark mb-0">Japanese</small>
                                            </div>
                                        </a>

                                        <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                            <img src="../assets/images/language/russian.png" class="avatar avatar-client rounded-circle shadow" alt />
                                            <div class="flex-1 text-left ms-2 overflow-hidden">
                                                <small class="text-dark mb-0">Russian</small>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </li>

                            <li class="list-inline-item mb-0 ms-1">
                                <a href="javascript:void(0)" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                                    <div class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="settings" class="fea icon-sm"></i></div>
                                </a>
                            </li>

                            <li class="list-inline-item mb-0 ms-1">
                                <div class="dropdown dropdown-primary">
                                    <button
                                        type="button"
                                        class="btn btn-icon btn-pills btn-soft-primary dropdown-toggle p-0"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <i data-feather="mail" class="fea icon-sm"></i>
                                    </button>
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                          >4 <span class="visually-hidden">unread mail</span></span
                                    >

                                    <div
                                        class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow rounded border-0 mt-3 px-2 py-2"
                                        data-simplebar
                                        style="height: 320px; width: 300px"
                                        >
                                        <a href="#" class="d-flex align-items-center justify-content-between py-2">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="../assets/images/client/02.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt />
                                                <small class="text-dark mb-0 d-block text-truncat ms-3"
                                                       >You received a new email from <b>Janalia</b> <small class="text-muted fw-normal d-inline-block">1 hour ago</small></small
                                                >
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="../assets/images/client/Codepen.svg" class="avatar avatar-md-sm rounded-circle shadow" alt />
                                                <small class="text-dark mb-0 d-block text-truncat ms-3"
                                                       >You received a new email from <b>codepen</b> <small class="text-muted fw-normal d-inline-block">4 hour ago</small></small
                                                >
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="../assets/images/client/03.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt />
                                                <small class="text-dark mb-0 d-block text-truncat ms-3"
                                                       >You received a new email from <b>Cristina</b> <small class="text-muted fw-normal d-inline-block">5 hour ago</small></small
                                                >
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="../assets/images/client/dribbble.svg" class="avatar avatar-md-sm rounded-circle shadow" alt />
                                                <small class="text-dark mb-0 d-block text-truncat ms-3"
                                                       >You received a new email from <b>Dribbble</b> <small class="text-muted fw-normal d-inline-block">24 hour ago</small></small
                                                >
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="../assets/images/client/06.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt />
                                                <small class="text-dark mb-0 d-block text-truncat ms-3"
                                                       >You received a new email from <b>Donald Aghori</b>
                                                    <small class="text-muted fw-normal d-inline-block">1 day ago</small></small
                                                >
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="../assets/images/client/07.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt />
                                                <small class="text-dark mb-0 d-block text-truncat ms-3"
                                                       >You received a new email from <b>Calvin</b> <small class="text-muted fw-normal d-inline-block">2 day ago</small></small
                                                >
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </li>

                            <li class="list-inline-item mb-0 ms-1">
                                <div class="dropdown dropdown-primary">
                                    <button
                                        type="button"
                                        class="btn btn-pills btn-soft-primary dropdown-toggle p-0"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <img src="../assets/images/doctors/01.jpg" class="avatar avatar-ex-small rounded-circle" alt />
                                    </button>
                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px">
                                        <a class="dropdown-item d-flex align-items-center text-dark" href="https://shreethemes.in/doctris/layouts/admin/profile.html">
                                            <img src="../assets/images/doctors/01.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt />
                                            <div class="flex-1 ms-2">
                                                <span class="d-block mb-1">Calvin Carlo</span>
                                                <small class="text-muted">Orthopedic</small>
                                            </div>
                                        </a>
                                        <a class="dropdown-item text-dark" href="index.html"
                                           ><span class="mb-0 d-inline-block me-1"><i class="uil uil-dashboard align-middle h6"></i></span> Dashboard</a
                                        >
                                        <a class="dropdown-item text-dark" href="dr-profile.html"
                                           ><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a
                                        >
                                        <div class="dropdown-divider border-top"></div>
                                        <a class="dropdown-item text-dark" href="lock-screen.html"
                                           ><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a
                                        >
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Staff Profile & Settings</h5>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item"><a href="doctors.html">Staff</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Profile</li>
                                </ul>
                            </nav>
                        </div>

                        <div class="card bg-white rounded shadow overflow-hidden mt-4 border-0">
                            <div class="p-5 bg-primary bg-gradient"></div>
                            <div class="avatar-profile d-flex margin-nagative mt-n5 position-relative ps-3">
                                <img src="../assets/images/client/02.jpg" class="rounded-circle shadow-md avatar avatar-medium" alt />
                                <div class="mt-4 ms-3 pt-3">
                                    <h5 class="mt-3 mb-1">Mrs.Kim</h5>
                                    <p class="text-muted mb-0">Staff</p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 mt-4">
                                    <div class="card border-0 rounded-0 p-4">
                                        <div class="tab-content mt-2" id="pills-tabContent">
                                            <div class="tab-pane fade show active" id="pills-settings" role="tabpanel" aria-labelledby="settings-tab">
                                                <h5 class="mb-1">Profile</h5>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="rounded shadow mt-4">
                                                            <div class="p-4 border-bottom">
                                                                <h6 class="mb-0">Personal Information :</h6>
                                                            </div>

                                                            <div class="p-4">
                                                                <div class="row align-items-center">
                                                                    <div class="col-lg-2 col-md-4">
                                                                        <img src="../assets/images/client/02.jpg" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt />
                                                                    </div>
                                                                    <!--end col-->

                                                                    <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                                                        <h6 class>Upload your picture</h6>
                                                                        <p class="text-muted mb-0">
                                                                            For best results, use an image at least 256px by 256px in either .jpg or .png format
                                                                        </p>
                                                                    </div>
                                                                    <!--end col-->

                                                                    <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                                                        <a href="#" class="btn btn-primary">Upload</a>
                                                                    </div>
                                                                    <!--end col-->
                                                                </div>
                                                                <!--end row-->

                                                                <form class="mt-4">
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">First Name</label>
                                                                                <input name="name" id="name" type="text" class="form-control" value="Kim" />
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->

                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Last Name</label>
                                                                                <input name="name" id="name2" type="text" class="form-control" value="Leo" />
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->

                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Username</label>
                                                                                <input name="name" id="name2" type="text" class="form-control" value="Kim0555" />
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->

                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Dr Email</label>
                                                                                <input name="email" id="email" type="email" class="form-control" value="doctor@birdlover.com" />
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->

                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Phone</label>
                                                                                <input name="number" id="number" type="text" class="form-control" value="(+84) 123 456 78" />
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->

                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Gender</label>
                                                                                <select class="form-control time-during">
                                                                                    <option value="">Male</option>
                                                                                    <option value="">Female</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Date of Birth</label>
                                                                                <input name="date" id="number" type="date" class="form-control" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!--end row-->

                                                                    <div class="row">
                                                                        <div class="col-sm-12">
                                                                            <input type="submit" id="submit" name="send" class="btn btn-primary" value="Save changes" />
                                                                        </div>
                                                                        <!--end col-->
                                                                    </div>
                                                                    <!--end row-->
                                                                </form>
                                                                <!--end form-->
                                                            </div>
                                                        </div>

                                                        <div class="rounded shadow mt-4">
                                                            <div class="p-4 border-bottom">
                                                                <h6 class="mb-0">Reset password:</h6>
                                                            </div>

                                                            <div class="p-4">
                                                                <form>
                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">New password :</label>
                                                                                <input type="password" class="form-control" placeholder="New password" required />
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->

                                                                        <div class="col-lg-12">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Re-type New password :</label>
                                                                                <input type="password" class="form-control" placeholder="Re-type New password" required />
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->

                                                                        <div class="col-lg-12 mt-2 mb-0">
                                                                            <button class="btn btn-primary">Save password</button>
                                                                        </div>
                                                                        <!--end col-->
                                                                    </div>
                                                                    <!--end row-->
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end col-->



                                                </div>
                                                <!--end row-->
                                            </div>
                                            <!--end teb pane-->
                                        </div>
                                        <!--end tab content-->
                                    </div>
                                </div>
                                <!--end col-->
                            </div>
                            <!--end row-->
                        </div>
                    </div>
                </div>
                <!--end container-->

                <!-- Footer Start -->
                <footer class="bg-white shadow py-3">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="text-sm-start text-center">
                                    <p class="mb-0 text-muted">
                                        <script>
                                            document.write(new Date().getFullYear());
                                        </script>
                                        © BirdLover
                                    </p>
                                </div>
                            </div>
                            <!--end col-->
                        </div>
                        <!--end row-->
                    </div>
                    <!--end container-->
                </footer>
                <!--end footer-->
                <!-- End -->
            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->

        <!-- Offcanvas Start -->
        <div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header p-4 border-bottom">
                <h5 id="offcanvasRightLabel" class="mb-0">
                    <img src="../assets/images/logo-dark.png" height="24" class="light-version" alt />
                    <img src="../assets/images/logo-light.png" height="24" class="dark-version" alt />
                </h5>
                <button type="button" class="btn-close d-flex align-items-center text-dark" data-bs-dismiss="offcanvas" aria-label="Close">
                    <i class="uil uil-times fs-4"></i>
                </button>
            </div>
            <div class="offcanvas-body p-4 px-md-5">
                <div class="row">
                    <div class="col-12">
                        <!-- Style switcher -->
                        <div id="style-switcher">
                            <div>
                                <ul class="text-center list-unstyled mb-0">
                                    <li class="d-grid">
                                        <a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"
                                           ><img src="../assets/images/layouts/light-dash-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt /><span
                                                class="text-muted mt-2 d-block"
                                                >RTL Version</span
                                            ></a
                                        >
                                    </li>
                                    <li class="d-grid">
                                        <a href="javascript:void(0)" class="ltr-version t-ltr-light" onclick="setTheme('style')"
                                           ><img src="../assets/images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt /><span
                                                class="text-muted mt-2 d-block"
                                                >LTR Version</span
                                            ></a
                                        >
                                    </li>
                                    <li class="d-grid">
                                        <a href="javascript:void(0)" class="dark-rtl-version t-rtl-dark" onclick="setTheme('style-dark-rtl')"
                                           ><img src="../assets/images/layouts/dark-dash-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt /><span
                                                class="text-muted mt-2 d-block"
                                                >RTL Version</span
                                            ></a
                                        >
                                    </li>
                                    <li class="d-grid">
                                        <a href="javascript:void(0)" class="dark-ltr-version t-ltr-dark" onclick="setTheme('style-dark')"
                                           ><img src="../assets/images/layouts/dark-dash.png" class="img-fluid rounded-md shadow-md d-block" alt /><span
                                                class="text-muted mt-2 d-block"
                                                >LTR Version</span
                                            ></a
                                        >
                                    </li>
                                    <li class="d-grid">
                                        <a href="javascript:void(0)" class="dark-version t-dark mt-4" onclick="setTheme('style-dark')"
                                           ><img src="../assets/images/layouts/dark-dash.png" class="img-fluid rounded-md shadow-md d-block" alt /><span
                                                class="text-muted mt-2 d-block"
                                                >Dark Version</span
                                            ></a
                                        >
                                    </li>
                                    <li class="d-grid">
                                        <a href="javascript:void(0)" class="light-version t-light mt-4" onclick="setTheme('style')"
                                           ><img src="../assets/images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt /><span
                                                class="text-muted mt-2 d-block"
                                                >Light Version</span
                                            ></a
                                        >
                                    </li>
                                    <li class="d-grid">
                                        <a href="landing/index.html" target="_blank" class="mt-4"
                                           ><img src="../assets/images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt /><span
                                                class="text-muted mt-2 d-block"
                                                >Landing Demos</span
                                            ></a
                                        >
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- end Style switcher -->
                    </div>
                    <!--end col-->
                </div>
                <!--end row-->
            </div>

            <div class="offcanvas-footer p-4 border-top text-center">
                <ul class="list-unstyled social-icon mb-0">
                    <li class="list-inline-item mb-0">
                        <a href="https://1.envato.market/doctris-template" target="_blank" class="rounded"
                           ><i class="uil uil-shopping-cart align-middle" title="Buy Now"></i
                            ></a>
                    </li>
                    <li class="list-inline-item mb-0">
                        <a href="https://dribbble.com/shreethemes" target="_blank" class="rounded"
                           ><i class="uil uil-dribbble align-middle" title="dribbble"></i
                            ></a>
                    </li>
                    <li class="list-inline-item mb-0">
                        <a href="https://www.facebook.com/shreethemes" target="_blank" class="rounded"
                           ><i class="uil uil-facebook-f align-middle" title="facebook"></i
                            ></a>
                    </li>
                    <li class="list-inline-item mb-0">
                        <a href="https://www.instagram.com/shreethemes/" target="_blank" class="rounded"
                           ><i class="uil uil-instagram align-middle" title="instagram"></i
                            ></a>
                    </li>
                    <li class="list-inline-item mb-0">
                        <a href="https://twitter.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-twitter align-middle" title="twitter"></i></a>
                    </li>
                    <li class="list-inline-item mb-0">
                        <a href="mailto:support@shreethemes.in" class="rounded"><i class="uil uil-envelope align-middle" title="email"></i></a>
                    </li>
                    <li class="list-inline-item mb-0">
                        <a href="index.html" target="_blank" class="rounded"><i class="uil uil-globe align-middle" title="website"></i></a>
                    </li>
                </ul>
                <!--end icon-->
            </div>
        </div>
        <!-- Offcanvas End -->
        <!-- Script -->
        <jsp:include page="../Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
