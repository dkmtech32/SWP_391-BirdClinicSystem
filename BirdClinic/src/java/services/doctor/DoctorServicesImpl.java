/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.doctor;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import models.appointment.AppointmentDTO;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.medicalRecord.MedicalRecordDTO;
import models.medicalRecord.MedicalRecordDTOImpl;
import models.medicine.MedicineDTO;
import models.recordMedicine.RecordMedicineDTO;
import models.recordMedicine.RecordMedicineDTOImpl;
import models.service_.Service_DTO;
import models.users.UserDTO;
import models.users.doctor.DoctorDTO;
import services.general.AppointmentDoesNotExistException;
import services.general.GeneralServicesImpl;
import services.staff.ServiceDoesNotExistException;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class DoctorServicesImpl extends GeneralServicesImpl implements DoctorServices {

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

    @Override
    public MedicalRecordDTO updateRecord(Map<String, String[]> args, MedicalRecordDTO medicalRecord)
            throws AppointmentDoesNotExistException, SQLException {
        MedicalRecordDTO result = null;

        try {
            if (medicalRecord == null) {
                medicalRecord = new MedicalRecordDTOImpl();
                String appointmentID = Utils.getFromMap(args, "appointmentID", "");
                medicalRecord.setAppointment(appointmentDAO.readAppointment(appointmentID));
                medicalRecord.setMedicalRecordID(Utils.hash(appointmentID));
                result = medicalRecord;
            } else {
                int treatmentDays = Integer.parseInt(Utils.getFromMap(
                        args,
                        "treatment-days",
                        String.valueOf(medicalRecord.getTreatmentDays())));
                String diagnosis = Utils.getFromMap(args, "diagnosis", medicalRecord.getDiagnosis());
                String doctorNotes = Utils.getFromMap(args, "doctor-notes", medicalRecord.getDoctorNotes());

                medicalRecord.setDiagnosis(diagnosis);
                medicalRecord.setTreatmentDays(treatmentDays);
                medicalRecord.setDoctorNotes(doctorNotes);

                result = medicalRecord;
            }
        } catch (NoSuchRecordExists ex) {
            throw new AppointmentDoesNotExistException(ex.getMessage());
        }

        return result;
    }

    @Override
    public List<RecordMedicineDTO> updatePrescription(
            Map<String, String[]> args,
            MedicalRecordDTO medRec,
            List<RecordMedicineDTO> prescription)
            throws MedicineDoesNotExistException, SQLException {
        List<RecordMedicineDTO> result = null;

        try {
            String medicineID = Utils.getFromMap(args, "medicineID", "");
            int quantity = Integer.valueOf(Utils.getFromMap(args, "quantity", "0"));
            String description_ = Utils.getFromMap(args, "description", "");

            RecordMedicineDTO recMed = new RecordMedicineDTOImpl();
            recMed.setMedicine(medicineDAO.readMedicine(medicineID));
            recMed.setMedicalRecord(medRec);
            recMed.setDescription_(description_);
            recMed.setQuantity(quantity);

            if (prescription == null) {
                prescription = new ArrayList<>();
            }

            int index = prescription.indexOf(recMed);
            if (index > -1) {
                int newQuantity = quantity + prescription.get(index).getQuantity();
                if (newQuantity <= 0) {
                    prescription.remove(index);
                } else {
                    prescription.get(index).setQuantity(newQuantity);
                }
            } else {
                prescription.add(recMed);
            }
            result = prescription;

        } catch (NoSuchRecordExists ex) {
            throw new MedicineDoesNotExistException(ex.getMessage());
        }

        return result;
    }

    @Override
    public void updateServices(List<Service_DTO> services, String serviceID, String action)
            throws ServiceDoesNotExistException, SQLException {
        try {
            Service_DTO service = serviceDAO.readService_(serviceID);
            switch (action) {
                case "add":
                    if (services.indexOf(service) < 0) {
                        services.add(service);
                    }
                    break;
                case "delete":
                    services.remove(service);

                    break;
            }
        } catch (NoSuchRecordExists ex) {
            throw new ServiceDoesNotExistException(ex.getMessage());
        }
    }

    @Override
    public boolean prescribe(MedicalRecordDTO medRec, List<RecordMedicineDTO> recMeds, List<Service_DTO> services)
            throws MedicalRecordAlreadyExistsException, SQLException {
        boolean result = false;

        try {
            medRec.setRecordTime(new Timestamp(System.currentTimeMillis()));
            result = medicalRecordDAO.insertMedicalRecord(medRec) > 0;
            if (result) {
                if (recMeds != null && recMeds.size() > 0) {
                    result = recordMedicineDAO.insertMultipleRecordMedicine(recMeds) > 0;
                }
            }

            appointmentDAO.deleteService(medRec.getAppointment().getAppointmentID());
            appointmentDAO.addService(services, medRec.getAppointment().getAppointmentID());

            appointmentDAO.updateAppointmentStatus(medRec.getAppointment().getAppointmentID(), "prescribed");
        } catch (RecordAlreadyExists | NoSuchRecordExists ex) {
            throw new MedicalRecordAlreadyExistsException(ex.getMessage());
        }

        return result;
    }

    @Override
    public List<AppointmentDTO> getAppointmentsByFilter(String filter)
            throws SQLException {
        String doctorID = currentUser.getUserID();
        List<AppointmentDTO> apps;

        try {
            if (filter.equals("upcoming")) {
                Date today = new Date(System.currentTimeMillis());
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(today);
                calendar.add(Calendar.DATE, 7);
                Date nextWeek = new Date(calendar.getTime().getTime());
                apps = super.filterAppointmentsByDate(appointmentDAO.readAppointmentByDoctor(doctorID), today, nextWeek);
            } else {
                apps = super.filterAppointmentsByStatus(appointmentDAO.readAppointmentByDoctor(doctorID), filter);
            }
        } catch (NoSuchRecordExists ex) {
            apps = null;
        }
        return apps;
    }

    @Override
    public List<MedicineDTO> getAllMedicine() throws SQLException {
        List<MedicineDTO> apps = null;

        try {
            apps = medicineDAO.readAllMedicines();
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        }

        return apps;
    }

    @Override
    public List<Service_DTO> getSelfServices() throws SQLException {
        List<Service_DTO> apps = null;

        try {
            apps = serviceDAO.readServiceBySpeciality(((DoctorDTO) this.getCurrentUser()).getSpeciality().getSpecialityID());
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        }

        return apps;
    }
}
