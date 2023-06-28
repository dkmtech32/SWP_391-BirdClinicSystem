/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.service_;

/**
 *
 * @author Admin
 */
public class NoSuchService_ExistsException extends Exception {

    /**
     * Creates a new instance of <code>NoSuchService_ExistsException</code>
     * with a default message.
     */
    public NoSuchService_ExistsException() {
        super("Service doesn't exist");
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
