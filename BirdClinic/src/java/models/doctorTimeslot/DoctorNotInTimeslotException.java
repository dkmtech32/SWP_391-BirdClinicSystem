/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.doctorTimeslot;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class DoctorNotInTimeslotException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>DoctorNotInTimeslotException</code>
     * without detail message.
     */
    public DoctorNotInTimeslotException() {
        super("Doctor's timeslot");
    }

    /**
     * Constructs an instance of <code>DoctorNotInTimeslotException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public DoctorNotInTimeslotException(String msg) {
        super(msg);
    }
}
