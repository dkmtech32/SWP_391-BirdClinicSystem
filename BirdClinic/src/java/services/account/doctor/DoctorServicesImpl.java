/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.account.doctor;

import java.sql.SQLException;
import models.dao.images.ImageDAO;
import models.dao.images.ImageDAOImpl;
import models.dao.speciality.SpecialityDAO;
import models.dao.speciality.SpecialityDAOImpl;
import models.dao.users.doctor.DoctorDAO;
import models.dao.users.doctor.DoctorDAOImpl;
import models.dto.users.doctor.DoctorDTO;

/**
 *
 * @author Admin
 */
public class DoctorServicesImpl implements DoctorServices {

    private final ImageDAO imageDAO;
    private final SpecialityDAO specialityDAO;
    private final DoctorDAO doctorDAO;

    public DoctorServicesImpl() {
        imageDAO = new ImageDAOImpl();
        specialityDAO = new SpecialityDAOImpl();
        doctorDAO = new DoctorDAOImpl(specialityDAO, imageDAO);
    }
    
    @Override
    public DoctorDTO getDoctor(String doctorID) throws NoSuchDoctorExistsException {
        DoctorDTO doctor = null;
        
        try {
            doctor = doctorDAO.readDoctor(doctorID);
            if (doctor == null) throw new NoSuchDoctorExistsException();
        } catch (SQLException ex) {
            throw new NoSuchDoctorExistsException();
        }
        
        return doctor;
    }
}
