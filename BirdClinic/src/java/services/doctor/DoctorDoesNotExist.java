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
public class DoctorDoesNotExist extends Exception {

    /**
     * Creates a new instance of <code>DoctorDoesNotExist</code> without detail
     * message.
     */
    public DoctorDoesNotExist() {
    }

    /**
     * Constructs an instance of <code>DoctorDoesNotExist</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public DoctorDoesNotExist(String msg) {
        super(msg);
    }
}
