package models.appointment;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import utils.DBUtils;
import java.util.List;
import models.bird.BirdDAO;
import models.users.doctor.DoctorDAO;
import models.timeslot.TimeslotDAO;
import models.service_.Service_DAO;
import models.bird.BirdDTO;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.service_.Service_DTO;
import models.timeslot.TimeslotDTO;
import models.users.doctor.DoctorDTO;

public class AppointmentDAOImpl implements AppointmentDAO {

    private final BirdDAO birdDAO;
    private final DoctorDAO doctorDAO;
    private final Service_DAO service_DAO;
    private final TimeslotDAO timeslotDAO;

    private static final String READ_APPOINTMENT
            = "SELECT appointmentID, birdID, doctorID, timeSlotID, appTime, notes, payment, appStatus, totalPrice "
            + "FROM Appointment "
            + "WHERE appointmentID = ?;";
    private static final String READ_ALL_APPOINTMENT
            = "SELECT appointmentID, birdID, doctorID, timeSlotID, appTime, notes, payment, appStatus, totalPrice "
            + "FROM Appointment ";
    private static final String READ_APPOINTMENT_BY_STATUS
            = "SELECT appointmentID, birdID, doctorID, timeSlotID, appTime, notes, payment, appStatus, totalPrice "
            + "FROM Appointment "
            + "WHERE appStatus like ?;";
    private static final String READ_APPOINTMENT_BY_BIRD
            = "SELECT appointmentID, birdID, doctorID, timeSlotID, appTime, notes, payment, appStatus, totalPrice "
            + "FROM Appointment "
            + "WHERE birdID = ?;";
    private static final String READ_APPOINTMENT_BY_DOCTOR
            = "SELECT appointmentID, birdID, doctorID, timeSlotID, appTime, notes, payment, appStatus, totalPrice "
            + "FROM Appointment "
            + "WHERE doctorID = ?;";
    private static final String READ_APPOINTMENT_BY_DOCTIME
            = "SELECT appointmentID, birdID, doctorID, timeSlotID, appTime, notes, payment, appStatu, totalPrices "
            + "FROM Appointment "
            + "WHERE doctorID = ? AND timeSlotID = ? and appTime=? and appStatus!='cancelled' and appStatus!='complete';";
    private static final String READ_APPOINTMENT_BY_TIMESLOT
            = "SELECT appointmentID, birdID, doctorID, timeSlotID, appTime, notes, payment, appStatus, totalPrice "
            + "FROM Appointment "
            + "WHERE timeSlotID = ?;";
    private static final String READ_APPOINTMENT_BY_DATE
            = "SELECT appointmentID, birdID, doctorID, timeSlotID, appTime, notes, payment, appStatus, totalPrice "
            + "FROM Appointment "
            + "WHERE appTime between ? and ?";
    private static final String DELETE_APPOINTMENT
            = "DELETE FROM Appointment "
            + "WHERE appointmentID = ?";
    private static final String INSERT_APPOINTMENT
            = "INSERT INTO Appointment (appointmentID, birdID, doctorID, timeSlotID, "
            + "appTime, notes, payment, appStatus, totalPrice) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String UPDATE_APPOINTMENT
            = "UPDATE Appointment "
            + "SET birdID = ?, doctorID = ?, timeSlotID = ?, "
            + "appTime = ?, notes = ?, payment = ?, appStatus = ?, totalPrice = ? "
            + "WHERE appointmentID = ?;";
    private static final String UPDATE_APPOINTMENT_STATUS
            = "UPDATE Appointment "
            + "SET appStatus = ? "
            + "WHERE appointmentID = ?;";
    private static final String READ_SERVICE
            = "select serviceID from AppointmentServices where appointmentID = ?";
    private static final String ADD_SERVICE
            = "insert into AppointmentServices(appointmentID, serviceID) values(?, ?)";
    private static final String DELETE_SERVICE
            = "delete from AppointmentServices where appointmentID = ?";

    public AppointmentDAOImpl(BirdDAO birdDAO, DoctorDAO doctorDAO,
            Service_DAO service_DAO, TimeslotDAO timeslotDAO) {
        this.birdDAO = birdDAO;
        this.doctorDAO = doctorDAO;
        this.service_DAO = service_DAO;
        this.timeslotDAO = timeslotDAO;
    }

    @Override
    public AppointmentDTO readAppointment(String appointmentID)
            throws NoSuchRecordExists, SQLException {
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
                appointment = new AppointmentDTOImpl();
                appointment.setAppointmentID(appointmentID);
                appointment.setBird(birdDAO.readBird(rs.getString("birdID")));
                if (rs.getString("doctorID") != null) {
                    appointment.setDoctor(doctorDAO.readDoctor(rs.getString("doctorID")));
                } else {
                    appointment.setDoctor(null);
                }
                appointment.setTimeslot(timeslotDAO.readTimeSlot(rs.getString("timeslotID")));
                appointment.setAppTime(rs.getDate("appTime"));
                appointment.setNotes(rs.getString("notes"));
                appointment.setPayment(rs.getString("payment"));
                appointment.setAppStatus(rs.getString("appStatus"));
                appointment.setAllService(this.getService(appointmentID));
                appointment.setTotalPrice(rs.getBigDecimal("totalPrice"));
            }

            if (appointment == null) {
                throw new NoSuchAppointmentsExistsException();
            }
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
    public List<AppointmentDTO> readAppointmentByBird(String birdID) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointmentList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_APPOINTMENT_BY_BIRD);
            stm.setString(1, birdID);
            rs = stm.executeQuery();
            BirdDTO bird = birdDAO.readBird(birdID);

            while (rs.next()) {
                AppointmentDTO appointment = new AppointmentDTOImpl();
                String appointmentID = rs.getString("appointmentID");
                appointment.setAppointmentID(appointmentID);
                appointment.setBird(bird);
                if (rs.getString("doctorID") != null) {
                    appointment.setDoctor(doctorDAO.readDoctor(rs.getString("doctorID")));
                } else {
                    appointment.setDoctor(null);
                }
                appointment.setTimeslot(timeslotDAO.readTimeSlot(rs.getString("timeslotID")));
                appointment.setAllService(this.getService(appointmentID));
                appointment.setAppTime(rs.getDate("appTime"));
                appointment.setNotes(rs.getString("notes"));
                appointment.setPayment(rs.getString("payment"));
                appointment.setAppStatus(rs.getString("appStatus"));
                appointment.setTotalPrice(rs.getBigDecimal("totalPrice"));

                if (appointmentList == null) {
                    appointmentList = new ArrayList<>();
                }
                appointmentList.add(appointment);
            }
            if (appointmentList == null || appointmentList.isEmpty()) {
                throw new NoSuchAppointmentsExistsException();
            }
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
    public List<AppointmentDTO> readAppointmentByStatus(String status) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointmentList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_APPOINTMENT_BY_STATUS);
            stm.setString(1, "%" + status + "%");
            rs = stm.executeQuery();

            while (rs.next()) {
                AppointmentDTO appointment = new AppointmentDTOImpl();
                String appointmentID = rs.getString("appointmentID");
                appointment.setAppointmentID(appointmentID);
                appointment.setBird(birdDAO.readBird(rs.getString("birdID")));
                if (rs.getString("doctorID") != null) {
                    appointment.setDoctor(doctorDAO.readDoctor(rs.getString("doctorID")));
                } else {
                    appointment.setDoctor(null);
                }
                appointment.setTimeslot(timeslotDAO.readTimeSlot(rs.getString("timeslotID")));
                appointment.setAllService(this.getService(appointmentID));
                appointment.setAppTime(rs.getDate("appTime"));
                appointment.setNotes(rs.getString("notes"));
                appointment.setPayment(rs.getString("payment"));
                appointment.setAppStatus(status);
                appointment.setTotalPrice(rs.getBigDecimal("totalPrice"));

                if (appointmentList == null) {
                    appointmentList = new ArrayList<>();
                }
                appointmentList.add(appointment);
            }
            if (appointmentList == null || appointmentList.isEmpty()) {
                throw new NoSuchAppointmentsExistsException();
            }
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
    public List<AppointmentDTO> readAppointmentByDoctor(String doctorID) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointmentList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_APPOINTMENT_BY_DOCTOR);
            stm.setString(1, doctorID);
            rs = stm.executeQuery();
            DoctorDTO doctor = doctorDAO.readDoctor(doctorID);

            while (rs.next()) {
                AppointmentDTO appointment = new AppointmentDTOImpl();
                String appointmentID = rs.getString("appointmentID");
                appointment.setAppointmentID(appointmentID);
                appointment.setBird(birdDAO.readBird(rs.getString("birdID")));
                appointment.setDoctor(doctor);
                appointment.setTimeslot(timeslotDAO.readTimeSlot(rs.getString("timeslotID")));
                appointment.setAllService(this.getService(appointmentID));
                appointment.setAppTime(rs.getDate("appTime"));
                appointment.setNotes(rs.getString("notes"));
                appointment.setPayment(rs.getString("payment"));
                appointment.setAppStatus(rs.getString("appStatus"));
                appointment.setTotalPrice(rs.getBigDecimal("totalPrice"));
                if (appointmentList == null) {
                    appointmentList = new ArrayList<>();
                }
                appointmentList.add(appointment);
            }

            if (appointmentList == null || appointmentList.isEmpty()) {
                throw new NoSuchAppointmentsExistsException();
            }
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
    public List<AppointmentDTO> readAppointmentByCustomer(String customerID) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointmentList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_APPOINTMENT_BY_BIRD);
            List<BirdDTO> birds = birdDAO.readAllBirdByCustomer(customerID);
            for (BirdDTO bird : birds) {
                stm.setString(1, bird.getBirdID());
                rs = stm.executeQuery();
                while (rs.next()) {
                    AppointmentDTO appointment = new AppointmentDTOImpl();
                    String appointmentID = rs.getString("appointmentID");
                    appointment.setAppointmentID(appointmentID);
                    appointment.setBird(bird);
                    if (rs.getString("doctorID") != null) {
                        appointment.setDoctor(doctorDAO.readDoctor(rs.getString("doctorID")));
                    } else {
                        appointment.setDoctor(null);
                    }
                    appointment.setTimeslot(timeslotDAO.readTimeSlot(rs.getString("timeslotID")));
                    appointment.setAllService(this.getService(appointmentID));
                    appointment.setAppTime(rs.getDate("appTime"));
                    appointment.setNotes(rs.getString("notes"));
                    appointment.setPayment(rs.getString("payment"));
                    appointment.setAppStatus(rs.getString("appStatus"));
                appointment.setTotalPrice(rs.getBigDecimal("totalPrice"));

                    if (appointmentList == null) {
                        appointmentList = new ArrayList<>();
                    }
                    appointmentList.add(appointment);
                }
            }

            if (appointmentList == null || appointmentList.isEmpty()) {
                throw new NoSuchAppointmentsExistsException();
            }
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
    public List<AppointmentDTO> readAppointmentByTimeslot(String timeSlotID) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointmentList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_APPOINTMENT_BY_TIMESLOT);
            stm.setString(1, timeSlotID);
            rs = stm.executeQuery();
            TimeslotDTO timeslot = timeslotDAO.readTimeSlot(timeSlotID);

            while (rs.next()) {
                AppointmentDTO appointment = new AppointmentDTOImpl();
                String appointmentID = rs.getString("appointmentID");
                appointment.setAppointmentID(appointmentID);
                appointment.setBird(birdDAO.readBird(rs.getString("birdID")));
                if (rs.getString("doctorID") != null) {
                    appointment.setDoctor(doctorDAO.readDoctor(rs.getString("doctorID")));
                } else {
                    appointment.setDoctor(null);
                }
                appointment.setTimeslot(timeslot);
                appointment.setAllService(this.getService(appointmentID));
                appointment.setAppTime(rs.getDate("appTime"));
                appointment.setNotes(rs.getString("notes"));
                appointment.setPayment(rs.getString("payment"));
                appointment.setAppStatus(rs.getString("appStatus"));
                appointment.setTotalPrice(rs.getBigDecimal("totalPrice"));

                if (appointmentList == null) {
                    appointmentList = new ArrayList<>();
                }
                appointmentList.add(appointment);
            }

            if (appointmentList == null || appointmentList.isEmpty()) {
                throw new NoSuchAppointmentsExistsException();
            }
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
    public AppointmentDTO readAppointmentByDocTime(String doctorID, String timeslotID, Date appDate)
            throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AppointmentDTO appointment = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_APPOINTMENT_BY_DOCTIME);
            stm.setString(1, doctorID);
            stm.setString(2, timeslotID);
            stm.setDate(3, appDate);
            rs = stm.executeQuery();

            if (rs.next()) {
                appointment = new AppointmentDTOImpl();
                String appointmentID = rs.getString("appointmentID");
                appointment.setAppointmentID(appointmentID);
                appointment.setBird(birdDAO.readBird(rs.getString("birdID")));
                if (rs.getString("doctorID") != null) {
                    appointment.setDoctor(doctorDAO.readDoctor(rs.getString("doctorID")));
                } else {
                    appointment.setDoctor(null);
                }
                appointment.setTimeslot(timeslotDAO.readTimeSlot(rs.getString("timeSlotID")));
                appointment.setAllService(this.getService(appointmentID));
                appointment.setAppTime(rs.getDate("appTime"));
                appointment.setNotes(rs.getString("notes"));
                appointment.setPayment(rs.getString("payment"));
                appointment.setAppStatus(rs.getString("appStatus"));
                appointment.setTotalPrice(rs.getBigDecimal("totalPrice"));
            }
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
    public int deleteAppointment(String appointmentID) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int rowsDeleted = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_APPOINTMENT);
            stm.setString(1, appointmentID);
            rowsDeleted = stm.executeUpdate();

            if (rowsDeleted == 0) {
                throw new NoSuchAppointmentsExistsException();
            }
            
            this.deleteService(appointmentID);
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
    public int insertAppointment(AppointmentDTO appointment) throws RecordAlreadyExists, SQLException {
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
            stm.setDate(5, appointment.getAppTime());
            stm.setString(6, appointment.getNotes());
            stm.setString(7, appointment.getPayment());
            stm.setString(8, appointment.getAppStatus());
            stm.setBigDecimal(9, appointment.getTotalPrice());

            rowsInserted = stm.executeUpdate();

            if (rowsInserted == 0) {
                throw new AppointmentAlreadyExistsException();
            }
            
            this.addService(appointment.getService_(), appointment.getAppointmentID());
        } finally {
            if (con != null) {
                con.close();
            }
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
    public int updateAppointment(AppointmentDTO appointment) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int rowsUpdated = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_APPOINTMENT);
            stm.setString(1, appointment.getBird().getBirdID());
            if (appointment.getDoctor() != null) {
                stm.setString(2, appointment.getDoctor().getUserID());
            } else {
                stm.setString(2, null);
            }
            stm.setString(3, appointment.getTimeslot().getTimeSlotID());
            stm.setDate(4, appointment.getAppTime());
            stm.setString(5, appointment.getNotes());
            stm.setString(6, appointment.getPayment());
            stm.setString(7, appointment.getAppStatus());
            stm.setBigDecimal(8, appointment.getTotalPrice());
            stm.setString(9, appointment.getAppointmentID());
            rowsUpdated = stm.executeUpdate();

            if (rowsUpdated == 0) {
                throw new NoSuchAppointmentsExistsException();
            }
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
    public int updateAppointmentStatus(String appointmentID, String status) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int rowsUpdated = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_APPOINTMENT_STATUS);
            stm.setString(2, appointmentID);
            stm.setString(1, status);
            rowsUpdated = stm.executeUpdate();

            if (rowsUpdated == 0) {
                throw new NoSuchAppointmentsExistsException();
            }
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
    public List<AppointmentDTO> readListOfAppointment(List<String> appointmentIDs) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointments = new ArrayList<>();

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_APPOINTMENT);

            for (String appointmentID : appointmentIDs) {
                stm.setString(1, appointmentID);
                rs = stm.executeQuery();

                if (rs.next()) {
                    AppointmentDTO appointment = new AppointmentDTOImpl();
                    appointment.setAppointmentID(appointmentID);
                    appointment.setBird(birdDAO.readBird(rs.getString("birdID")));
                    if (rs.getString("doctorID") != null) {
                        appointment.setDoctor(doctorDAO.readDoctor(rs.getString("doctorID")));
                    } else {
                        appointment.setDoctor(null);
                    }
                    appointment.setTimeslot(timeslotDAO.readTimeSlot(rs.getString("timeslotID")));
                    appointment.setAllService(this.getService(appointmentID));
                    appointment.setAppTime(rs.getDate("appTime"));
                    appointment.setNotes(rs.getString("notes"));
                    appointment.setPayment(rs.getString("payment"));
                    appointment.setAppStatus(rs.getString("appStatus"));

                    appointments.add(appointment);
                }
            }

            if (appointments.isEmpty()) {
                throw new NoSuchAppointmentsExistsException();
            }
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

        return appointments;
    }

    @Override
    public List<AppointmentDTO> readAllAppointments() throws NoSuchRecordExists, SQLException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointmentList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(READ_ALL_APPOINTMENT);

            while (rs.next()) {
                AppointmentDTO appointment = new AppointmentDTOImpl();
                String appointmentID = rs.getString("appointmentID");
                appointment.setAppointmentID(appointmentID);
                appointment.setBird(birdDAO.readBird(rs.getString("birdID")));
                if (rs.getString("doctorID") != null) {
                    appointment.setDoctor(doctorDAO.readDoctor(rs.getString("doctorID")));
                } else {
                    appointment.setDoctor(null);
                }
                appointment.setTimeslot(timeslotDAO.readTimeSlot(rs.getString("timeslotID")));
                appointment.setAllService(this.getService(appointmentID));
                appointment.setAppTime(rs.getDate("appTime"));
                appointment.setNotes(rs.getString("notes"));
                appointment.setPayment(rs.getString("payment"));
                appointment.setAppStatus(rs.getString("appStatus"));

                if (appointmentList == null) {
                    appointmentList = new ArrayList<>();
                }
                appointmentList.add(appointment);
            }
            if (appointmentList == null || appointmentList.isEmpty()) {
                throw new NoSuchAppointmentsExistsException();
            }
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
    public List<AppointmentDTO> readAppointmentByDate(Date before, Date after) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentDTO> appointmentList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_APPOINTMENT_BY_DATE);
            stm.setDate(1, before);
            stm.setDate(2, after);
            rs = stm.executeQuery();

            while (rs.next()) {
                AppointmentDTO appointment = new AppointmentDTOImpl();
                String appointmentID = rs.getString("appointmentID");
                appointment.setAppointmentID(appointmentID);
                appointment.setBird(birdDAO.readBird(rs.getString("birdID")));
                if (rs.getString("doctorID") != null) {
                    appointment.setDoctor(doctorDAO.readDoctor(rs.getString("doctorID")));
                } else {
                    appointment.setDoctor(null);
                }
                appointment.setTimeslot(timeslotDAO.readTimeSlot(rs.getString("timeslotID")));
                appointment.setAllService(this.getService(appointmentID));
                appointment.setAppTime(rs.getDate("appTime"));
                appointment.setNotes(rs.getString("notes"));
                appointment.setPayment(rs.getString("payment"));
                appointment.setAppStatus(rs.getString("appStatus"));

                if (appointmentList == null) {
                    appointmentList = new ArrayList<>();
                }
                appointmentList.add(appointment);
            }

            if (appointmentList == null || appointmentList.isEmpty()) {
                throw new NoSuchAppointmentsExistsException();
            }
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

    private List<Service_DTO> getService(String appointmentID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Service_DTO> serviceList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_SERVICE);
            stm.setString(1, appointmentID);
            rs = stm.executeQuery();

            while (rs.next()) {
                String serviceID = rs.getString("serviceID");
                Service_DTO service = service_DAO.readService_(serviceID);
                if (serviceList == null) {
                    serviceList = new ArrayList<>();
                }
                serviceList.add(service);
            }
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
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

        return serviceList;
    }

    @Override
    public int addService(List<Service_DTO> services, String appointmentID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0; 

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(ADD_SERVICE);
            stm.setString(1, appointmentID);
            for (Service_DTO service : services) {
                stm.setString(2, service.getServiceID());
                result += stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    @Override
    public int deleteService(String appointmentID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_SERVICE);
            stm.setString(1, appointmentID);
            result = stm.executeUpdate();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }
}
