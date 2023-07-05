<%-- 
    Document   : booking-all
    Created on : Jun 20, 2023, 10:52:04 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../Common/head.jsp"/>
    <body>
        <!-- Main Wrapper -->
        <div class="main-wrapper">
            <!-- Header -->
            <jsp:include page="../Common/header.jsp"/>
            <!--/Header -->

            <!-- Breadcrumb -->
            <jsp:include page="../Common/breadcrumb.jsp"/>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <!--Doctor view goes here-->
                                </div>
                            </div>

                            <!-- Schedule Widget -->
                            <div class="card booking-schedule schedule-widget">
                                <!-- Schedule Widget -->
                                <div class="card booking-schedule schedule-widget">
                                    <!-- Schedule Header -->
                                    <div class="schedule-header">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <!-- Day Slot -->
                                                <div class="day-slot">
                                                    <ul>
                                                        <c:if test="${not empty requestScope.lastWeekday}">
                                                            <li class="left-arrow">
                                                                <a href="
                                                                   <c:url value="/Customer/prepareDatetime?currentWeekday=${requestScope.lastWeekday.toString().trim()}"/>
                                                                   <c:if test="${not empty param.doctorID}">&doctorID=${param.doctorID}</c:if>
                                                                       ">
                                                                       <i class="fa fa-chevron-left"></i>
                                                                   </a>
                                                                </li>
                                                        </c:if>
                                                        <c:forEach var="date" items="${daysInWeek}">
                                                            <li>
                                                                <span>${date.key}</span>
                                                                <span class="slot-date">
                                                                    <fmt:formatDate value="${date.value}" pattern="dd MMM"/>
                                                                    <small class="slot-year">${fn:substring(date.value, 0, 4)}</small>
                                                                </span>
                                                            </li>
                                                        </c:forEach>
                                                        <c:if test="${not empty requestScope.nextWeekday}">
                                                            <li class="right-arrow">
                                                                <a href="
                                                                   <c:url value="/Customer/prepareDatetime?currentWeekday=${requestScope.nextWeekday}"/>
                                                                   <c:if test="${not empty param.doctorID}">&doctorID=${param.doctorID}</c:if>
                                                                       ">
                                                                       <i class="fa fa-chevron-right"></i>
                                                                   </a>
                                                                </li>
                                                        </c:if>
                                                    </ul>
                                                </div>
                                                <!-- /Day Slot -->
                                            </div>
                                        </div>
                                    </div>
                                    <!--/Schedule Header -->

                                    <!--Schedule Content -->
                                    <div class="schedule-cont">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <!-- Time Slot -->
                                                <div class="time-slot">
                                                    <ul class="clearfix">
                                                        <c:forEach var="timeslot" items="${timeslots}">
                                                            <c:forEach var="dto" items="${timeslot.value}">
                                                                <li>
                                                                    <a class="timing" href="
                                                                       <c:url value="/Customer/prepareBooking?timeslotID=${dto.timeSlotID}&appDate=${daysInWeek[dto.day_].toString().trim()}"/>
                                                                       <c:if test="${not empty param.doctorID}">&doctorID=${param.doctorID}</c:if>
                                                                           ">
                                                                           <span>${dto.timeSlot}</span>
                                                                    </a>
                                                                </li>
                                                            </c:forEach>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                                <!-- /Time Slot -->
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Schedule Content -->
                                </div>
                                <!-- /Schedule Widget -->

                                <c:if test="${not empty doctorID}">
                                    <input hidden="hidden" value="${doctorID}"/>
                                </c:if>
                                <!-- Submit Section -->

                                <input type="submit"/>

                                <c:choose>
                                    <c:when test="${param.doctor == 'all'}">                                 
                                        <div class="submit-section proceed-btn text-right">
                                            <a onclick="location.href = '../Customer/bookInfo.jsp?doctor=all'" class="btn btn-primary submit-btn">Next</a>
                                        </div>
                                    </c:when>
                                    <c:when test="${param.doctor == 'doc'}">
                                        <div class="submit-section proceed-btn text-right">
                                            <a onclick="location.href = '../Customer/bookInfo.jsp?doctor=doc'" class="btn btn-primary submit-btn">Next</a>
                                        </div>
                                    </c:when>                                       
                                </c:choose>


                                <!-- /Submit Section -->
                            </div>
                        </div>
                    </div>
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