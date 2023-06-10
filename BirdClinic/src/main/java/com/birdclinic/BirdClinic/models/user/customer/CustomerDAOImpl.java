package com.birdclinic.BirdClinic.models.user.customer;

import java.sql.Types;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.birdclinic.BirdClinic.models.user.UserDAOImpl;
import com.birdclinic.BirdClinic.models.user.UserDTO;
import com.birdclinic.BirdClinic.models.user.doctor.DoctorDTO;

@Repository
public class CustomerDAOImpl extends UserDAOImpl implements CustomerDAO {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public CustomerDTO readCustomer(String CustomerID) {
        CustomerDTO result = null;

        return result;
    }

    @Override
    public boolean deleteCustomer(String CustomerID) {
        boolean result = false;

        return result;
    }

    @Override
    public boolean createCustomer(CustomerDTO Customer) {
        boolean result = false;

        return result;
    }

    @Override
    public boolean updateCustomer(CustomerDTO Customer) {
        boolean result = false;

        return result;
    }

    @Override
    public boolean createCustomerFromUser(UserDTO user) {
       boolean result = false;

        return result;
    }

    @Override
    public boolean linkCustomerAccount(String CustomerID, String userID) {
        boolean result = false;

        return result;
    }

    @Override
    public boolean delinkCustomerAccount(String userID) {
        boolean result = false;

        return result;
    }
    
}
