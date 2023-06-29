package models.dao.appointment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.DBUtils;
import java.util.List;
import models.dao.bird.BirdDAO;
import models.dao.users.doctor.DoctorDAO;
import models.dao.timeslot.TimeslotDAO;
import models.dao.service_.Service_DAO;
import models.dto.appointment.AppointmentDTO;
import models.dto.appointment.AppointmentDTOImpl;
import models.dto.bird.BirdDTO;

public class AppointmentDAOImpl implements AppointmentDAO {

    private final BirdDAO BirdDAO;
    private final DoctorDAO DoctorDAO;
    private final Service_DAO Service_DAO;
    private final TimeslotDAO TimeslotDAO;

    private static final String READ_APPOINTMENT = "SELECT * FROM Appointment WHERE appointmentID = ?";
    private static final String READ_APPOINTMENT_BY_BIRD = "SELECT * FROM Appointment WHERE birdID = ?";
    private static final String READ_APPOINTMENT_BY_DOCTOR = "SELECT * FROM Appointment WHERE doctorID = ?";
    private static final String READ_APPOINTMENT_BY_TIMESLOT = "SELECT * FROM Appointment WHERE timeslotID = ?";
    private static final String DELETE_APPOINTMENT = "DELETE FROM Appointment WHERE appointmentID = ?";
    private static final String INSERT_APPOINTMENT = "INSERT INTO Appointment (appointmentID, birdID, doctorID, timeslotID, serviceID, appTime, notes, payment, appStatus) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_APPOINTMENT = "UPDATE Appointment SET birdID = ?, doctorID = ?, timeslotID = ?, serviceID = ?, appTime = ?, notes = ?, payment = ?, appStatus = ? WHERE appointmentID = ?";

    public AppointmentDAOImpl(BirdDAO birdDAO, DoctorDAO doctorDAO,
            Service_DAO service_DAO, TimeslotDAO timeslotDAO) {
        BirdDAO = birdDAO;
        DoctorDAO = doctorDAO;
        Service_DAO = service_DAO;
        TimeslotDAO = timeslotDAO;
    }

    @Override
    public AppointmentDTO readAppointment(String appointmentID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AppointmentDTO appointment = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_APPOINTMENT);
            stm.setString(1, appointmentID);
            rs = stm.executeQuery();

            if (rs.next()) {
                appointment = mapAppointment(rs, con);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return appointment;
    }

    @Override
    public AppointmentDTO readAppointment(String appointmentID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        AppointmentDTO appointment = null;

        try {
            stm = con.prepareStatement(READ_APPOINTMENT);
            stm.setString(1, appointmentID);
            rs = stm.executeQuery();

            if (rs.next()) {
                appointment = mapAppointment(rs, con);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }

        return appointment;
    }

    @Override
    public List<AppointmentDTO> readAppointmentByBird(String birdID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointmentList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_APPOINTMENT_BY_BIRD);
            stm.setString(1, birdID);
            rs = stm.executeQuery();

            while (rs.next()) {
                AppointmentDTO appointment = mapAppointment(rs, con);
                if (appointmentList == null) {
                    appointmentList = new ArrayList<>();
                }
                appointmentList.add(appointment);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return appointmentList;
    }

    @Override
    public List<AppointmentDTO> readAppointmentByBird(String birdID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointmentList = null;

        try {
            stm = con.prepareStatement(READ_APPOINTMENT_BY_BIRD);
            stm.setString(1, birdID);
            rs = stm.executeQuery();

            while (rs.next()) {
                AppointmentDTO appointment = mapAppointment(rs, con);
                if (appointmentList == null) {
                    appointmentList = new ArrayList<>();
                }
                appointmentList.add(appointment);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }

        return appointmentList;
    }

    @Override
    public List<AppointmentDTO> readAppointmentByDoctor(String doctorID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointmentList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_APPOINTMENT_BY_DOCTOR);
            stm.setString(1, doctorID);
            rs = stm.executeQuery();

            while (rs.next()) {
                AppointmentDTO appointment = mapAppointment(rs, con);
                if (appointmentList == null) {
                    appointmentList = new ArrayList<>();
                }
                appointmentList.add(appointment);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return appointmentList;
    }

    @Override
    public List<AppointmentDTO> readAppointmentByDoctor(String doctorID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointmentList = null;

        try {
            stm = con.prepareStatement(READ_APPOINTMENT_BY_DOCTOR);
            stm.setString(1, doctorID);
            rs = stm.executeQuery();

            while (rs.next()) {
                AppointmentDTO appointment = mapAppointment(rs, con);
                if (appointmentList == null) {
                    appointmentList = new ArrayList<>();
                }
                appointmentList.add(appointment);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }

        return appointmentList;
    }

    @Override
    public List<AppointmentDTO> readAppointmentByCustomer(String customerID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointmentList = null;

        try {
            con = DBUtils.getConnection();
            List<BirdDTO> birds = BirdDAO.readAllBirdByCustomer(customerID, con);
            for (BirdDTO bird : birds) {
                stm = con.prepareStatement(READ_APPOINTMENT_BY_BIRD);
                stm.setString(1, bird.getBirdID());
                rs = stm.executeQuery();
                while (rs.next()) {
                    AppointmentDTO appointment = mapAppointment(rs, con);
                    if (appointmentList == null) {
                        appointmentList = new ArrayList<>();
                    }
                    appointmentList.add(appointment);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return appointmentList;
    }

    @Override
    public List<AppointmentDTO> readAppointmentByCustomer(String customerID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointmentList = null;

        try {
            List<BirdDTO> birds = BirdDAO.readAllBirdByCustomer(customerID, con);
            for (BirdDTO bird : birds) {
                stm = con.prepareStatement(READ_APPOINTMENT_BY_BIRD);
                stm.setString(1, bird.getBirdID());
                rs = stm.executeQuery();
                while (rs.next()) {
                    AppointmentDTO appointment = mapAppointment(rs, con);
                    if (appointmentList == null) {
                        appointmentList = new ArrayList<>();
                    }
                    appointmentList.add(appointment);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }

        return appointmentList;
    }

    @Override
    public List<AppointmentDTO> readAppointmentByTimeslot(String timeslotID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointmentList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_APPOINTMENT_BY_TIMESLOT);
            stm.setString(1, timeslotID);
            rs = stm.executeQuery();

            while (rs.next()) {
                AppointmentDTO appointment = mapAppointment(rs, con);
                if (appointmentList == null) {
                    appointmentList = new ArrayList<>();
                }
                appointmentList.add(appointment);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return appointmentList;
    }

    @Override
    public List<AppointmentDTO> readAppointmentByTimeslot(String timeslotID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointmentList = null;

        try {
            stm = con.prepareStatement(READ_APPOINTMENT_BY_TIMESLOT);
            stm.setString(1, timeslotID);
            rs = stm.executeQuery();

            while (rs.next()) {
                AppointmentDTO appointment = mapAppointment(rs, con);
                if (appointmentList == null) {
                    appointmentList = new ArrayList<>();
                }
                appointmentList.add(appointment);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }

        return appointmentList;
    }

    @Override
    public int deleteAppointment(String appointmentID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int rowsDeleted = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_APPOINTMENT);
            stm.setString(1, appointmentID);
            rowsDeleted = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return rowsDeleted;
    }

    @Override
    public int deleteAppointment(String appointmentID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        int rowsDeleted = 0;

        try {
            stm = con.prepareStatement(DELETE_APPOINTMENT);
            stm.setString(1, appointmentID);
            rowsDeleted = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
        }

        return rowsDeleted;
    }

    @Override
    public int insertAppointment(AppointmentDTO appointment) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int rowsInserted = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_APPOINTMENT);
            stm.setString(1, appointment.getAppointmentID());
            stm.setString(2, appointment.getBird().getBirdID());
            if (appointment.getDoctor() != null) {
                stm.setString(3, appointment.getDoctor().getUserID());
            } else {
                stm.setString(3, null);
            }
            stm.setString(4, appointment.getTimeslot().getTimeSlotID());
            stm.setString(5, appointment.getService_().getServiceID());
            stm.setTimestamp(6, appointment.getAppTime());
            stm.setString(7, appointment.getNotes());
            stm.setString(8, appointment.getPayment());
            stm.setString(9, appointment.getAppStatus());
            rowsInserted = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return rowsInserted;
    }

    @Override
    public int insertAppointment(AppointmentDTO appointment, Connection con) throws SQLException {
        PreparedStatement stm = null;
        int rowsInserted = 0;

        try {
            stm = con.prepareStatement(INSERT_APPOINTMENT);
            stm.setString(1, appointment.getAppointmentID());
            stm.setString(2, appointment.getBird().getBirdID());
            if (appointment.getDoctor() != null) {
                stm.setString(3, appointment.getDoctor().getUserID());
            } else {
                stm.setString(3, null);
            }
            stm.setString(4, appointment.getTimeslot().getTimeSlotID());
            stm.setString(5, appointment.getService_().getServiceID());
            stm.setTimestamp(6, appointment.getAppTime());
            stm.setString(7, appointment.getNotes());
            stm.setString(8, appointment.getPayment());
            stm.setString(9, appointment.getAppStatus());
            rowsInserted = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
        }

        return rowsInserted;
    }

    @Override
    public int updateAppointment(AppointmentDTO appointment) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int rowsUpdated = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_APPOINTMENT);
            stm.setString(1, appointment.getAppointmentID());
            stm.setString(2, appointment.getBird().getBirdID());
            if (appointment.getDoctor() != null) {
                stm.setString(3, appointment.getDoctor().getUserID());
            } else {
                stm.setString(3, null);
            }
            stm.setString(4, appointment.getTimeslot().getTimeSlotID());
            stm.setString(5, appointment.getService_().getServiceID());
            stm.setTimestamp(6, appointment.getAppTime());
            stm.setString(7, appointment.getNotes());
            stm.setString(8, appointment.getPayment());
            stm.setString(9, appointment.getAppStatus());
            rowsUpdated = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return rowsUpdated;
    }

    @Override
    public int updateAppointment(AppointmentDTO appointment, Connection con) throws SQLException {
        PreparedStatement stm = null;
        int rowsUpdated = 0;

        try {
            stm = con.prepareStatement(UPDATE_APPOINTMENT);
            stm.setString(1, appointment.getAppointmentID());
            stm.setString(2, appointment.getBird().getBirdID());
            if (appointment.getDoctor() != null) {
                stm.setString(3, appointment.getDoctor().getUserID());
            } else {
                stm.setString(3, null);
            }
            stm.setString(4, appointment.getTimeslot().getTimeSlotID());
            stm.setString(5, appointment.getService_().getServiceID());
            stm.setTimestamp(6, appointment.getAppTime());
            stm.setString(7, appointment.getNotes());
            stm.setString(8, appointment.getPayment());
            stm.setString(9, appointment.getAppStatus());
            rowsUpdated = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
        }

        return rowsUpdated;
    }

    private AppointmentDTO mapAppointment(ResultSet rs, Connection con) throws SQLException {
        AppointmentDTO appointment = new AppointmentDTOImpl();
        appointment.setAppointmentID(rs.getString("appointmentID"));
        appointment.setBird(BirdDAO.readBird(rs.getString("birdID"), con));
        if (rs.getString("doctorID") != null) {
            appointment.setDoctor(DoctorDAO.readDoctor("doctorID"));
        } else {
            appointment.setDoctor(null);
        }
        appointment.setTimeslot(TimeslotDAO.readTimeSlot("timeslotID"));
        appointment.setService_(Service_DAO.readService_("serviceID"));
        appointment.setAppTime(rs.getTimestamp("appTime"));
        appointment.setNotes(rs.getString("notes"));
        appointment.setPayment(rs.getString("payment"));
        appointment.setAppStatus(rs.getString("appStatus"));
        return appointment;
    }
}
