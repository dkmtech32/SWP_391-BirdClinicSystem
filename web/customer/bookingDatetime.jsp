<%-- 
    Document   : booking-all
    Created on : Jun 20, 2023, 10:52:04 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    Doctor view goes here
                                </div>
                            </div>

                            <!-- Schedule Widget -->
                            <div class="card booking-schedule schedule-widget">
                                <!-- Schedule Header -->
                                <div class="schedule-header">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <!-- Day Slot -->
                                            <div class="day-slot">
                                                <ul>
                                                    <li class="left-arrow">
                                                        <a href="#">
                                                            <i class="fa fa-chevron-left"></i>
                                                        </a>
                                                    </li>
                                                    <c:forEach var="slot" items="${requestScope.timeslots}">
                                                        <li>
                                                            <span>${slot.day}</span>
                                                            <span class="slot-date">
                                                                <fmt:formatDate value="${slot.date}" pattern="dd MMM"/>
                                                                <small class="slot-year">
                                                                    <fmt:formatDate value="${slot.date}" pattern="yyyy"/>
                                                                </small>
                                                            </span>
                                                        </li>
                                                    </c:forEach>
                                                    <li class="right-arrow">
                                                        <a href="#">
                                                            <i class="fa fa-chevron-right"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- /Day Slot -->
                                        </div>
                                    </div>
                                </div>
                                <!-- /Schedule Header -->

                                <!-- Schedule Content -->
                                <div class="schedule-cont">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <!-- Time Slot -->
                                            <div class="time-slot">
                                                <ul class="clearfix">

                                                    <select name="timeslotID">
                                                        <c:forEach items="${timeslots}" var="timeslot">
                                                            ${timeslot.day_}, ${timeslot.timeslot}
                                                        </c:forEach>
                                                    </select>

                                                    <c:forEach var="slot" items="${requestScope.timeslots}">
                                                        <li>
                                                            <c:forEach var="time" items="${slot.times}">
                                                                <a class="timing" href="#">
                                                                    <span>${time}</span>
                                                                </a>
                                                            </c:forEach>
                                                        </li>
                                                    </c:forEach>

                                                </ul>
                                            </div>
                                            <!-- /Time Slot -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Schedule Widget -->
<!--                            <div class="card booking-schedule schedule-widget">
                                 Schedule Header 
                                <div class="schedule-header">
                                    <div class="row">
                                        <div class="col-md-12">
                                             Day Slot 
                                            <div class="day-slot">
                                                <ul>
                                                    <c:forEach var="date" items="${week}">
                                                        <li>
                                                            <span>${date.dayOfWeek.toString().substring(0, 3)}</span>
                                                            <span class="slot-date">
                                                                <fmt:formatDate value="${date}" pattern="dd MMM"/>
                                                                <small class="slot-year">${date.year}</small>
                                                            </span>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                             /Day Slot 
                                        </div>
                                    </div>
                                </div>
                                 /Schedule Header 

                                 Schedule Content 
                                <div class="schedule-cont">
                                    <div class="row">
                                        <div class="col-md-12">
                                             Time Slot 
                                            <div class="time-slot">
                                                <ul class="clearfix">
                                                    <c:forEach var="timeslot" items="${timeslots}">
                                                        <c:forEach var="dto" items="${timeslot.value}">
                                                            <li>
                                                                <a class="timing" href="#">
                                                                    <span>${dto.time}</span>
                                                                </a>
                                                            </li>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                             /Time Slot 
                                        </div>
                                    </div>
                                </div>
                                 /Schedule Content 
                            </div>-->
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
