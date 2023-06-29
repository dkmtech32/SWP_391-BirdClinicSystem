/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.appointment;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Map;
import models.dao.appointment.AppointmentDAO;
import models.dao.appointment.AppointmentDAOImpl;
import models.dao.bird.BirdDAO;
import models.dao.bird.BirdDAOImpl;
import models.dao.images.ImageDAO;
import models.dao.images.ImageDAOImpl;
import models.dao.service_.Service_DAO;
import models.dao.service_.Service_DAOImpl;
import models.dao.speciality.SpecialityDAO;
import models.dao.speciality.SpecialityDAOImpl;
import models.dao.timeslot.TimeslotDAO;
import models.dao.timeslot.TimeslotDAOImpl;
import models.dao.users.customer.CustomerDAO;
import models.dao.users.customer.CustomerDAOImpl;
import models.dao.users.doctor.DoctorDAO;
import models.dao.users.doctor.DoctorDAOImpl;
import models.dto.appointment.AppointmentDTO;
import models.dto.appointment.AppointmentDTOImpl;
import models.dto.timeslot.TimeslotDTO;
import models.dto.users.doctor.DoctorDTO;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class AppointmentServicesImpl implements AppointmentServices {

    private final AppointmentDAO appointmentDAO;
    private final TimeslotDAO timeslotDAO;
    private final BirdDAO birdDAO;
    private final DoctorDAO doctorDAO;
    private final Service_DAO serviceDAO;

    public AppointmentServicesImpl() {
        ImageDAO imageDAO = new ImageDAOImpl();
        SpecialityDAO specialityDAO = new SpecialityDAOImpl();
        CustomerDAO customerDAO = new CustomerDAOImpl(imageDAO);

        serviceDAO = new Service_DAOImpl(specialityDAO);
        doctorDAO = new DoctorDAOImpl(specialityDAO, imageDAO);
        timeslotDAO = new TimeslotDAOImpl();
        birdDAO = new BirdDAOImpl(imageDAO, customerDAO);
        appointmentDAO = new AppointmentDAOImpl(birdDAO, doctorDAO, serviceDAO, timeslotDAO);
    }

    @Override
    public AppointmentDTO bookAppointment(Map<String, String> args) throws AppointmentAlreadyExistsException {
        AppointmentDTO app;
        String birdID = args.get("birdID");
        String notes = args.get("notes");
        String timeslotID = args.get("timeslotID");
        String service_ID = args.get("service_ID");
        String appDay = args.get("appDay");
        String doctorID = args.get("doctorID");

        try {
            app = new AppointmentDTOImpl();
            app.setAppointmentID(Utils.hash(birdID + service_ID + timeslotID + appDay));
            app.setAppStatus("processing");
            app.setBird(birdDAO.readBird(birdID));
            TimeslotDTO timeslot = timeslotDAO.readTimeSlot(timeslotID);
            app.setTimeslot(timeslot);
            if (doctorID == null) {
                app.setDoctor(null);
            } else {
                app.setDoctor(doctorDAO.readDoctor(doctorID));
            }
            app.setPayment("cash");
            app.setService_(serviceDAO.readService_(service_ID));
            app.setNotes(notes);

            Date date = Date.valueOf(appDay);
            long milliseconds = date.getTime() + timeslot.getTimeSlot().getTime();
            app.setAppTime(new Timestamp(milliseconds));

            appointmentDAO.insertAppointment(app);
        } catch (SQLException ex) {
            throw new AppointmentAlreadyExistsException();
        }

        return app;
    }

    @Override
    public boolean confirmAppointment(String appointmentID) {
        boolean result = false;

        try {
            AppointmentDTO appointment = appointmentDAO.readAppointment(appointmentID);
            if (appointment != null) {
                if (appointment.getAppStatus().equals("processing")) {
                    appointment.setAppStatus("confirmed");
                    result = true;
                }
            }
        } catch (SQLException ex) {

        }

        return result;
    }

    @Override
    public boolean confirmAppointment(String appointmentID, String doctorID) {
        boolean result = false;

        try {
            AppointmentDTO appointment = appointmentDAO.readAppointment(appointmentID);
            if (appointment != null) {
                DoctorDTO doctor = doctorDAO.readDoctor(doctorID);
                if (doctor != null) {
                    if (appointment.getAppStatus().equals("processing")) {
                        appointment.setAppStatus("confirmed");
                        appointment.setDoctor(doctor);
                        result = true;
                    }
                }
            }
        } catch (SQLException ex) {

        }

        return result;
    }

    @Override
    public boolean checkInAppointment(String appointmentID) {
        boolean result = false;

        try {
            AppointmentDTO appointment = appointmentDAO.readAppointment(appointmentID);
            if (appointment != null) {
                if (appointment.getAppStatus().equals("confirmed")) {
                    appointment.setAppStatus("check-in");
                    result = true;
                }
            }
        } catch (SQLException ex) {

        }

        return result;
    }

    @Override
    public boolean checkOutAppointment(String appointmentID) {
        boolean result = false;

        try {
            AppointmentDTO appointment = appointmentDAO.readAppointment(appointmentID);
            if (appointment != null) {
                if (appointment.getAppStatus().equals("check-in")) {
                    appointment.setAppStatus("complete");
                    result = true;
                }
            }
        } catch (SQLException ex) {

        }

        return result;
    }
}
