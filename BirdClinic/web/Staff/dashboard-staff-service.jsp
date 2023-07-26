<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<div class="col-md-8 col-lg-9 col-xl-10">
    <!-- Impressive UI-UX Header -->
    <div class="header mb-4">
        <div class="row align-items-center">
            <div class="col-md-6">
                <h3 class="page-title">Services</h3>
            </div>
            <div class="col-md-6 text-md-right">
                <button class="btn btn-primary add-btn" data-toggle="modal" data-target="#addServiceModal">
                    <i class="fa fa-plus"></i> Add Service
                </button>
            </div>
        </div>
    </div>
    <!-- /Impressive UI-UX Header -->

    <div class="card">
        <div class="card-body">
            <!-- Tab Content -->
            <div class="tab-content pt-0">
                <!-- Appointment Tab -->
                <div id="pat_appointments" class="tab-pane fade show active">
                    <div class="card card-table mb-0">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-center mb-0">
                                    <thead>
                                        <tr>
                                            <th>Service Name</th>
                                            <th>Service Price</th>
                                            <th>Specialty</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="service" items="${services}">
                                            <tr>
                                                <td>${service.serviceName}</td>
                                                <td>
                                                    <input type="number" name="servicePrice" value="${service.servicePrice}" id="${service.serviceID}" onchange="changePrice(this)"/>
                                                </td>
                                                <td>${service.speciality.specialityName}</td>
                                                <td class="text-right">
                                                    <div class="table-action">
                                                        <form action="<c:url value="/Staff/Dashboard/Services/Update"/>" name="serviceForm" method="post">
                                                            <input type="hidden" name="serviceID" value="${service.serviceID}" />
                                                            <input type="hidden" name="service-price" id="hidden${service.serviceID}" value="${service.servicePrice}" required />
                                                            <button class=" btn btn-sm bg-success-light" type="submit">
                                                                <i class="fa-solid fa-pen-to-square"></i>
                                                                Edit
                                                            </button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Appointment Tab -->
            </div>
            <!-- /Tab Content -->
        </div>
    </div>
</div>

<!--modal-->

<div class="modal fade" id="addServiceModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit Service</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Add your form fields here for editing the service details -->
                <div class="form-group">
                    <label for="serviceName">Service Name</label>
                    <input type="text" class="form-control" id="serviceName">
                </div>
                <div class="form-group">
                    <label for="servicePrice">Service Price</label>
                    <input type="number" class="form-control" id="servicePrice">
                </div>
                <div class="form-group">
                    <label for="specialty">Specialty</label>
                    <select class="form-control" id="specialty">
                        <option value="">Select a specialty</option>
                        <option value="option1">Option 1</option>
                        <option value="option2">Option 2</option>
                        <option value="option3">Option 3</option>
                        
                    </select>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Save Changes</button>
            </div>
        </div>
    </div>
</div>
<!--modal-->


<script>
    function changePrice(selectElement) {
        var selectedValue = selectElement.value;
        var serviceID = selectElement.id;
        console.log("hidden" + serviceID);
        console.log(document.getElementById("hidden" + serviceID).value);
        document.getElementById("hidden" + serviceID).value = selectedValue;
    }
</script>

