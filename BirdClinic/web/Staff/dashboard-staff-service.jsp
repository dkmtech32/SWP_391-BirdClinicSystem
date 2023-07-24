<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<div class="col-md-8 col-lg-9 col-xl-10">
    <div class="card">
        <div class="card-body pt-0">
            <!-- Tab Menu -->
            <nav class="user-tabs mb-4">
                <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab">Services</a>
                    </li>
                </ul>
            </nav>
            <!-- /Tab Menu -->

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
                                                        <form  action="<c:url value="/Staff/Dashboard/Services/Update"/>" name="serviceForm" method="post">
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
            <!-- Tab Content -->
        </div>
    </div>
</div>
<script>
   function changePrice(selectElement) {
        var selectedValue = selectElement.value;
        var serviceID = selectElement.id;
        console.log("hidden" + serviceID);
        console.log(document.getElementById("hidden"+serviceID).value);
        document.getElementById("hidden"+serviceID).value = selectedValue;
    }
</script>

