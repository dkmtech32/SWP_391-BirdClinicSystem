/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.account.customer;

import java.io.Serializable;
import models.dto.users.customer.CustomerDTO;

/**
 *
 * @author Admin
 */
public interface CustomerServices extends Serializable {

    CustomerDTO getCustomerInformation(String customerID) throws NoSuchCustomerExistsException;

    boolean updateCustomerInformation(CustomerDTO customer);
    
    boolean isCustomer(String customerID) throws NoSuchCustomerExistsException;
}
