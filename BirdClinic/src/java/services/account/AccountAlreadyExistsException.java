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
public class AccountAlreadyExistsException extends Exception {

    /**
     * Creates a new instance of <code>AccountAlreadyExistsException</code>
     * without detail message.
     */
    public AccountAlreadyExistsException() {
        super("Username same as another user");
    }

    /**
     * Constructs an instance of <code>AccountAlreadyExistsException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public AccountAlreadyExistsException(String msg) {
        super(msg);
    }
}
