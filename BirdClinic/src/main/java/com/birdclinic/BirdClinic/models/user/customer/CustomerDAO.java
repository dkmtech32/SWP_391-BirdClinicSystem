package com.birdclinic.BirdClinic.models.user.customer;

import com.birdclinic.BirdClinic.models.user.UserDAO;
import com.birdclinic.BirdClinic.models.user.UserDTO;

public interface CustomerDAO extends UserDAO {
    CustomerDTO readCustomer(String CustomerID);

    boolean deleteCustomer(String CustomerID);

    boolean createCustomer(CustomerDTO Customer);

    boolean updateCustomer(CustomerDTO Customer);

    boolean createCustomerFromUser(UserDTO user);

    boolean linkCustomerAccount(String CustomerID, String userID);

    boolean delinkCustomerAccount(String userID);
}
