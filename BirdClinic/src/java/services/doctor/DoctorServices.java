/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.doctor;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import models.appointment.AppointmentDTO;
import models.medicalRecord.MedicalRecordDTO;
import models.medicine.MedicineDTO;
import models.recordMedicine.RecordMedicineDTO;
import services.general.AppointmentDoesNotExistException;

/**
 *
 * @author Admin
 */
public interface DoctorServices extends Serializable {

    List<AppointmentDTO> getDoctorAppointments() throws SQLException;

    boolean prescribe(MedicalRecordDTO medRec, List<RecordMedicineDTO> recMeds) throws MedicalRecordAlreadyExistsException, SQLException;

    boolean updatePrescription(Map<String, String[]> args, MedicalRecordDTO medRec, List<RecordMedicineDTO> prescription) throws MedicineDoesNotExistException, SQLException;

    boolean updateRecord(Map<String, String[]> args, MedicalRecordDTO medicalRecord) throws AppointmentDoesNotExistException, SQLException;
    
    List<MedicineDTO> getAllMedicine() throws SQLException;
}
