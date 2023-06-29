/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.timeslot;

/**
 *
 * @author Admin
 */
public class NoSuchTimeslotExistsException extends Exception {

    public NoSuchTimeslotExistsException() {
        super("No such timeslot exists!");
    }
    
}
