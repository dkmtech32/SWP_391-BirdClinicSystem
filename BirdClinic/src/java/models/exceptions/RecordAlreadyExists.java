/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.exceptions;

/**
 *
 * @author Admin
 */
public class RecordAlreadyExists extends Exception {

    /**
     * Creates a new instance of <code>RecordAlreadyExists</code> without detail
     * message.
     */
    public RecordAlreadyExists() {
    }

    /**
     * Constructs an instance of <code>RecordAlreadyExists</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public RecordAlreadyExists(String msg) {
        super(msg);
    }
}
