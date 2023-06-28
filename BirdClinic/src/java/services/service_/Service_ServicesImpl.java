/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.service_;

import java.sql.SQLException;
import java.util.List;
import models.dao.service_.Service_DAO;
import models.dao.service_.Service_DAOImpl;
import models.dao.speciality.SpecialityDAO;
import models.dao.speciality.SpecialityDAOImpl;
import models.dto.service_.Service_DTO;
import models.dto.speciality.SpecialityDTO;

/**
 *
 * @author Admin
 */
public class Service_ServicesImpl implements Service_Services {
    private final SpecialityDAO specialityDAO;
    private final Service_DAO service_DAO;

    public Service_ServicesImpl() {
        this.specialityDAO = new SpecialityDAOImpl();
        this.service_DAO = new Service_DAOImpl(specialityDAO);
    }
    
    @Override
    public List<Service_DTO> getAllService_() throws NoSuchService_ExistsException {
        List<Service_DTO> services = null;
        
        try {
            services = service_DAO.readAllService_();
        } catch (SQLException ex) {
            throw new NoSuchService_ExistsException();
        }
        
        return services;
    }
    
    @Override
    public List<Service_DTO> getService_BySpeciality(String specialityID) 
            throws NoSuchService_ExistsException, NoSuchSpecialityExistsException {
        List<Service_DTO> services = null;
        
        try {
            SpecialityDTO speciality = specialityDAO.readSpeciality(specialityID);
            if (speciality == null) throw new NoSuchSpecialityExistsException();
            services = service_DAO.readServiceBySpeciality(specialityID);
        } catch (SQLException ex) {
            throw new NoSuchSpecialityExistsException();
        }
        
        return services;
    }
}
