/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.images;

import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public class ImageAlreadyExistsException extends RecordAlreadyExists {

    /**
     * Creates a new instance of <code>ImageAlreadyExistsException</code>
     * without detail message.
     */
    public ImageAlreadyExistsException() {
        super("Image");
    }

    /**
     * Constructs an instance of <code>ImageAlreadyExistsException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public ImageAlreadyExistsException(String msg) {
        super(msg);
    }
}
