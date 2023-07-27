<%-- 
    Document   : payment-info
    Created on : Jul 7, 2023, 8:41:07 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<script>
    var totalPrice = 0;
    var medPrices = document.getElementsByName("medPrice");
    for (var i = 0; i < medPrices.length; i++) {
        totalPrice += parseInt(medPrices[i].textContent);
    }
    document.getElementById("medicineFee").textContent = totalPrice;
</script>
