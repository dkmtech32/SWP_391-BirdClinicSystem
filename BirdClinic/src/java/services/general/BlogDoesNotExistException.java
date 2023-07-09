/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.general;

/**
 *
 * @author Admin
 */
public class BlogDoesNotExistException extends Exception {

    /**
     * Creates a new instance of <code>BlogDoesNotExistException</code> without
     * detail message.
     */
    public BlogDoesNotExistException() {
    }

    /**
     * Constructs an instance of <code>BlogDoesNotExistException</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public BlogDoesNotExistException(String msg) {
        super(msg);
    }
}
