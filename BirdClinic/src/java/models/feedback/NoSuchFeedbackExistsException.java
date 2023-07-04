/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.feedback;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class NoSuchFeedbackExistsException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>NoSuchFeedbackExistsException</code>
     * without detail message.
     */
    public NoSuchFeedbackExistsException() {
        super("Feedback");
    }

    /**
     * Constructs an instance of <code>NoSuchFeedbackExistsException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchFeedbackExistsException(String msg) {
        super(msg);
    }
}
