/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.users.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;
import models.dao.images.ImageDAO;
import models.dao.users.UserDAOImpl;
import models.dto.users.customer.CustomerDTO;
import models.dto.users.customer.CustomerDTOImpl;
import utils.DBUtils;
import models.dto.users.UserDTO;

/**
 *
 * @author Admin
 */
public class CustomerDAOImpl extends UserDAOImpl implements CustomerDAO {
    
    public CustomerDAOImpl(ImageDAO imageDAO) {
        super(imageDAO);
    }
    private static final String READ_CUSTOMER = "select customerID, dob, phoneNumber, customerAddress  "
            + "from Customer "
            + "where customerID = ?";
    private static final String READ_ALL_CUSTOMER = "select customerID, dob, phoneNumber, customerAddress "
            + "from Customer ";
    private static final String INSERT_CUSTOMER = "insert into Customer(customerID, dob, phoneNumber, customerAddress) "
            + "values (?, ?, ?, ?)";
    private static final String DELETE_CUSTOMER = "delete from Customer "
            + "where customerID = ?";
    private static final String UPDATE_CUSTOMER = "update Customer "
            + "set dob = ?, phoneNumber = ?, customerAddress = ? "
            + "where customerID = ?";
    
    
    
    @Override
    public CustomerDTO readCustomer(String customerID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        CustomerDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_CUSTOMER);
            stm.setString(1, customerID);
            rs = stm.executeQuery();

            if (rs != null) {
                UserDTO user = this.readUser(customerID, con);
                result = new CustomerDTOImpl(user);
                result.setDob(rs.getDate("dob"));
                result.setCustomerAddress(rs.getString("customerAddress"));
                result.setPhoneNumber(rs.getString("phoneNumber"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
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
    public CustomerDTO readCustomer(String customerID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        CustomerDTO result = null;

        try {
            stm = con.prepareStatement(READ_CUSTOMER);
            stm.setString(1, customerID);
            rs = stm.executeQuery();

            if (rs != null) {
                UserDTO user = this.readUser(customerID, con);
                result = new CustomerDTOImpl(user);
                result.setDob(rs.getDate("dob"));
                result.setCustomerAddress(rs.getString("customerAddress"));
                result.setPhoneNumber(rs.getString("phoneNumber"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        
        return result;
    }
    
    @Override
    public int insertCustomer(CustomerDTO customer) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        
        try {
            con = DBUtils.getConnection();
            
            
            super.insertUser(customer, con);
            stm = con.prepareStatement(INSERT_CUSTOMER);
            stm.setString(1, customer.getUserID());
            stm.setDate(2, customer.getDob());
            stm.setString(3, customer.getPhoneNumber());
            stm.setString(4, customer.getCustomerAddress());
            
            result = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
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
    public int deleteCustomer(String customerID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_CUSTOMER);
            stm.setString(1, customerID);
            
            result = stm.executeUpdate();
            super.deleteUser(customerID, con);
        } catch (SQLException ex) {
            ex.printStackTrace();
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
    public int updateCustomer(CustomerDTO customer) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        
        try {
            super.updateUser(customer);
            
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_CUSTOMER);
            stm.setDate(1, customer.getDob());
            stm.setString(2, customer.getPhoneNumber());
            stm.setString(3, customer.getCustomerAddress());
            stm.setString(4, customer.getUserID());
            
            result = stm.executeUpdate();
            super.insertUser(customer, con);
        } catch (SQLException ex) {
            ex.printStackTrace();
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
    public List<CustomerDTO> readAllCustomers() throws SQLException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        List<CustomerDTO> customerList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(READ_ALL_CUSTOMER);

            while (rs != null) {
                String customerID = rs.getString("customerID");
                UserDTO user = super.readUser(customerID, con);
                CustomerDTO result = new CustomerDTOImpl(user);
                result.setDob(rs.getDate("dob"));
                result.setCustomerAddress(rs.getString("customerAddress"));
                result.setPhoneNumber(rs.getString("phoneNumber"));
            
                if (customerList==null) 
                    customerList = new ArrayList();
                customerList.add(result);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
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
