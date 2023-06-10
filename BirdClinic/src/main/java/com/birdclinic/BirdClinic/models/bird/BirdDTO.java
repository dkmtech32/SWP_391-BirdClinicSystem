package com.birdclinic.BirdClinic.models.bird;

import java.sql.Date;

public interface BirdDTO {

    String getBirdID();

    void setBirdID(String birdID);

    String getCustomerID();

    void setCustomerID(String customerID);

    String getImageID();

    void setImageID(String imageID);

    String getBirdFullname();

    void setBirdFullname(String birdFullname);

    String getBirdGender();

    void setBirdGender(String birdGender);

    String getBreed();

    void setBreed(String breed);

    String getBand();

    void setBand(String band);

    int getBirdAge();

    void setBirdAge(int birdAge);

    String getMicrochip();

    void setMicrochip(String microchip);

    int getBirdWeight();

    void setBirdWeight(int birdWeight);

    String getSexingMethod();

    void setSexingMethod(String sexingMethod);

    String getMedicalHistory();

    void setMedicalHistory(String medicalHistory);

    Date getHatchingDate();

    void setHatchingDate(Date hatchingDate);

    String getFeatherColor();

    void setFeatherColor(String featherColor);

}