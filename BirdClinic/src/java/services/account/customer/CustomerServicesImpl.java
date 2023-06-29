/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.account.customer;

import java.sql.SQLException;
import models.dao.images.ImageDAO;
import models.dao.images.ImageDAOImpl;
import models.dao.users.customer.CustomerDAO;
import models.dao.users.customer.CustomerDAOImpl;
import models.dto.users.customer.CustomerDTO;

/**
 *
 * @author Admin
 */
public class CustomerServicesImpl implements CustomerServices {

    private final CustomerDAO customerDAO;

    public CustomerServicesImpl() {
        ImageDAO imageDAO = new ImageDAOImpl();
        customerDAO = new CustomerDAOImpl(imageDAO);
    }

    @Override
    public CustomerDTO getCustomerInformation(String customerID) throws NoSuchCustomerExistsException {
        CustomerDTO result = null;

        try {
            result = customerDAO.readCustomer(customerID);
        } catch (SQLException ex) {
            throw new NoSuchCustomerExistsException();
        }

        return result;
    }

    @Override
    public boolean updateCustomerInformation(CustomerDTO customer) {
        return true;
    }

    @Override
    public boolean isCustomer(String customerID) throws NoSuchCustomerExistsException {
        boolean result = false;

        try {
            result = customerDAO.readCustomer(customerID) != null;
        } catch (SQLException ex) {
            throw new NoSuchCustomerExistsException();
        }

        return result;
    }
}
