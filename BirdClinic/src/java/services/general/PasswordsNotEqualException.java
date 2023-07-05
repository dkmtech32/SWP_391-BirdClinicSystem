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
public class PasswordsNotEqualException extends Exception {

    /**
     * Creates a new instance of <code>PasswordsNotEqualException</code> without
     * detail message.
     */
    public PasswordsNotEqualException() {
        super("Confirm Password is not equal to Password");
    }

    /**
     * Constructs an instance of <code>PasswordsNotEqualException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public PasswordsNotEqualException(String msg) {
        super(msg);
    }
}
