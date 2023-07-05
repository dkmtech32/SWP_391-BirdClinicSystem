/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.doctor;

import java.sql.SQLException;
import models.exceptions.NoSuchRecordExists;
import models.users.UserDTO;
import models.users.doctor.DoctorDTO;
import services.general.GeneralServicesImpl;

/**
 *
 * @author Admin
 */
public class DoctorServicesImpl extends GeneralServicesImpl {

    public DoctorServicesImpl(UserDTO currentUser) throws SQLException {
        super();
        String doctorID = currentUser.getUserID();
        try {
            DoctorDTO doctor = doctorDAO.readDoctor(doctorID);
            this.currentUser = doctor;
        } catch (NoSuchRecordExists ex) {
            //impossible bc controller will check role and initiates the right service -> db problem
            throw new SQLException(ex.getMessage());
        }

    }
    
    
}
