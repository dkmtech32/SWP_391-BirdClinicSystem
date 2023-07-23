<%-- 
    Document   : booking-all
    Created on : Jun 20, 2023, 10:52:04 PM
    Author     : Legion
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />

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
                                    <c:choose>
                                        <c:when test="${not empty param.doctorID}">
                                            <div class="booking-doc-info">
                                                <a href="<c:url value="/View/Doctor?userID=${requestScope.doctor.userID}"/>" class="booking-doc-img">
                                                    <img src="<c:url value="/assets/images/doctors/${requestScope.doctor.image.imageURLName}"/>" alt="${requestScope.doctor.userName}" />
                                                </a>
                                                <div class="booking-info">
                                                    <h4><a href="<c:url value="/View/Doctor?userID=${requestScope.doctor.userID}"/>">${requestScope.doctor.fullName}</a></h4>                                          
                                                    <p class="text-muted mb-0"><i class="fa-regular fa-hourglass-half"></i> ${requestScope.doctor.yearsOfExperience} (years of EXP)</p>
                                                    <p class="text-muted mb-0" style="text-transform: capitalize">${requestScope.doctor.speciality.specialityName}</p>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${empty param.doctorID}">
                                            <div class="booking-doc-info">
                                                <a href="" class="booking-doc-img">
                                                    <img src="<c:url value="/assets/images/favicon.svg"/>" alt="User Image" />
                                                </a>
                                                <div class="booking-info">
                                                    <h4><a href="">BirdLover Clinic</a></h4>                                          
                                                    <div class="clinic-details">
                                                        <p class="doc-location"><i class="fas fa-map-marker-alt"></i> District 1, Ho Chi Minh City</p>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>

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
                                                        <c:forEach var="date" varStatus="index" items="${daysInWeek}">
                                                            <li>
                                                                <span>${requestScope.weekdays[index.index]}</span>
                                                                <span class="slot-date">
                                                                    <fmt:formatDate value="${date}" pattern="dd MMM"/>
                                                                    <small class="slot-year">${fn:substring(date, 0, 4)}</small>
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
                                                        <c:forEach var="timeslotList" items="${timeslots}" varStatus="index">
                                                            <li>
                                                                <c:choose>
                                                                    <c:when test="${not empty timeslotList}">
                                                                        <c:forEach var="timeslotMap" items="${timeslotList}" varStatus="count">
                                                                            <c:forEach var="entry" items="${timeslotMap}">
                                                                                <c:set var="timeslot" value="${entry.key}" />
                                                                                <c:set var="isLate" value="${entry.value}" />
                                                                                <c:choose>
                                                                                    <c:when test="${isLate}">
                                                                                        <a class="timing" href="
                                                                                           <c:url value="/Customer/prepareBooking">
                                                                                               <c:param name="timeslotID" value="${timeslot.timeSlotID}" />
                                                                                               <c:param name="timeSlot" value="${timeslot.timeSlot}" />
                                                                                               <c:param name="appDate" value="${daysInWeek[index.index].toString().trim()}" />
                                                                                               <c:if test="${not empty param.doctorID}">
                                                                                                   <c:param name="doctorID" value="${param.doctorID}" />
                                                                                               </c:if>
                                                                                           </c:url>
                                                                                           ">
                                                                                            <span>${timeslot.timeSlot}</span>
                                                                                        </a>
                                                                                    </c:when>
                                                                                    <c:when test="${!isLate}">
                                                                                        <a class="timing-occupied" style="opacity: 0">
                                                                                            <span>${timeslot.timeSlot}</span> 
                                                                                        </a>
                                                                                    </c:when>
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:when test="${empty timeslotList}">
                                                                        <a class="timingEmpty">
                                                                            <span></span>
                                                                        </a>
                                                                    </c:when>
                                                                </c:choose>
                                                            </li>
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