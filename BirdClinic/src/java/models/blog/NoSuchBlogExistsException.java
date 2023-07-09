/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.blog;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class NoSuchBlogExistsException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>NoSuchBlogExistsException</code> without
     * detail message.
     */
    public NoSuchBlogExistsException() {
        super("Blog");
    }

    /**
     * Constructs an instance of <code>NoSuchBlogExistsException</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchBlogExistsException(String msg) {
        super(msg);
    }
}
