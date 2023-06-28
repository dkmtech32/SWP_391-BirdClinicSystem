/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.bird;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import models.dao.bird.BirdDAO;
import models.dao.bird.BirdDAOImpl;
import models.dao.images.ImageDAO;
import models.dao.images.ImageDAOImpl;
import models.dao.users.customer.CustomerDAO;
import models.dao.users.customer.CustomerDAOImpl;
import models.dto.bird.BirdDTO;
import models.dto.bird.BirdDTOImpl;
import models.dto.images.ImageDTO;
import models.dto.users.customer.CustomerDTO;
import services.account.customer.NoSuchCustomerExistsException;
import utils.StringUtil;

/**
 *
 * @author Admin
 */
public class BirdServicesImpl implements BirdServices {

    private final BirdDAO birdDAO;
    private final CustomerDAO customerDAO;
    private final ImageDAO imageDAO;

    public BirdServicesImpl() {
        imageDAO = new ImageDAOImpl();
        customerDAO = new CustomerDAOImpl(imageDAO);
        birdDAO = new BirdDAOImpl(imageDAO, customerDAO);
    }

    @Override
    public List<BirdDTO> getBirdsOfCustomer(String customerID) throws NoSuchCustomerExistsException {
        List<BirdDTO> result = null;

        try {
            CustomerDTO customer = customerDAO.readCustomer(customerID);
            if (customer != null) {
                result = birdDAO.readAllBirdByCustomer(customerID);
            }
        } catch (SQLException ex) {
            throw new NoSuchCustomerExistsException();
        }

        return result;
    }

    @Override
    public boolean addBird(Map<String, String> args, CustomerDTO customer) throws NoSuchCustomerExistsException {
        boolean result = false;
        //assumption: all fields are non null and not empty strings (except for medical history)
        try {
            if (customer != null) {
                BirdDTO bird = new BirdDTOImpl();
                
                String imageID = "05b5b4345d8ac2f73ece3df15be03230";
                ImageDTO image = imageDAO.readImageDb(imageID);
                String birdFullname = args.get("birdFullname");
                String birdGender = args.get("birdGender");
                String breed = args.get("breed");
                String band_chip = args.get("band_chip");
                int birdWeight = Integer.parseInt(args.get("birdWeight"));
                String sexingMethod = args.get("sexingMethod");
                String medicalHistory = args.get("medicalHistory");
                Date hatchingDate = Date.valueOf(args.get("hatchingDate"));
                String featherColor = args.get("featherColor");
                String birdID = StringUtil.hash(birdFullname + breed);
                
                bird.setBirdID(birdID);
                bird.setCustomer(customer);
                bird.setImage(image);
                bird.setBirdFullname(birdFullname);
                bird.setBirdGender(birdGender);
                bird.setBreed(breed);
                bird.setBand_Chip(band_chip);
                bird.setBirdWeight(birdWeight);
                bird.setSexingMethod(sexingMethod);
                bird.setMedicalHistory(medicalHistory);
                bird.setHatchingDate(hatchingDate);
                bird.setFeatherColor(featherColor);

                result = birdDAO.insertBird(bird)>0;
            }
        } catch (SQLException ex) {
            throw new NoSuchCustomerExistsException();
        }

        return result;
    }
}
