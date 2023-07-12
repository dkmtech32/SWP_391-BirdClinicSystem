/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.service_;

import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public class Service_AlreadyExistsException extends RecordAlreadyExists {

    /**
     * Creates a new instance of <code>Service_AlreadyExistsExcepiton</code>
     * without detail message.
     */
    public Service_AlreadyExistsException() {
        super("Service_");
    }

    /**
     * Constructs an instance of <code>Service_AlreadyExistsExcepiton</code>
     * with the specified detail message.
     *
     * @param msg the detail message.
     */
    public Service_AlreadyExistsException(String msg) {
        super(msg);
    }
}
