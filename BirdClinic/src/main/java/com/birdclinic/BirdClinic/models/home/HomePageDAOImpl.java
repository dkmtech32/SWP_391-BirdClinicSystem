package com.birdclinic.BirdClinic.models.home;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.sql.Types;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

@Repository
public class HomePageDAOImpl implements HomePageDAO {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public List<Map<Integer, String>> getPageHeaders() {
        final String PAGE_HEADERS = "select Home_PageID, Title " +
                "from Home_Page";
        ArrayList<Map<Integer, String>> pageHeadArrayList = new ArrayList<>();

        try {
            jdbcTemplate.query(
                    PAGE_HEADERS,
                    new Object[0],
                    new int[0],
                    (ResultSetExtractor<Object>) (rs) -> {
                        while (rs.next()) {
                            Map<Integer, String> pageHead = new HashMap<Integer, String>();
                            pageHead.put(rs.getInt("Home_PageID"), rs.getString("Title"));
                            pageHeadArrayList.add(pageHead);
                        }
                        return new Object();
                    });
        } catch (EmptyResultDataAccessException ex) {
            ex.printStackTrace();
        }

        return pageHeadArrayList;
    }

    @Override
    public HomePageDTO getPage(int homePageID) {
        final String PAGE_CONTENT = "select Content , Home_PageID, Title " +
                "from Home_Page " +
                "where Home_PageID = ?";

        HomePageDTO homePage = null;

        try {
            homePage = jdbcTemplate.query(
                    PAGE_CONTENT,
                    new Object[] { Integer.valueOf(homePageID) },
                    new int[] { Types.INTEGER },
                    (ResultSetExtractor<HomePageDTO>) (rs) -> {
                        HomePageDTO page = null;
                        while (rs.next()) {
                            page = new HomePageDTOImpl();
                            page.setHomePageID(rs.getInt("Home_PageID"));
                            page.setHomePageContent(rs.getString("Content"));
                            page.setHomePageHeader(rs.getString("Title"));
                        }
                        return page;
                    });
        } catch (EmptyResultDataAccessException ex) {
            ex.printStackTrace();
        }

        return homePage;
    }
}
