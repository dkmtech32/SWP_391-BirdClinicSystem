/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.service_;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class NoSuchService_ExistsException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>NoSuchService_ExistsException</code>
     * with a default message.
     */
    public NoSuchService_ExistsException() {
        super("Service_");
    }

    /**
     * Constructs an instance of <code>NoSuchService_ExistsException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchService_ExistsException(String msg) {
        super(msg);
    }
}
