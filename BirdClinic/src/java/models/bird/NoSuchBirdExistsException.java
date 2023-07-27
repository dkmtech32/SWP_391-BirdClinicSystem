/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.bird;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class NoSuchBirdExistsException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>NoBirdsException</code> without detail
     * message.
     */
    public NoSuchBirdExistsException() {
        super("Bird");
    }

    /**
     * Constructs an instance of <code>NoBirdsException</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchBirdExistsException(String msg) {
        super(msg);
    }
}
