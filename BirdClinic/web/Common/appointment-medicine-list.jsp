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
        <table class="table table-bordered" >
            <h2>Medicines</h2>
            <thead>
                <tr>
                    <th>Medicine</th>
                    <th>Quantity</th>
                    <!--                    <th>Unit</th>-->
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="med" items="${recordMedicines}">
                    <tr>
                        <td>${med.medicine.medicineName}</td>
                        <td>${med.quantity} (${med.medicine.unit})</td>
                        <!--                    <td></td>  chưa có, này nghĩa là đơn vị (2 viên, 2 gram, vv) -->
                        <td>${med.description}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
