/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users.doctor;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class NoSuchDoctorExistsException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>NoSuchDoctorExistsException</code>
     * without detail message.
     */
    public NoSuchDoctorExistsException() {
        super("Doctor");
    }

    /**
     * Constructs an instance of <code>NoSuchDoctorExistsException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchDoctorExistsException(String msg) {
        super(msg);
    }
}
