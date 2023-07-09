/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.staff;

/**
 *
 * @author Admin
 */
public class ServiceDoesNotExistException extends Exception {

    /**
     * Creates a new instance of <code>ServiceDoesNotExistException</code>
     * without detail message.
     */
    public ServiceDoesNotExistException() {
    }

    /**
     * Constructs an instance of <code>ServiceDoesNotExistException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public ServiceDoesNotExistException(String msg) {
        super(msg);
    }
}
