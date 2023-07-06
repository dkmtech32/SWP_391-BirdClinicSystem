/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.admin;

import java.sql.SQLException;
import java.util.Map;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.images.ImageDTO;
import models.speciality.SpecialityDTO;
import models.users.UserDTO;
import models.users.customer.CustomerDTOImpl;
import models.users.doctor.DoctorDTO;
import models.users.doctor.DoctorDTOImpl;
import services.general.AccountAlreadyExistsException;
import services.general.AccountDoesNotExist;
import services.general.GeneralServicesImpl;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class AdminServicesImpl extends GeneralServicesImpl {

    public AdminServicesImpl(UserDTO user) throws AccountDoesNotExist {
        if (user.getUserRole().toLowerCase().equals("admin"))
        {
            this.currentUser = user;
        } else throw new AccountDoesNotExist();
    }
    
    public DoctorDTO createDoctor(Map<String, String> args)
            throws AccountAlreadyExistsException, SQLException  {
        //assumption: args have all key-value pairs
        DoctorDTO result = null;
        String username = args.get("username");
        String password = args.get("password");
        String email = args.get("email");
        String academicTitle = args.get("academic-title");
        String degree = args.get("degree");
        int docAge = Integer.parseInt(args.get("doctor-age"));
        String specialityID = args.get("specialityID");
        int yOE = Integer.parseInt(args.get("years-of-experience"));
        

        try {
            ImageDTO image = imageDAO.readImage("whfnhfn3ga98h943ghjanfueafa92rhf");
            SpecialityDTO speciality = specialityDAO.readSpeciality(specialityID);
            String rPassword = Utils.hash(password);
            String userID = Utils.hash(email + username);
            result = new DoctorDTOImpl();
            result.setUserID(userID);
            result.setEmail(email);
            result.setUserName(username);
            result.setUserPassword(rPassword);
            result.setGender("unknown");
            result.setUserRole("doctor");
            result.setImage(image);
            result.setStatus_(true);
            
            //doctor info
            result.setAcademicTitle(academicTitle);
            result.setDegree(degree);
            result.setDocAge(docAge);
            result.setSpeciality(speciality);
            result.setYearsOfExperience(yOE);

            doctorDAO.insertDoctor(result);

        } catch (RecordAlreadyExists ex) {
            throw new AccountAlreadyExistsException(ex.getMessage());
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        }

        return result;
    }
    
    public UserDTO createStaffAdmin(Map<String, String> args) 
            throws AccountAlreadyExistsException, SQLException  {
        //assumption: args have all 4 key-value pairs
        UserDTO result = null;
        String username = args.get("username");
        String password = args.get("password");
        String email = args.get("email");
        String role = args.get("role");

        try {

            String rPassword = Utils.hash(password);
            String userID = Utils.hash(email + username);
            result = new CustomerDTOImpl();
            result.setUserID(userID);
            result.setEmail(email);
            result.setUserName(username);
            result.setUserPassword(rPassword);
            result.setGender("unknown");
            result.setUserRole(role);
            ImageDTO image = imageDAO.readImage("whfnhfn3ga98h943ghjanfueafa92rhf");
            result.setImage(image);
            result.setStatus_(true);
           

            userDAO.insertUser(result);

        } catch (RecordAlreadyExists ex) {
            throw new AccountAlreadyExistsException(ex.getMessage());
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        }

        return result;
    }
}
