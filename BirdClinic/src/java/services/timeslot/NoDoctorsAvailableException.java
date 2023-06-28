/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.timeslot;

/**
 *
 * @author Admin
 */
public class NoDoctorsAvailableException extends Exception {

    /**
     * Creates a new instance of <code>NoDoctorsAvailableException</code>
     * with a default detail message.
     */
    public NoDoctorsAvailableException() {
        super("No doctors are available at this timeslot");
    }

    /**
     * Constructs an instance of <code>NoDoctorsAvailableException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public NoDoctorsAvailableException(String msg) {
        super(msg);
    }
}
