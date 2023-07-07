<%-- 
    Document   : client-appointments-details-for-staff-finish
    Created on : Jul 7, 2023, 10:05:30 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="common/head.jsp"/>
    <body>
        <div class="main-wrapper">
            <!-- Header -->
            <jsp:include page="../Common/header.jsp"/>
            <!--/Header -->

            <!-- Breadcrumb -->
            <jsp:include page="../Common/breadcrumb.jsp"/>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <!-- Profile Sidebar -->
                        <div class="bird-general-info">
                            <div class="avatar-image">
                                <img src="assets/img/about-1.jpg" class="bird-avatar"/>
                                <h2><a href="../Common/bird-details.jsp">${bird.birdFullname}</a></h2>
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
                                    <p class="header">Weight</p>
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
                    <h2>General Information</h2>
                    <div class="col-md-12">
                        <table class="table table-bordered" >
                            <thead>
                                <tr>
                                    <th>Appointment Date</th>
                                    <th>Appointment Time</th>
                                    <th>Doctor</th>
                                    <th>Service</th>
                                    <th>Owner's Note</th>
                                    <th>Diagnosis</th>
                                    <th>Doctor's Note</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${appoitment.appTime}</td>
                                    <td>${appoitment.timeslot}</td>
                                    <td>${appoitment.doctor}</td>
                                    <td>${appoitment.service}</td>
                                    <td style="word-wrap: break-word; max-width: 300px;">${appoitment.ownerNote}</td> <!-- này chưa có -->
                                    <td>${medicalRecord.diagnosis}</td>
                                    <td style="word-wrap: break-word; max-width: 300px;">${appoitment.notes}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <h2>Medicines</h2>
                    <table class="table table-bordered" >
                        <thead>
                            <tr>
                                <th>Medicine</th>
                                <th>Quantity</th>
                                <th>Unit</th>
                                <th>Description</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach>
                                <tr>
                                    <td>${medicalRecord.medicine}</td>
                                    <td>${medicalRecord.quantity}</td>
                                    <td>${medicalRecord.unit}</td> <!-- Cái này chưa có -->
                                    <td>${medicalRecord.descriptions}</td> 
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                
                <div class="col-md-12 col-sm-12">
                    <div class="form-group">													
                        <div class="form-control" rows="4" style="word-wrap: break-word; height: 9rem">
                            ${appoitment.ownerFeedback}
                        </div>
                    </div>
                </div>
                <div class="booking-summary-in-appointments-details">
                    <h2>Payment</h2>
                    <div class="payment-method">
                        <h4>Payment Method</h4> 
                        <select class="form-control select w-75" required>
                            <c:forEach>
                                <option>${appoitment.payment}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="booking-item-wrap-in-appointments-details">
                        <ul class="booking-fee-in-appointments-details">
                            <li>Service Fee<span>${service.servicePrice}</span></li>
                            <li>Booking Fee<span>${service.bookingFee}</span></li> <!-- Cái này chưa có -->
                            <li>Medicine Fee<span>${medicine.medicinePrice}</span></li> <!-- Cái này tổng tiền thuốc -->
                        </ul>
                        <div class="booking-total-in-appointments-details">
                            <ul class="booking-total-list-in-appointments-details">
                                <li>
                                    <span>Total</span>
                                    <span class="total-cost-in-appointments-details">${service.totalMoney}</span> <!-- Cái chưa có, tổng của 3 thứ trên -->
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="table-action-staff">
                    <button class="btn btn-sm bg-success-light"> <i class="fas fa-check"></i> Confirm </button> <!-- nhấn xong chuyển status thành complete-->
                </div>
            </div>
            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include page="../Common/footer.jsp"/>
            <!-- /Footer -->
        </div>
    </div>
</div>
<jsp:include page="../Common/script.jsp"/>
</body>
</html>

