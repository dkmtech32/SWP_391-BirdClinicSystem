/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users.customer;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class NoSuchCustomerExistsException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>NoSuchCustomerExists</code> without
     * detail message.
     */
    public NoSuchCustomerExistsException() {
        super("Customer");
    }

    /**
     * Constructs an instance of <code>NoSuchCustomerExists</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchCustomerExistsException(String msg) {
        super(msg);
    }
}
