<%-- 
    Document   : payment-info
    Created on : Jul 7, 2023, 8:41:07 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <div class="booking-summary-in-appointments-details">
            <h2>Payment</h2>
            <div class="payment-method">
                <h4>Payment Method</h4> 
                <div class="form-control select w-75" name="payment">
                    <option value="cash" >cash</option>
                    <option value="banking account">banking account</option>
                    <option value="credit card">credit card</option>                    
                </div>
            </div>
            <div class="booking-item-wrap-in-appointments-details">
                <ul class="booking-fee-in-appointments-details">
                    <li>Service Fee<span>${medicinie.serviceFee}</span></li>
                    <li>Booking Fee<span>${medicinie.bookingFee}</span></li>
                    <li>Medicine Fee<span>${medicinie.medicinePriceTotal}</span></li>
                </ul>
                <div class="booking-total-in-appointments-details">
                    <ul class="booking-total-list-in-appointments-details">
                        <li>
                            <span>Total</span>
                            <span class="total-cost-in-appointments-details">${medicinie.totalMoney}</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
