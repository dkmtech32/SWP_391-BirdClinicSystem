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
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="display-4 fw-bold">Prescription Tool for Doctors</h1>
                    <div class="border-top border-primary mt-4" style="width: 100px; margin: auto;"></div>
                </div>
            </div>


            <div class="container-fluid " id="prescriptionForm" >
                <div class="row">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header bg-primary text-white">
                                Bird Information
                            </div>
                            <div class="card-body">
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
                                <div class="row">
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Hatching Day</label>
                                            <input type="text" class="form-control" value="${medicalRecord.appointment.bird.hatchingDate}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Breed</label>
                                            <input type="text" class="form-control" value="${medicalRecord.appointment.bird.breed}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Sex</label>
                                            <input type="text" class="form-control" value="${medicalRecord.appointment.bird.birdGender}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Weight</label>
                                            <input type="text" class="form-control" value="${medicalRecord.appointment.bird.birdWeight}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Microchip</label>
                                            <input type="text" class="form-control" value="${medicalRecord.appointment.bird.band_Chip}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Feather Color</label>
                                            <input type="text" class="form-control" value="${medicalRecord.appointment.bird.featherColor}" readonly>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Owner's Name</label>
                                            <input type="text" class="form-control" value="${medicalRecord.appointment.bird.customer.fullName}" readonly>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Date of Birth</label>
                                            <div class="cal-icon">
                                                <input type="text" class="form-control" value="${medicalRecord.appointment.bird.customer.dob}" readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-12">
                                        <div class="form-group">
                                            <label>Address</label>
                                            <input type="text" class="form-control" value="${medicalRecord.appointment.bird.customer.customerAddress}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" class="form-control" value="${medicalRecord.appointment.bird.customer.email}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Mobile</label>
                                            <input type="text" class="form-control" value="${medicalRecord.appointment.bird.customer.phoneNumber}" readonly>
                                        </div>
                                    </div>
                                </div>    
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8">

                        <div class="card">
                            <div class="card-header bg-primary text-white">
                                Service
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <form action="<c:url value='/Doctor/Prescription/Update'/>" method="post">
                                            <select name="serviceID" class="form-control">
                                                <option value="">-</option>
                                                <c:forEach var="service" items="${service_list}">
                                                    <option value="${service.serviceID}">${service.serviceName}</option>
                                                </c:forEach>
                                            </select>
                                            <button value="addService" name="action" class="btn btn-primary mt-2"> Add service</button>
                                        </form>

                                    </div>
                                    <div class="col-md-6">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <td>Service name</td>
                                                    <td>Service price</td>
                                                    <td></td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="service" items="${sessionScope.services}">
                                                    <tr>
                                                        <td>${service.serviceName}</td>
                                                        <td>$ ${service.servicePrice}</td>
                                                        <td>
                                                            <c:if test="${sessionScope.services.size() != 1}">
                                                                <a href="<c:url value='/Doctor/Prescription/Update?action=deleteService&serviceID=${service.serviceID}'/>" class="button button-small edit">
                                                                    <i class="fa fa-trash"></i>
                                                                </a>
                                                            </c:if>

                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-header bg-primary text-white">
                                Prescription
                            </div>
                            <div class="card-body">
                                <form action="<c:url value='/Doctor/Prescription/Update'/>" method="post">
                                    <!-- Medicine Information -->
                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="medicineSelect">Medicine name</label>
                                                <select class="js-example-basic-single form-control" name="medicineID" id="medicineSelect">
                                                    <c:forEach var="list" items="${sessionScope.medicines}">
                                                        <option value="${list.medicineID}">${list.medicineName} (${list.unit})</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="quantityInput">Quantity</label>
                                                <input class="form-control" type="number" name="quantity" id="quantityInput" value="1" required oninput="validateQuantity(this)" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="doseInput">Dose</label>
                                                <input class="form-control" type="text" name="description" id="doseInput" value="" required />
                                            </div>
                                        </div>
                                    </div>

                                    <button value="add" name="action" type="submit" class="btn btn-primary mb-3">
                                        <i class="fa fa-plus mr-2"></i>Add Medicine
                                    </button>

                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <table class="table table-bordered">
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
                                                        <tr>
                                                            <td data-field="#">${loop.count}</td>
                                                            <td data-field="medicine">${list.medicine.medicineName}</td>
                                                            <td data-field="quantity">${list.quantity}</td>
                                                            <td data-field="unit">${list.medicine.unit}</td>
                                                            <td data-field="description">${list.description_}</td>
                                                            <td>
                                                                <a class="button button-small edit" href="<c:url value='/Doctor/Prescription/Update?medicineID=${list.medicine.medicineID}&quantity=${-list.quantity}&action=delete'/>" title="Delete">
                                                                    <i class="fa fa-trash"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!-- /Medicine Information -->

                                </form>
                                <form action="<c:url value='/Doctor/Prescription/Update'/>" method="post" class="apple-style-form">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="notesTextarea">Note</label>
                                                <textarea class="form-control" name="doctor-notes" id="notesTextarea" rows="4" placeholder="Note for bird"></textarea>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="diagnosisInput">Diagnosis</label>
                                                <input class="form-control" name="diagnosis" id="diagnosisInput" required />
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="treatmentDaysInput">Treatment days</label>
                                                <input class="form-control" name="treatment-days" type="number" value="1" required oninput="validateQuantity(this)">
                                            </div>
                                        </div>
                                    </div>

                                    <button type="submit" name="action" value="submit" class="btn btn-primary btn-lg btn-block">
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
        <script>
            function validateQuantity(input) {
                if (input.value < 1) {
                    input.value = 1;
                }
            }
        </script>
        <!-- /Script -->
    </body>
</html>
