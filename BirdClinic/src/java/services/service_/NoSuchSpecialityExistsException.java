/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.service_;

/**
 *
 * @author Admin
 */
public class NoSuchSpecialityExistsException extends Exception {

    /**
     * Creates a new instance of <code>NoSuchSpecialityException</code> with a
     * default message.
     */
    public NoSuchSpecialityExistsException() {
        super("Speciality doesn't exist.");
    }

    /**
     * Constructs an instance of <code>NoSuchSpecialityException</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchSpecialityExistsException(String msg) {
        super(msg);
    }
}
