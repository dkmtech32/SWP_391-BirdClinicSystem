/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users.customer;

import java.sql.SQLException;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.users.UserDAO;

/**
 *
 * @author Admin
 */
public interface CustomerDAO extends UserDAO {

    int deleteCustomer(String customerID) 
            throws NoSuchRecordExists, SQLException;

    int insertCustomer(CustomerDTO customer) 
            throws RecordAlreadyExists, SQLException;

    List<CustomerDTO> readAllCustomers() 
            throws NoSuchRecordExists, SQLException;

    CustomerDTO readCustomer(String customerID) 
            throws NoSuchRecordExists, SQLException;

    List<CustomerDTO> readListOfCustomers(List<String> customerIDs) 
            throws NoSuchRecordExists, SQLException;

    int updateCustomer(CustomerDTO customer) 
            throws NoSuchRecordExists, SQLException;
    
}
