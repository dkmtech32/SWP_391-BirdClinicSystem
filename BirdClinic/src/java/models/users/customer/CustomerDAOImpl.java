/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.images.ImageDAO;
import models.users.UserDAOImpl;
import utils.DBUtils;
import models.users.UserDTO;

/**
 *
 * @author Admin
 */
public class CustomerDAOImpl extends UserDAOImpl implements CustomerDAO {

    public CustomerDAOImpl(ImageDAO imageDAO) {
        super(imageDAO);
    }

    private static final String READ_CUSTOMER 
            = "select customerID, dob, customerAddress  "
            + "from Customer "
            + "where customerID = ?";
    private static final String READ_ALL_CUSTOMER 
            = "select customerID, dob, customerAddress "
            + "from Customer ";
    private static final String INSERT_CUSTOMER 
            = "insert into Customer(customerID, dob, customerAddress) "
            + "values (?, ?, ?)";
    private static final String DELETE_CUSTOMER 
            = "delete from Customer "
            + "where customerID = ?";
    private static final String UPDATE_CUSTOMER 
            = "update Customer "
            + "set dob = ?, customerAddress = ? "
            + "where customerID = ?";

    @Override
    public CustomerDTO readCustomer(String customerID)
            throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        CustomerDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_CUSTOMER);
            stm.setString(1, customerID);
            rs = stm.executeQuery();

            if (rs.next()) {
                UserDTO user = this.readUser(customerID);
                result = new CustomerDTOImpl(user);
                result.setDob(rs.getDate("dob"));
                result.setCustomerAddress(rs.getString("customerAddress"));
            }

            if (result == null) {
                throw new NoSuchCustomerExistsException();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    @Override
    public int insertCustomer(CustomerDTO customer) 
            throws SQLException, RecordAlreadyExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();

            int insertUser = super.insertUser(customer);
            if (insertUser > 0) {
                stm = con.prepareStatement(INSERT_CUSTOMER);
                stm.setString(1, customer.getUserID());
                stm.setDate(2, customer.getDob());
                stm.setString(3, customer.getCustomerAddress());

                result += stm.executeUpdate();
            }
            
            if (result <= 1) throw new CustomerAlreadyExistsException();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    @Override
    public int deleteCustomer(String customerID) 
            throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_CUSTOMER);
            stm.setString(1, customerID);

            result = stm.executeUpdate() + super.deleteUser(customerID);
            if (result == 1) {
                throw new NoSuchCustomerExistsException();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    @Override
    public int updateCustomer(CustomerDTO customer) 
            throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_CUSTOMER);
            stm.setDate(1, customer.getDob());
            stm.setString(2, customer.getCustomerAddress());
            stm.setString(3, customer.getUserID());

            result = stm.executeUpdate();
            if (result == 1) {
                throw new NoSuchCustomerExistsException();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    @Override
    public List<CustomerDTO> readAllCustomers()
            throws NoSuchRecordExists, SQLException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        List<CustomerDTO> customerList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(READ_ALL_CUSTOMER);

            while (rs.next()) {
                String customerID = rs.getString("customerID");
                UserDTO user = super.readUser(customerID);
                CustomerDTO result = new CustomerDTOImpl(user);
                result.setDob(rs.getDate("dob"));
                result.setCustomerAddress(rs.getString("customerAddress"));

                if (customerList == null) {
                    customerList = new ArrayList();
                }
                customerList.add(result);
            }
            if (customerList == null || customerList.isEmpty()) {
                throw new NoSuchCustomerExistsException();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return customerList;
    }

    @Override
    public List<CustomerDTO> readListOfCustomers(List<String> customerIDs)
            throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<CustomerDTO> customerList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_CUSTOMER);

            List<UserDTO> users = super.readListOfUsers(customerIDs);

            for (UserDTO user : users) {
                stm.setString(1, user.getUserID());
                rs = stm.executeQuery();

                while (rs.next()) {
                    CustomerDTO result = new CustomerDTOImpl(user);
                    result.setDob(rs.getDate("dob"));
                    result.setCustomerAddress(rs.getString("customerAddress"));

                    if (customerList == null) {
                        customerList = new ArrayList();
                    }
                    customerList.add(result);
                }
            }

            if (customerList == null || customerList.isEmpty()) {
                throw new NoSuchCustomerExistsException();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return customerList;
    }
}
