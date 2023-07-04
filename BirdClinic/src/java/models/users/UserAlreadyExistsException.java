/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users;

import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public class UserAlreadyExistsException extends RecordAlreadyExists {

    /**
     * Creates a new instance of <code>UserAlreadyExistsException</code> without
     * detail message.
     */
    public UserAlreadyExistsException() {
        super("User");
    }

    /**
     * Constructs an instance of <code>UserAlreadyExistsException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public UserAlreadyExistsException(String msg) {
        super(msg);
    }
}
