/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.blog;

import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public class BlogAlreadyExistsException extends RecordAlreadyExists {

    /**
     * Creates a new instance of <code>BlogAlreadyExistsException</code> without
     * detail message.
     */
    public BlogAlreadyExistsException() {
        super("Blog");
    }

    /**
     * Constructs an instance of <code>BlogAlreadyExistsException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public BlogAlreadyExistsException(String msg) {
        super(msg);
    }
}
