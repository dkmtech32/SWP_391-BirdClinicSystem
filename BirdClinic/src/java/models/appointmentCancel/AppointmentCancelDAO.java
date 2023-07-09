/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.appointmentCancel;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public interface AppointmentCancelDAO extends Serializable {

    void insertAppointmentCancel(AppointmentCancelDTO appointmentCancel) throws SQLException;

    AppointmentCancelDTO readAppointmentCancel(String appointmentID) throws NoSuchRecordExists, SQLException;

    List<AppointmentCancelDTO> readAppointmentCancelsByCustomer(String customerID) throws SQLException, NoSuchRecordExists;

    List<AppointmentCancelDTO> readAppointmentCancelsByIds(List<String> appointmentIds) throws SQLException, NoSuchRecordExists;
    
}
