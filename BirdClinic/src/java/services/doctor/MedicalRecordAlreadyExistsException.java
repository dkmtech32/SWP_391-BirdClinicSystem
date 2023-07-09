/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.doctor;

/**
 *
 * @author Admin
 */
public class MedicalRecordAlreadyExistsException extends Exception {

    /**
     * Creates a new instance of <code>MedicalRecordDoesNotExistException</code>
     * without detail message.
     */
    public MedicalRecordAlreadyExistsException() {
    }

    /**
     * Constructs an instance of <code>MedicalRecordDoesNotExistException</code>
     * with the specified detail message.
     *
     * @param msg the detail message.
     */
    public MedicalRecordAlreadyExistsException(String msg) {
        super(msg);
    }
}
