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
public class DoctorDoesNotExistException extends Exception {

    /**
     * Creates a new instance of <code>DoctorDoesNotExist</code> without detail
     * message.
     */
    public DoctorDoesNotExistException() {
    }

    /**
     * Constructs an instance of <code>DoctorDoesNotExist</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public DoctorDoesNotExistException(String msg) {
        super(msg);
    }
}
