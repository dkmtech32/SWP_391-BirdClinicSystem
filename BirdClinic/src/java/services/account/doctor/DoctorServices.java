/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.account.doctor;

import java.io.Serializable;
import models.dto.users.doctor.DoctorDTO;

/**
 *
 * @author Admin
 */
public interface DoctorServices extends Serializable {

    DoctorDTO getDoctor(String doctorID) throws NoSuchDoctorExistsException;
    
}
