/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users.customer;

import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public class CustomerAlreadyExistsException extends RecordAlreadyExists {

    /**
     * Creates a new instance of <code>CustomerAlreadyExistsException</code>
     * without detail message.
     */
    public CustomerAlreadyExistsException() {
        super("Customer");
    }

    /**
     * Constructs an instance of <code>CustomerAlreadyExistsException</code>
     * with the specified detail message.
     *
     * @param msg the detail message.
     */
    public CustomerAlreadyExistsException(String msg) {
        super(msg);
    }
}
