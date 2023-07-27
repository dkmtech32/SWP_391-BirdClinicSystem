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
public class PasswordsEqualException extends Exception {

    /**
     * Creates a new instance of <code>PasswordsEqualException</code> without
     * detail message.
     */
    public PasswordsEqualException() {
    }

    /**
     * Constructs an instance of <code>PasswordsEqualException</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public PasswordsEqualException(String msg) {
        super(msg);
    }
}
