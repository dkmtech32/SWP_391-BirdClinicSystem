/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.account;

/**
 *
 * @author Admin
 */
public class BirdDoesNotExistException extends Exception {

    /**
     * Creates a new instance of <code>BirdDoesNotExist</code> without detail
     * message.
     */
    public BirdDoesNotExistException() {
    }

    /**
     * Constructs an instance of <code>BirdDoesNotExist</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public BirdDoesNotExistException(String msg) {
        super(msg);
    }
}
