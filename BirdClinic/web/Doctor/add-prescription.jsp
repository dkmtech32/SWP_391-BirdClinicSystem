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
            <div class="text-center fw-bold" id="title">
                <h1 class="mt-3">Prescription Tool for Doctors</h1>

                <hr>
            </div>
            <div class="container-fluid p-5 mt-4" id="prescriptionForm">
                <div class="row">
                    <div class="col-md-4 ">
                        <h3 class="text-center">Details:</h3>
                        <div class="form-group">
                            <label for="name">Customer Name:</label>
                            <input type="text" class="form-control" id="name" value="${requestScope.app.customerName}" readonly>
                        </div>

                        <div class="form-group mt-3">
                            <label for="age">Bird name:</label>
                            <input type="text" class="form-control" id="bird-name" value="${requestScope.app.birdName}" readonly>
                        </div>

                        <div class="form-group mt-3">
                            <label for="address">Breed:</label>
                            <input class="form-control" id="breed" value="${requestScope.app.birdBreed}" readonly>
                        </div>

                        <div class="form-group mt-3">
                            <label for="gender">Bird Gender:</label>
                            <select class="form-select" aria-label="Default select example"  id="gender" disabled>
                                <option value="${requestScope.app.birdSex}">${requestScope.app.birdSex} </option>
                            </select>
                        </div>

                        <div class="form-group mt-3">
                            <label for="date">Date:</label>
                            <input type="date" class="form-control" value="${requestScope.app.date}" id="date" readonly>
                        </div>
                        <div class="form-group mt-3">
                            <label for="address">Diagnosis:</label>
                            <input class="form-control" id="diagnosis" placeholder="Identify the cause of symtoms" >
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
