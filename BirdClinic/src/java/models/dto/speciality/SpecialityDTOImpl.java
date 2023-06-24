/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.speciality;

/**
 *
 * @author Admin
 */
public class SpecialityDTOImpl implements SpecialityDTO {
    private String specialityID;
    private String specialityName;

    public SpecialityDTOImpl() {
    }

    public SpecialityDTOImpl(String specialityID, String specialityName) {
        this.specialityID = specialityID;
        this.specialityName = specialityName;
    }

    @Override
    public String getSpecialityID() {
        return specialityID;
    }

    @Override
    public void setSpecialityID(String specialityID) {
        this.specialityID = specialityID;
    }

    @Override
    public String getSpecialityName() {
        return specialityName;
    }

    @Override
    public void setSpecialityName(String specialityName) {
        this.specialityName = specialityName;
    }
    
    
}
