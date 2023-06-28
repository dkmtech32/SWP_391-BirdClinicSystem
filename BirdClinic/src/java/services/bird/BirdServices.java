/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.bird;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import models.dto.bird.BirdDTO;
import models.dto.users.customer.CustomerDTO;
import services.account.customer.NoSuchCustomerExistsException;

/**
 *
 * @author Admin
 */
public interface BirdServices extends Serializable {

    boolean addBird(Map<String, String> args, CustomerDTO customer) throws NoSuchCustomerExistsException;

    List<BirdDTO> getBirdsOfCustomer(String customerID) throws NoSuchCustomerExistsException;
    
}
