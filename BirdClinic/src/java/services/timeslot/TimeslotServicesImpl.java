/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.timeslot;

import services.account.doctor.NoSuchDoctorExistsException;
import java.sql.SQLException;
import java.util.List;
import models.dao.doctorTimeslot.DoctorTimeslotDAO;
import models.dao.doctorTimeslot.DoctorTimeslotDAOImpl;
import models.dao.images.ImageDAOImpl;
import models.dao.speciality.SpecialityDAOImpl;
import models.dao.timeslot.TimeslotDAO;
import models.dao.timeslot.TimeslotDAOImpl;
import models.dao.users.doctor.DoctorDAO;
import models.dao.users.doctor.DoctorDAOImpl;
import models.dto.timeslot.TimeslotDTO;
import models.dto.users.doctor.DoctorDTO;

/**
 *
 * @author Admin
 */
public class TimeslotServicesImpl implements TimeslotServices {
    private final TimeslotDAO timeslotDAO;
    private final DoctorTimeslotDAO docTimeDAO;
    private final DoctorDAO doctorDAO;
    
    public TimeslotServicesImpl() {
        doctorDAO = new DoctorDAOImpl(new SpecialityDAOImpl(), new ImageDAOImpl());
        timeslotDAO = new TimeslotDAOImpl();
        docTimeDAO = new DoctorTimeslotDAOImpl(timeslotDAO, doctorDAO);
    }
    
    @Override
    public List<TimeslotDTO> getDoctorTimeslot(String doctorID) 
            throws NoSuchDoctorExistsException, NoDoctorsAvailableException {
        List<TimeslotDTO> timeslots = null;
        
        try {
            timeslots = docTimeDAO.readDoctorTimeslotByDoctor(doctorID);
//            System.out.println("select timeslot size: " + timeslots.size());
            if (timeslots == null) throw new NoSuchDoctorExistsException();
            if (timeslots.isEmpty()) throw new NoDoctorsAvailableException();
        } catch (SQLException ex) {
            throw new NoSuchDoctorExistsException();
        }
        
        return timeslots;
    }
    
    @Override
    public List<TimeslotDTO> getAllTimeslots() throws NoDoctorsAvailableException {
        List<TimeslotDTO> timeslots = null;
        
        try {
            timeslots = timeslotDAO.readAllTimeSlot();
//            System.out.println("all timeslot size: " + timeslots.size());
        } catch (SQLException ex) {
            throw new NoDoctorsAvailableException();
        }
        
        return timeslots;
    }
    
    @Override
    public boolean setNewDocTime(String doctorID, String timeslotID) {
        boolean result = false;
        
        try {
            DoctorDTO doctor = doctorDAO.readDoctor(doctorID);
            TimeslotDTO timeslot = timeslotDAO.readTimeSlot(timeslotID);
            
            if (doctor == null || timeslot == null) throw new SQLException();
            
            result = docTimeDAO.insertDoctorTimeslot(doctorID, timeslotID) > 0;
        } catch (SQLException ex) {
            return false;
        }
        
        return result;
    }
    
    @Override
    public boolean deleteDocTime(String doctorID, String timeslotID) {
        boolean result = false;
        
        try {
            DoctorDTO doctor = doctorDAO.readDoctor(doctorID);
            TimeslotDTO timeslot = timeslotDAO.readTimeSlot(timeslotID);
            
            if (doctor == null || timeslot == null) throw new SQLException();
            
            result = docTimeDAO.deleteDoctorTimeslot(doctorID, timeslotID) > 0;
        } catch (SQLException ex) {
            return false;
        }
        
        return result;
    }
    
    @Override
    public TimeslotDTO getTimeslot(String timeslotID) throws NoSuchTimeslotExistsException {
        TimeslotDTO timeslot = null;
        
        try {
            timeslot = timeslotDAO.readTimeSlot(timeslotID);
        } catch (SQLException ex) {
            throw new NoSuchTimeslotExistsException();
        }
        
        return timeslot;
    }
}
