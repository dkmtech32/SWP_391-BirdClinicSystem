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
            <div class="container-fluid p-5 mt-4" id="prescriptionForm">
                <div class="card">
                    <div class="card-body">                      
                        <div class="row">
                            <div class="row col-md-4">
                                <div class="widget-profile pro-widget-content">
                                    <div class="profile-info-widget">
                                        <a href="#" class="booking-doc-img">
                                            <img src="<c:url value='/assets/images/bird/${medicalRecord.appointment.bird.image.imageURLName}'/>" alt="User Image">
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>${appointment.bird.birdFullname}</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row bird-information-boxes">
                                    <!--                <div class="col-12 col-md-6">
                                                        <p class="header">Bird's name</p>
                                                        <p class="information"></p>
                                                    </div>-->
                                    <div class="col-12 col-md-6">
                                        <p class="title">Hatching Day: </p>
                                        <p class="information">${appointment.bird.hatchingDate}</p>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <p class="title">Breed: </p>
                                        <p class="information">${appointment.bird.breed}</p>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <p class="title">Sex: </p>
                                        <p class="information">${appointment.bird.birdGender}</p>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <p class="title">Weight: </p>
                                        <p class="information">${appointment.bird.birdWeight}</p>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <p class="title">Microchip: </p>  
                                        <p class="information">${appointment.bird.band_Chip}</p>
                                    </div>
                                    <!--                            <div class="col-12 col-md-6">
                                                                    <p>Sex Method</p>
                                                                    <p class="information"></p>
                                                                </div>-->
                                    <div class="col-12 col-md-6">
                                        <p class="title">Feather Color: </p>
                                        <p class="information">${appointment.bird.featherColor}</p>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <div class="form-control">${appointment.bird.customer.fullName}</div>
                                    </div>
                                </div>

                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Date of Birth</label>
                                        <div class="cal-icon">
                                            <div class="form-control datetimepicker">${appointment.bird.customer.dob}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Address</label>
                                        <div class="form-control">${appointment.bird.customer.customerAddress}</div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <div class="form-control">${appointment.bird.customer.email}</div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label>Mobile</label>
                                        <div class="form-control">${appointment.bird.customer.phoneNumber}</div> 
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <h3 class="text-center prescription">Prescription:</h3>

                                <form action="" method="">
                                    <!-- Medicine Information -->
                                    <div class="info-widget">
                                        <h4 class="card-title">Add medicine</h4>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group card-label">
                                                    <label>Medicine name</label>
                                                    <select class="js-example-basic-single" name="state">
                                                        <c:forEach var="list" items="${requestScope.drugList}">
                                                            <option value="${list.name}">${list.name} (${list.unit})</option>                           
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
                                        <button name="" type="submit" class="btn btn-primary submit-btn">Add</button>
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
                                                <c:forEach var="list" items="${requestScope.prescript}" varStatus="loop">
                                                    <tr >
                                                        <td data-field="#">${loop.index}</td>
                                                        <td data-field="medicine">${list.medName}</td>
                                                        <td data-field="quantity">${list.quantity}</td>
                                                        <td data-field="unit">${list.unit}</td>
                                                        <td data-field="description">${list.description}</td>
                                                        <td>											
                                                            <a class="button button-small edit" title="Delete" >
                                                                <i class="fa fa-trash"></i>
                                                            </a>
                                                        </td>
                                                    </tr>

                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div class="info-widget">
                                    <h4 class="card-title">Notes</h4>						
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">													
                                            <textarea class="form-control" name="prescriptionNote" rows="4" placeholder="Note for bird" ></textarea>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>     

                <button onclick="" name="action" value="addPrescript" class="btn btn-dark d-flex justify-content-center mx-auto mt-2">
                    Submit
                </button>
            </div>

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
