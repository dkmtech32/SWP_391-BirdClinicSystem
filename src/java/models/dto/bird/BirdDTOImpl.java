/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.bird;

import java.sql.Date;
import models.dto.images.ImageDTO;
import models.dto.users.customer.CustomerDTO;

/**
 *
 * @author Admin
 */
public class BirdDTOImpl implements BirdDTO {
    private String birdID;
    private CustomerDTO customer;
    private ImageDTO image;
    private String birdFullname;
    private String birdGender;
    private String breed;
    private String band;
    private String microchip;
    private int birdWeight;
    private String sexingMethod;
    private String medicalHistory;
    private Date hatchingDate;
    private String featherColor;

    public BirdDTOImpl() {

    }

    
    @Override
    public String getBirdID() {
        return birdID;
    }

    
    @Override
    public void setBirdID(String birdID) {
        this.birdID = birdID;
    }

    
    @Override
    public CustomerDTO getCustomer() {
        return customer;
    }

    
    @Override
    public void setCustomer(CustomerDTO customer) {
        this.customer = customer;
    }

    
    @Override
    public ImageDTO getImage() {
        return image;
    }

    
    @Override
    public void setImage(ImageDTO image) {
        this.image = image;
    }

    
    @Override
    public String getBirdFullname() {
        return birdFullname;
    }

    
    @Override
    public void setBirdFullname(String birdFullname) {
        this.birdFullname = birdFullname;
    }

    
    @Override
    public String getBirdGender() {
        return birdGender;
    }

    
    @Override
    public void setBirdGender(String birdGender) {
        this.birdGender = birdGender;
    }

    
    @Override
    public String getBreed() {
        return breed;
    }

    
    @Override
    public void setBreed(String breed) {
        this.breed = breed;
    }

    
    @Override
    public String getBand() {
        return band;
    }

    
    @Override
    public void setBand(String band) {
        this.band = band;
    }

    
    @Override
    public String getMicrochip() {
        return microchip;
    }

    
    @Override
    public void setMicrochip(String microchip) {
        this.microchip = microchip;
    }

    
    @Override
    public int getBirdWeight() {
        return birdWeight;
    }

    
    @Override
    public void setBirdWeight(int birdWeight) {
        this.birdWeight = birdWeight;
    }

    
    @Override
    public String getSexingMethod() {
        return sexingMethod;
    }

    
    @Override
    public void setSexingMethod(String sexingMethod) {
        this.sexingMethod = sexingMethod;
    }

    
    @Override
    public String getMedicalHistory() {
        return medicalHistory;
    }

    
    @Override
    public void setMedicalHistory(String medicalHistory) {
        this.medicalHistory = medicalHistory;
    }

    
    @Override
    public Date getHatchingDate() {
        return hatchingDate;
    }

    
    @Override
    public void setHatchingDate(Date hatchingDate) {
        this.hatchingDate = hatchingDate;
    }

    
    @Override
    public String getFeatherColor() {
        return featherColor;
    }

    
    @Override
    public void setFeatherColor(String featherColor) {
        this.featherColor = featherColor;
    }
}
