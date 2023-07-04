/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.doctorTimeslot;

import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public class DoctorAlreadyInTimeslotException extends RecordAlreadyExists {

    /**
     * Creates a new instance of <code>DoctorAlreadyInTimeslot</code> without
     * detail message.
     */
    public DoctorAlreadyInTimeslotException() {
        super("Doctor's timeslot");
    }

    /**
     * Constructs an instance of <code>DoctorAlreadyInTimeslot</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public DoctorAlreadyInTimeslotException(String msg) {
        super(msg);
    }
}
