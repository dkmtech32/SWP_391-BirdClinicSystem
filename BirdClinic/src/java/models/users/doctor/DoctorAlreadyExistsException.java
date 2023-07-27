/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users.doctor;

import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public class DoctorAlreadyExistsException extends RecordAlreadyExists {

    /**
     * Creates a new instance of <code>DoctorAlreadyExistsException</code>
     * without detail message.
     */
    public DoctorAlreadyExistsException() {
        super("Doctor");
    }

    /**
     * Constructs an instance of <code>DoctorAlreadyExistsException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public DoctorAlreadyExistsException(String msg) {
        super(msg);
    }
}
