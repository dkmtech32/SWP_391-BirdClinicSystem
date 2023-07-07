<%-- 
    Document   : appointment-general-info
    Created on : Jul 7, 2023, 8:34:50 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <table class="table table-bordered" >
            <h2>General Information</h2>
            <thead>
                <tr>
                    <th>Date of diagnosis</th>
                    <th>Appointment Time</th>
                    <th>Service</th>
                    <th>Owner's Note</th>
                    <th>Diagnosis</th>
                    <th>Doctor's Note</th>
                </tr>
            </thead>
            <tbody>
                <tr >
                    <td>${appoitment.date}</td>
                    <td>${medicalRecord.recordTime}</td>
                    <td>${appoitment.service}</td>
                    <td style="word-wrap: break-word; max-width: 300px;">${appoitment.ownerNote}</td> <!-- chưa có -->
                    <td>${medicalRecord.diagnosis}</td>
                    <td style="word-wrap: break-word; max-width: 300px;">${medicalRecord.doctorNote}</td>  <!-- chưa có -->
                </tr>
            </tbody>
        </table>
    </body>
</html>
