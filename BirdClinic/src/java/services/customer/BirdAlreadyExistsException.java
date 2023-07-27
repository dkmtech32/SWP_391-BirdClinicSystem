/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.customer;

/**
 *
 * @author Admin
 */
public class BirdAlreadyExistsException extends Exception {

    /**
     * Creates a new instance of <code>BirdAlreadyExistsException</code> without
     * detail message.
     */
    public BirdAlreadyExistsException() {
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
