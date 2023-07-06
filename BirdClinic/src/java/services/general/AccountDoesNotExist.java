/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.general;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class AccountDoesNotExist extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>AccountNotExistException</code> without
     * detail message.
     */
    public AccountDoesNotExist() {
        super("Username or password do not match");
    }

    /**
     * Constructs an instance of <code>AccountNotExistException</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public AccountDoesNotExist(String msg) {
        super(msg);
    }
}
