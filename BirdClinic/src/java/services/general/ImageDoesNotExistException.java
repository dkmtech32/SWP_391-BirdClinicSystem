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
public class ImageDoesNotExistException extends Exception {

    /**
     * Creates a new instance of <code>ImageDoesNotExistException</code> without
     * detail message.
     */
    public ImageDoesNotExistException() {
    }

    /**
     * Constructs an instance of <code>ImageDoesNotExistException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public ImageDoesNotExistException(String msg) {
        super(msg);
    }
}
