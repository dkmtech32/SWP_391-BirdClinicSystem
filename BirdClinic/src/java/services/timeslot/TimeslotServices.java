/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.timeslot;

import services.account.doctor.NoSuchDoctorExistsException;
import java.io.Serializable;
import java.util.List;
import models.dto.timeslot.TimeslotDTO;

/**
 *
 * @author Admin
 */
public interface TimeslotServices extends Serializable {

    boolean deleteDocTime(String doctorID, String timeslotID);

    List<TimeslotDTO> getAllTimeslots() throws NoDoctorsAvailableException;

    List<TimeslotDTO> getDoctorTimeslot(String doctorID) throws NoSuchDoctorExistsException, NoDoctorsAvailableException;

    boolean setNewDocTime(String doctorID, String timeslotID);
    
}
