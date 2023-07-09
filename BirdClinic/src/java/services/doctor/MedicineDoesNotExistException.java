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
public class MedicineDoesNotExistException extends Exception {

    /**
     * Creates a new instance of <code>MedicineDoesNotExistException</code>
     * without detail message.
     */
    public MedicineDoesNotExistException() {
    }

    /**
     * Constructs an instance of <code>MedicineDoesNotExistException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public MedicineDoesNotExistException(String msg) {
        super(msg);
    }
}
