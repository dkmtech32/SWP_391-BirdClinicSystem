/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.service_;

import models.dto.speciality.SpecialityDTO;

/**
 *
 * @author Admin
 */
public class Service_DTOImpl implements Service_DTO {
    private String serviceID;
    private SpecialityDTO speciality;
    private String serviceName;
    private int servicePrice;

    public Service_DTOImpl() {
    }

    public Service_DTOImpl(String serviceID, SpecialityDTO speciality, String serviceName, int servicePrice) {
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
    public int getServicePrice() {
        return servicePrice;
    }

    @Override
    public void setServicePrice(int servicePrice) {
        this.servicePrice = servicePrice;
    }
    
    
}
