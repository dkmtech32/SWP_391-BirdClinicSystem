package com.birdclinic.BirdClinic.controllers.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

// import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.birdclinic.BirdClinic.models.home.HomePageDAO;
import com.birdclinic.BirdClinic.models.home.HomePageDTO;

@RestController
@RequestMapping(
    value = "/home")
public class HomeController {
    @Autowired
    HomePageDAO homePageDAO;

    @GetMapping(
            value = "",
            produces = "application/json")
    public List<Map<Integer, String>> getPageHeaderList() {
        List<Map<Integer, String>> headerList = homePageDAO.getPageHeaders();
        return headerList;
    }

    @GetMapping(
            value = "/{id}",
            produces = "application/json")
    public HomePageDTO getPage(@PathVariable("id") String id) {
        HomePageDTO page = null;
        page = homePageDAO.getPage(Integer.parseInt(id));
        return page;
    }
}
