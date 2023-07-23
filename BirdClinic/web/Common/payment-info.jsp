<%-- 
    Document   : payment-info
    Created on : Jul 7, 2023, 8:41:07 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="col-md-6">
        <h2>Payment</h2>
        <div class="payment-method">
            <h4>Payment Method</h4> 
            <div class="form-control w-50" name="payment">
                <p>${appointment.payment}</p>
            </div>
        </div>
        <div class="booking-item-wrap-in-appointments-details">
            <ul class="booking-fee-in-appointments-details">
                <li>Service Fee <span class="total-cost-in-appointments-details">$${appointment.service_.servicePrice}</span></li>
                <li>Booking Fee <span class="total-cost-in-appointments-details">$10</span></li>
                <li>Medicine Fee 
                    <c:set var="totalMedPrice" value="0" />
                    <c:forEach var="med" items="${recordMedicines}">
                        <c:set var="medPrice" value="${med.quantity * med.medicine.medicinePrice}" />
                        <c:set var="totalMedPrice" value="${totalMedPrice + medPrice}" />
                    </c:forEach>
                    <c:set var="totalPrice" value="${appointment.service_.servicePrice + totalMedPrice+10}"/>
                   <span class="total-cost-in-appointments-details">$${totalMedPrice}</span>

                </li>

            </ul>
            <div class="booking-total-in-appointments-details">
                <ul class="booking-total-list-in-appointments-details">
                    <li>
                        <span>Total</span>
                        <span class="total-cost-in-appointments-details">$${totalPrice}</span>
                        
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <script>
        var totalPrice = 0;
        var medPrices = document.getElementsByName("medPrice");
        for (var i = 0; i < medPrices.length; i++) {
            totalPrice += parseInt(medPrices[i].textContent);
        }
        document.getElementById("medicineFee").textContent = totalPrice;
    </script>
</html>
