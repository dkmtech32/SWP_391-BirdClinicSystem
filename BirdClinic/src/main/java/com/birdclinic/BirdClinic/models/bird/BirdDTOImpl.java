package com.birdclinic.BirdClinic.models.bird;

import java.sql.Date;

public class BirdDTOImpl implements BirdDTO {
    private String birdID;
    private String customerID;
    private String imageID;
    private String birdFullname;
    private String birdGender;
    private String breed;
    private String band;
    private int birdAge;
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
    public String getCustomerID() {
        return customerID;
    }

    @Override
    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    @Override
    public String getImageID() {
        return imageID;
    }

    @Override
    public void setImageID(String imageID) {
        this.imageID = imageID;
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
    public int getBirdAge() {
        return birdAge;
    }

    @Override
    public void setBirdAge(int birdAge) {
        this.birdAge = birdAge;
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
