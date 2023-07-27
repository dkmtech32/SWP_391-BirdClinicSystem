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
public class PasswordNotStrongException extends Exception {

    /**
     * Creates a new instance of <code>PasswordNotStrongException</code> without
     * detail message.
     */
    public PasswordNotStrongException() {
        super("Password is not strong enough");
    }

    /**
     * Constructs an instance of <code>PasswordNotStrongException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public PasswordNotStrongException(String msg) {
        super(msg);
    }
}
