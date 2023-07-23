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
            <jsp:include page="../Common/header.jsp"/>
            <!--/Header -->

            <!-- Breadcrumb -->
            <jsp:include page="../Common/breadcrumb.jsp"/>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="text-center fw-bold" id="title">
                <h1 class="mt-3">Prescription Tool for Doctors</h1>

                <hr>
            </div>
            <div class="container-fluid p-5 mt-4" id="prescriptionForm" >
                <div class="card">
                    <div class="card-body">                      
                        <div class="row">
                            <div class="row col-md-4">
                                <div class="widget-profile pro-widget-content">
                                    <div class="profile-info-widget">
                                        <a href="#" class="booking-doc-img">
                                            <img src="<c:url value='/images/bird/${medicalRecord.appointment.bird.image.imageURLName}'/>" alt="User Image">
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>${medicalRecord.appointment.bird.birdFullname}</h3>
                                        </div>
                                    </div>
                                </div>
                                <!--                <div class="col-12 col-md-6">
                                                    <p class="header">Bird's name</p>
                                                    <p class="information"></p>
                                                </div>-->
                                <div class="row">

                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Hatching Day</label>
                                            <div class="form-control">${medicalRecord.appointment.bird.hatchingDate}</div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Breed</label>
                                            <div class="form-control">${medicalRecord.appointment.bird.breed}</div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Sex</label>
                                            <div class="form-control">${medicalRecord.appointment.bird.birdGender}</div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Weight</label>
                                            <div class="form-control">${medicalRecord.appointment.bird.birdWeight}</div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Microchip</label>
                                            <div class="form-control">${medicalRecord.appointment.bird.band_Chip}</div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Feather Color</label>
                                            <div class="form-control">${medicalRecord.appointment.bird.featherColor}</div>
                                        </div>
                                    </div>
                                    <!--                            <div class="col-12 col-md-6">
                                                                    <p>Sex Method</p>
                                                                    <p class="information"></p>
                                                                </div>-->


                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Owner's Name</label>
                                            <div class="form-control">${medicalRecord.appointment.bird.customer.fullName}</div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Date of Birth</label>
                                            <div class="cal-icon">
                                                <div class="form-control datetimepicker">${medicalRecord.appointment.bird.customer.dob}</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-12">
                                        <div class="form-group">
                                            <label>Address</label>
                                            <div class="form-control">${medicalRecord.appointment.bird.customer.customerAddress}</div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <div class="form-control">${medicalRecord.appointment.bird.customer.email}</div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Mobile</label>
                                            <div class="form-control">${medicalRecord.appointment.bird.customer.phoneNumber}</div> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <h3 class="text-center prescription">Prescription:</h3>

                                <form action="<c:url value='/Doctor/Prescription/Update'/>" method="post">
                                    <!-- Medicine Information -->
                                    <div class="info-widget">
                                        <h4 class="card-title">Add medicine</h4>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group card-label">
                                                    <label>Medicine name</label>
                                                    <select class="js-example-basic-single" name="medicineID">
                                                        <c:forEach var="list" items="${sessionScope.medicines}">
                                                            <option value="${list.medicineID}">${list.medicineName} (${list.unit})</option>                           
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group card-label">
                                                    <label>Quantity</label>
                                                    <input class="form-control" type="number" name="quantity" value="" />
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group card-label">
                                                    <label>Dose</label>
                                                    <input class="form-control" type="text" name="description" value="" />
                                                </div>
                                            </div>

                                        </div>							
                                        <!-- <div class="exist-customer">Existing Customer? <a href="#">Click here to login</a></div> -->
                                        <button value="add" name="action" type="submit" class="btn btn-primary submit-btn">Add</button>
                                    </div>
                                    <!-- /Medicine Information -->						
                                </form>

                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-bordered" id="">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Medicine</th>
                                                    <th>Quantity</th>
                                                    <th>Unit</th>
                                                    <th>Dose</th>
                                                    <th>Edit</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="list" items="${sessionScope.prescription}" varStatus="loop">
                                                    <tr >
                                                        <td data-field="#">${loop.count}</td>
                                                        <td data-field="medicine">${list.medicine.medicineName}</td>
                                                        <td data-field="quantity">${list.quantity}</td>
                                                        <td data-field="unit">${list.medicine.unit}</td>
                                                        <td data-field="description">${list.description_}</td>
                                                        <td>											
                                                            <a class="button button-small edit" 
                                                               href="<c:url value="/Doctor/Prescription/Update?medicineID=${list.medicine.medicineID}&quantity=${-list.quantity}"/>" 
                                                               title="Delete" >
                                                                <i class="fa fa-trash"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <form action="<c:url value='/Doctor/Prescription/Update'/>" method="post">
                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label>Note</label>
                                                <textarea class="form-control" name="doctor-notes" rows="4" placeholder="Note for bird" ></textarea>
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">													                                            
                                                <label>Diagnosis</label>
                                                <input class="form-control" name="diagnosis"/>                                       
                                            </div>
                                        </div>

                                        <div class="col-md-12 col-sm-12">
                                            <div class="form-group">
                                                <label>Treatment days</label>
                                                <input class="form-control" name="treatment-days" type="number"> 
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" name="action" value="submit" class="btn btn-dark d-flex justify-content-center mx-auto mt-2">
                                        Submit
                                    </button>
                                </form>
                            </div>

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
        <script>
            $(document).ready(function () {
                $('.js-example-basic-single').select2();
            });
        </script>
        <!-- /Script -->
    </body>
</html>
