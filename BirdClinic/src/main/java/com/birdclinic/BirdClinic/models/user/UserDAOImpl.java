package com.birdclinic.BirdClinic.models.user;

import java.util.List;
import java.util.ArrayList;
// import java.util.Map;
// import java.util.HashMap;
import java.sql.Types;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {
    // private List<UserDTO> userList = null;

    public UserDAOImpl() {
    }

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public UserDTO readUser(String userID) {
        UserDTO user = null;

        String sqlString = "select userName, userPassword, imageID, email, userRole " +
                "from Users " +
                "where userID = ?";

        if (!userID.trim().equals("")) {
            try {
                user = jdbcTemplate.query(
                        sqlString,
                        new String[] { userID },
                        new int[] { Types.VARCHAR },
                        (ResultSetExtractor<UserDTO>) (rs) -> {
                            UserDTO newUser = new UserDTOImpl();
                            if (rs.next()) {
                                newUser.setUserID(userID);
                                newUser.setUserName(rs.getString("userName"));
                                newUser.setUserPassword(rs.getString("userPassword"));
                                newUser.setUserRole(rs.getString("userRole"));
                                newUser.setImageID(rs.getString("imageID"));
                            }
                            return newUser;
                        });
            } catch (EmptyResultDataAccessException ex) {
                System.out.println("No users found");
                ex.printStackTrace();
            }
        }

        return user;
    }

    @Override
    public boolean createUser(UserDTO user) {
        boolean result = false;
        String sqlString = "insert into Users(userID, userName, userPassword, userRole, email, imageID) " +
                "values (?, ?, ?, ?, ?, ?)";
        if (user != null && !user.getUserID().trim().equals("")) {
            try {
                int colNum = jdbcTemplate.update(
                        sqlString,
                        (stm) -> {
                            stm.setString(1, user.getUserID());
                            stm.setString(2, user.getUserName());
                            stm.setString(3, user.getUserPassword());
                            stm.setString(4, user.getUserRole());
                            stm.setString(5, user.getEmail());
                            stm.setString(6, user.getImageID());
                        });
                if (colNum > 0)
                    result = true;
            } catch (DataAccessException ex) {
                System.out.println("No users added");
                ex.printStackTrace();
            }
        }
        return result;
    }

    @Override
    public boolean deleteUser(String userID) {
        boolean result = false;
        String sqlString = "delete from Users " +
                "where userID = ?";
        if (!userID.trim().equals("")) {
            try {
                int colNum = jdbcTemplate.update(
                        sqlString,
                        (stm) -> {
                            stm.setString(1, userID);
                        });
                if (colNum > 0)
                    result = true;
            } catch (DataAccessException ex) {
                System.out.println("No users added");
                ex.printStackTrace();
            }
        }
        return result;
    }

    @Override
    public boolean updateUser(UserDTO user) {
        boolean result = false;
        //check if new info is same as old info
        UserDTO currentUser = readUser(user.getUserID());
        String sqlString = "update Users set ";
        StringBuilder builder = new StringBuilder(sqlString);
        List<String> argsList = new ArrayList<String>();

        int count = 0;
        //go through each field and see which is same as the old one. only add new values to sql string + update list
        if (user != null && !user.getUserID().trim().equals("")) {
            if (!user.getUserName().equals(currentUser.getUserName())) {
                builder.append("userName = ? ");
                count++;
                argsList.add(user.getUserName());
            }
            if (!user.getUserPassword().equals(currentUser.getUserPassword())) {
                if (count > 0)
                    builder.append(", ");
                builder.append("userPassword = ? ");
                count++;
                argsList.add(user.getUserPassword());
            }
            if (!user.getUserRole().equals(currentUser.getUserRole())) {
                if (count > 0)
                    builder.append(", ");
                builder.append("userRole = ? ");
                count++;
                argsList.add(user.getUserRole());
            }
            if (!user.getEmail().equals(currentUser.getEmail())) {
                if (count > 0)
                    builder.append(", ");
                builder.append("email = ? ");
                count++;
                argsList.add(user.getEmail());
            }
            if (!user.getImageID().equals(currentUser.getImageID())) {
                if (count > 0)
                    builder.append(", ");
                builder.append("imageID = ? ");
                count++;
                argsList.add(user.getImageID());
            }

            //if there are more than 1 field that needs updating
            if (count != 0) {
                sqlString = builder.toString();
                final int finalCount = count;

                try {
                    int colNum = jdbcTemplate.update(
                            sqlString,
                            (stm) -> {
                                for (int i = 0; i < finalCount; i++) {
                                    stm.setString(i, argsList.get(i));
                                }
                            });
                    if (colNum > 0)
                        result = true;
                } catch (DataAccessException ex) {
                    System.out.println("No users added");
                    ex.printStackTrace();
                }
            }
        }
        return result;
    }
}
