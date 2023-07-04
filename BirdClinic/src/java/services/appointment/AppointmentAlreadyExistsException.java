/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.appointment;

/**
 *
 * @author Admin
 */
public class AppointmentAlreadyExistsException extends Exception {

    /**
     * Creates a new instance of <code>AppointmentAlreadyExistsException</code>
     * with a default message.
     */
    public AppointmentAlreadyExistsException() {
        super("This appointment already exists");
    }

    /**
     * Constructs an instance of <code>AppointmentAlreadyExistsException</code>
     * with the specified detail message.
     *
     * @param msg the detail message.
     */
    public AppointmentAlreadyExistsException(String msg) {
        super(msg);
    }
}
