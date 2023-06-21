/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.users.customer;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.dao.users.UserDAO;
import models.dto.users.customer.CustomerDTO;

/**
 *
 * @author Admin
 */
public interface CustomerDAO extends UserDAO {

    int deleteCustomer(String customerID) throws SQLException;

    int insertCustomer(CustomerDTO customer) throws SQLException;

    List<CustomerDTO> readAllCustomers() throws SQLException;

    CustomerDTO readCustomer(String customerID) throws SQLException;

    CustomerDTO readCustomer(String customerID, Connection con) throws SQLException;

    int updateCustomer(CustomerDTO customer) throws SQLException;
    
}
