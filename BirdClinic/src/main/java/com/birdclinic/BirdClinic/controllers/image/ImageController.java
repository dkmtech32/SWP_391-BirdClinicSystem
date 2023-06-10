package com.birdclinic.BirdClinic.controllers.image;

import java.io.File;
import java.io.IOException;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestBody;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestBody;
// import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ImageController {

    @GetMapping(
        value = "/img/{url}",
        produces = MediaType.IMAGE_PNG_VALUE
    )
    public ResponseEntity<FileSystemResource> getImage(@PathVariable("url") String url) {
        ResponseEntity<FileSystemResource> result = new ResponseEntity<FileSystemResource>(null, null, HttpStatusCode.valueOf(204));
        
        try {
            String path = new File("../images").getCanonicalPath() + "/" + url;

            FileSystemResource image = new FileSystemResource(path);

            result = new ResponseEntity<FileSystemResource>(image, HttpStatusCode.valueOf(200));
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        return result;
    }

    // @PostMapping(
    //     value = "/img/{filename}",
    //     produces = MediaType.IMAGE_PNG_VALUE
    // )
    // public ResponseEntity<Boolean> uploadImage(
    //     @PathVariable("filename") String filename, 
    //     @RequestBody FileSystemResource imageFile
    //     )
    //     {
    //         ResponseEntity<Boolean> result = new ResponseEntity<Boolean>(false, HttpStatusCode.valueOf(204));

    //         try {
    //         String path = new File("../images").getCanonicalPath() + "/" + filename;
            
    //         result = new ResponseEntity<Boolean>(true, HttpStatusCode.valueOf(200));
    //     } catch (IOException ex) {
    //         ex.printStackTrace();
    //     } 

    //         return result;
    //     }
}
