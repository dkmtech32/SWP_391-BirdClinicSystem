/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.account.customer;

/**
 *
 * @author Admin
 */
public class NoSuchCustomerExistsException extends Exception {

    /**
     * Creates a new instance of <code>NoSuchCustomerExists</code> without
     * detail message.
     */
    public NoSuchCustomerExistsException() {
        super("Customer doesn't exist! Please try again");
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
