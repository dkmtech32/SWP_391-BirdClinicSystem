/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class NoSuchUserExistsException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>NoSuchUsersExistsException</code> without
     * detail message.
     */
    public NoSuchUserExistsException() {
        super("User");
    }

    /**
     * Constructs an instance of <code>NoSuchUsersExistsException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchUserExistsException(String msg) {
        super(msg);
    }
}
