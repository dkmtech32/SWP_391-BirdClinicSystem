/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.doctor;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import models.medicalRecord.MedicalRecordDTO;
import models.medicine.MedicineDTO;
import models.recordMedicine.RecordMedicineDTO;
import models.service_.Service_DTO;
import services.general.AppointmentDoesNotExistException;
import services.general.GeneralServices;

/**
 *
 * @author Admin
 */
public interface DoctorServices extends GeneralServices{

    boolean prescribe(MedicalRecordDTO medRec, List<RecordMedicineDTO> recMeds) throws MedicalRecordAlreadyExistsException, SQLException;

    List<RecordMedicineDTO> updatePrescription(Map<String, String[]> args, MedicalRecordDTO medRec, List<RecordMedicineDTO> prescription) throws MedicineDoesNotExistException, SQLException;

    MedicalRecordDTO updateRecord(Map<String, String[]> args, MedicalRecordDTO medicalRecord) throws AppointmentDoesNotExistException, SQLException;
    
    List<MedicineDTO> getAllMedicine() throws SQLException;
    
    List<Service_DTO> getSelfServices() throws SQLException;
}
