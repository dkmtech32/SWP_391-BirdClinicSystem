package com.birdclinic.BirdClinic.models.home;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
// import org.springframework.jdbc.core.ResultSetExtractor;



public interface HomePageDAO extends Serializable {
    public List<Map<Integer, String>> getPageHeaders();
    public HomePageDTO getPage(int homePageID);
}
