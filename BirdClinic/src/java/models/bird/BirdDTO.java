/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.bird;

import java.io.Serializable;
import java.sql.Date;
import models.images.ImageDTO;
import models.users.customer.CustomerDTO;

/**
 *
 * @author Admin
 */
public interface BirdDTO extends Serializable {

    String getBirdFullname();

    String getBirdGender();

    String getBirdID();

    int getBirdWeight();

    String getBreed();

    CustomerDTO getCustomer();

    String getFeatherColor();

    Date getHatchingDate();

    ImageDTO getImage();

    String getMedicalHistory();

    String getBand_Chip();

    String getSexingMethod();

    void setBirdFullname(String birdFullname);

    void setBirdGender(String birdGender);

    void setBirdID(String birdID);

    void setBirdWeight(int birdWeight);

    void setBreed(String breed);

    void setCustomer(CustomerDTO customer);

    void setFeatherColor(String featherColor);

    void setHatchingDate(Date hatchingDate);

    void setImage(ImageDTO image);

    void setMedicalHistory(String medicalHistory);

    void setBand_Chip(String band_chip);

    void setSexingMethod(String sexingMethod);
    
}
