package com.birdclinic.BirdClinic.controllers.test;

import java.io.File;
import java.io.IOException;

// import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
// import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.PathVariable;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

// import com.birdclinic.BirdClinic.models.home.HomePageDTO;
// import com.birdclinic.BirdClinic.models.home.HomePageDTOImpl;

// import java.util.ArrayList;
// import java.util.List;
// import java.util.Map;

// import com.birdclinic.BirdClinic.models.home.HomePageDAO;
// import com.birdclinic.BirdClinic.models.home.HomePageDTO;
// import com.birdclinic.BirdClinic.services.home.HomeService;

@RestController
@RequestMapping(value = "/home")
public class TestController {

    @GetMapping(value = "", produces = MediaType.IMAGE_PNG_VALUE)
    public ResponseEntity<FileSystemResource> getPageHeaderList() {
        // HomePageDTO test = new HomePageDTOImpl();
        String url = "6.123c.png";
        ResponseEntity<FileSystemResource> result = new ResponseEntity<FileSystemResource>(null, null, HttpStatusCode.valueOf(200));
        try {
            String path = new File(".").getCanonicalPath()+"/images/" + url;
            FileSystemResource image = new FileSystemResource(path);
            result = new ResponseEntity<FileSystemResource>(image, HttpStatusCode.valueOf(200) );
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return result;

        // //get service result
        // Object headerList = homeService.getPageHeaderList();

        // //set headers
        // HttpHeaders headers = new HttpHeaders();
        // headers.add(HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN, "*");
        // // if (headerList!=null) {

        // // }

        // //set status code
        // HttpStatusCode statusCode;
        // if (headerList!=null) {
        // statusCode = HttpStatusCode.valueOf(200);
        // }
        // else {
        // statusCode = HttpStatusCode.valueOf(204);
        // }

        // ResponseEntity<Object> result = new ResponseEntity<Object>(headerList,
        // headers, statusCode);
        // return result;
    }
}
