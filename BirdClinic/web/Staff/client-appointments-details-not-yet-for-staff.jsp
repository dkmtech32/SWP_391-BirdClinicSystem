<%-- 
    Document   : newjspclient-appoitments-details-not-yet-for-staff
    Created on : Jun 26, 2023, 1:34:51 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="common/head.jsp"/>
    <body>
        <div class="main-wrapper">
            <!-- Header -->
            <jsp:include page="Common/header-guest.jsp"/>
            <!--/Header -->

            <!-- Breadcrumb -->
            <jsp:include page="Common/breadcrumb.jsp"/>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <!-- Profile Sidebar -->
                        <div class="bird-general-info">
                            <div class="avatar-image">
                                <img src="assets/img/about-1.jpg" class="bird-avatar"/>
                                <h2><a href="bird-details.html">Andy</a></h2>
                            </div>
                            <div class="bird-information-boxes">
                                <div class="bird-information-box">
                                    <p class="header">Bird's name</p>
                                    <p class="information">${bird.birdFullname}</p>
                                </div>
                                <div class="bird-information-box">
                                    <p class="header">Hatching Day</p>
                                    <p class="information">${bird.hatchingDate}</p>
                                </div>
                                <div class="bird-information-box">
                                    <p class="header">Breed</p>
                                    <p class="information">${bird.breed}</p>
                                </div>
                                <div class="bird-information-box">
                                    <p class="header">Sex</p>
                                    <p class="information">${bird.birdGender}</p>
                                </div>
                                <div class="bird-information-box">
                                    <p class="header">Weigth</p>
                                    <p class="information">${bird.birdWeight}</p>
                                </div>
                                <div class="bird-information-box">
                                    <p class="header">Microchip</p>
                                    <p class="information">${bird.microchip}</p>
                                </div>
                                <div class="bird-information-box">
                                    <p class="header">Sex Method</p>
                                    <p class="information">${bird.sexingMethod}</p>
                                </div>
                                <div class="bird-information-box">
                                    <p class="header">Feather Color</p>
                                    <p class="information">${bird.featherColor}</p>
                                </div>
                            </div>
                        </div>
                        <!-- /Profile Sidebar -->

                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="card">
                                <div class="card-body">
                                    <!-- Profile Settings Form -->
                                    <form>
                                        <div class="row form-row">
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <div class="change-avatar">
                                                        <div class="profile-img">
                                                            <img src="assets/img/patients/patient.jpg" alt="User Image" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>First Name</label>
                                                    <div class="form-control">${customer.firstName}</div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Last Name</label>
                                                    <div type="text" class="form-control">${customer.lastName}</div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Date of Birth</label>
                                                    <div class="cal-icon">
                                                        <div class="form-control datetimepicker">${customer.dob}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <div class="form-control">${customer.customerAddress}</div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <div class="form-control">${customer.email}</div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Mobile</label>
                                                    <div class="form-control">${customer.phoneNumber}</div> 
                                                </div>
                                            </div>
                                    </form>
                                    <!-- /Profile Settings Form -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="prescription">
                    <div class="col-md-12">
                        <table class="table table-bordered" >
                            <thead>
                                <tr>
                                    <th>Appointment Date</th>
                                    <th>Appointment Time</th>
                                    <th>Doctor</th>
                                    <th>Type of Service</th>
                                    <th>Bird's symptoms</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr >
                                    <td >${appoitment.date}</td>
                                    <td >${appoitment.timeslot}</td>
                                    <td >${appoitment.doctor}</td>
                                    <td >${appoitment.service}</td>
                                    <td >${appoitment.notes}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table-action-staff">
                        <button class="btn btn-sm bg-success-light"> <i class="fas fa-check"></i> Confirm </button>
                        <button class="btn btn-sm bg-danger-light"> <i class="fas fa-times"></i> Cancel </button>
                    </div>
                </div>
                <!-- /Page Content -->

                <!-- Footer -->
                <jsp:include page="Common/footer.jsp"/>
                <!-- /Footer -->
            </div>
        </div>
    </div>
    <jsp:include page="Common/script.jsp"/>
</body>
</html>