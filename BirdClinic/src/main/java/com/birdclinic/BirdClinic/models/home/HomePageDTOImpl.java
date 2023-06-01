package com.birdclinic.BirdClinic.models.home;

public class HomePageDTOImpl implements HomePageDTO {
    private int homePageID;
    private String homePageHeader;
    private String homePageContent;

    public HomePageDTOImpl() {
    }

    public HomePageDTOImpl(int id, String content, String header) {
        homePageID = id;
        homePageContent = content;
        homePageHeader = header;
    }

    //get homepage to display

    @Override
    public int gethomePageID() {
        return homePageID;
    }

    @Override
    public String gethomePageContent() {
        return homePageContent;
    }

    @Override
    public String gethomePageHeader() {
        return homePageHeader;
    }

    //for DAO

    @Override
    public void setHomePageID(int homePageID) {
        this.homePageID = homePageID;
    }

    @Override
    public void setHomePageHeader(String homePageHeader) {
        this.homePageHeader = homePageHeader;
    }

    @Override
    public void setHomePageContent(String homePageContent) {
        this.homePageContent = homePageContent;
    }
}
