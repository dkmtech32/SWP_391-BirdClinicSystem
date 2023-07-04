<%-- 
    Document   : header
    Created on : 26/06/2023, 1:00:39 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:choose>
    <c:when test="${sessionScope.service.currentUser.userRole == 'customer'}">
        <jsp:include page="../Common/header-customer.jsp"/>
    </c:when>
    <c:when test="${sessionScope.service.currentUser.userRole == 'doctor'}">
        <jsp:include page="../Common/header-doctor.jsp"/>
    </c:when>
    <c:when test="${sessionScope.service.currentUser.userRole == 'staff'}">
        <jsp:include page="../Common/header-staff.jsp"/>
    </c:when>
    <c:when test="${sessionScope.service.currentUser.userRole == 'admin'}">
        <jsp:include page="../Common/header-admin.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="../Common/header-guest.jsp"/>
    </c:otherwise>
</c:choose>
