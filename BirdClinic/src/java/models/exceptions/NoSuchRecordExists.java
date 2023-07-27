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
public class NoSuchRecordExists extends Exception {

    /**
     * Creates a new instance of <code>NoSuchRecordExists</code> without detail
     * message.
     */
    public NoSuchRecordExists() {
    }

    /**
     * Constructs an instance of <code>NoSuchRecordExists</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchRecordExists(String msg) {
        super(msg);
    }
}
