package com.birdclinic.BirdClinic.models.user;

import java.io.Serializable;

public interface UserDAO extends Serializable {

    UserDTO readUser(String userID);

    boolean createUser(UserDTO user);

    boolean deleteUser(String userID);

    boolean updateUser(UserDTO user);

}