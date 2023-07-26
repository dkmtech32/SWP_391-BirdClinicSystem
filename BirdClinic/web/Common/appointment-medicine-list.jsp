<%-- 
    Document   : appointment-medicine-list
    Created on : Jul 7, 2023, 8:36:48 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <body>
        <div class="col-md-12 ">
            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered" >
                        <h2>Medicines</h2>
                        <thead>
                            <tr>
                                <th>Medicine</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Description</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="med" items="${recordMedicines}">
                                <tr>
                                    <td>${med.medicine.medicineName}</td>
                                    <td>${med.quantity} (${med.medicine.unit})</td>
                                    <td>$${med.medicine.medicinePrice}</td>
                                    <td>${med.description_}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                </div>
                </div>
        
    </body>
</html>
