/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.timeslot;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class NoSuchTimeslotExistsException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>NoSuchTimeslotExistsException</code>
     * without detail message.
     */
    public NoSuchTimeslotExistsException() {
        super("Timeslot");
    }

    /**
     * Constructs an instance of <code>NoSuchTimeslotExistsException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchTimeslotExistsException(String msg) {
        super(msg);
    }
}
