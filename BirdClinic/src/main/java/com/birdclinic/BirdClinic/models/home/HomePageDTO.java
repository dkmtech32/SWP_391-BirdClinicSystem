package com.birdclinic.BirdClinic.models.home;

import java.io.Serializable;

public interface HomePageDTO extends Serializable {
    
    int gethomePageID();

    String gethomePageContent();

    String gethomePageHeader();

    void setHomePageID(int homePageID);

    void setHomePageContent(String homePageHeader);
    
    void setHomePageHeader(String homePageContent);

    // int generatehomePage(String newContentString, String newHeaderString);    
}
