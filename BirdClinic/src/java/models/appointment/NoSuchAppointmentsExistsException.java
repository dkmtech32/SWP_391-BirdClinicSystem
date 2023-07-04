/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.appointment;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class NoSuchAppointmentsExistsException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>NoSuchAppointmentsExistsException</code>
     * without detail message.
     */
    public NoSuchAppointmentsExistsException() {
        super("This appointment doesn't exist");
    }

    /**
     * Constructs an instance of <code>NoSuchAppointmentsExistsException</code>
     * with the specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchAppointmentsExistsException(String msg) {
        super(msg);
    }
}
