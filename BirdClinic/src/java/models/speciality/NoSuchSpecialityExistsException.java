/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.speciality;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class NoSuchSpecialityExistsException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>NoSuchSpecialityException</code> with a
     * default message.
     */
    public NoSuchSpecialityExistsException() {
        super("Speciality");
    }

    /**
     * Constructs an instance of <code>NoSuchSpecialityException</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchSpecialityExistsException(String msg) {
        super(msg);
    }
}
