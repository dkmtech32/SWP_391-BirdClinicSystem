/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.bird;

import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public class BirdAlreadyExistsException extends RecordAlreadyExists {

    /**
     * Creates a new instance of <code>BirdAlreadyExistsException</code> without
     * detail message.
     */
    public BirdAlreadyExistsException() {
        super("Bird");
    }

    /**
     * Constructs an instance of <code>BirdAlreadyExistsException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public BirdAlreadyExistsException(String msg) {
        super(msg);
    }
}
