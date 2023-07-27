/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.feedback;

import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public class FeedbackAlreadyExistsException extends RecordAlreadyExists {

    /**
     * Creates a new instance of <code>FeedbackAlreadyExistsException</code>
     * without detail message.
     */
    public FeedbackAlreadyExistsException() {

        super("Feedback");
    }

    /**
     * Constructs an instance of <code>FeedbackAlreadyExistsException</code>
     * with the specified detail message.
     *
     * @param msg the detail message.
     */
    public FeedbackAlreadyExistsException(String msg) {
        super(msg);
    }
}
