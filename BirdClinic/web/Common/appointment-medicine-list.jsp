<%-- 
    Document   : appointment-medicine-list
    Created on : Jul 7, 2023, 8:36:48 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <table class="table table-bordered" >
            <h2>Medicines</h2>
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
                    <td>${medicinie.medicineName}</td>
                    <td>${medicinie.quantity}</td>
                    <td>${medicinie.unit}</td> <!-- chưa có, này nghĩa là đơn vị (2 viên, 2 gram, vv) -->
                    <td>${medicinie.descriptions}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
