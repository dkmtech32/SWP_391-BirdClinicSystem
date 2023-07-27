/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.service_;

import java.math.BigDecimal;
import java.util.Objects;
import models.speciality.SpecialityDTO;

/**
 *
 * @author Admin
 */
public class Service_DTOImpl implements Service_DTO {
    private String serviceID;
    private SpecialityDTO speciality;
    private String serviceName;
    private BigDecimal servicePrice;

    public Service_DTOImpl() {
    }

    public Service_DTOImpl(String serviceID, SpecialityDTO speciality, String serviceName, BigDecimal servicePrice) {
        this.serviceID = serviceID;
        this.speciality = speciality;
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
    }

    @Override
    public String getServiceID() {
        return serviceID;
    }

    @Override
    public void setServiceID(String serviceID) {
        this.serviceID = serviceID;
    }

    @Override
    public SpecialityDTO getSpeciality() {
        return speciality;
    }

    @Override
    public void setSpeciality(SpecialityDTO speciality) {
        this.speciality = speciality;
    }

    @Override
    public String getServiceName() {
        return serviceName;
    }

    @Override
    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    @Override
    public BigDecimal getServicePrice() {
        return servicePrice;
    }

    @Override
    public void setServicePrice(BigDecimal servicePrice) {
        this.servicePrice = servicePrice;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 23 * hash + Objects.hashCode(this.serviceID);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Service_DTOImpl other = (Service_DTOImpl) obj;
        if (!Objects.equals(this.serviceID, other.serviceID)) {
            return false;
        }
        return true;
    }
    
    
}
