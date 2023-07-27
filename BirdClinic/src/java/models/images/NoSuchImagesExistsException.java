/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.images;

import models.exceptions.NoSuchRecordExists;


/**
 *
 * @author Admin
 */
public class NoSuchImagesExistsException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>NoSuchImagesExistsException</code>
     * without detail message.
     */
    public NoSuchImagesExistsException() {
        super("Image");
    }

    /**
     * Constructs an instance of <code>NoSuchImagesExistsException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchImagesExistsException(String msg) {
        super(msg);
    }
}
