/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.Normalizer;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/**
 *
 * @author Thanh
 */
public class Utils {

    public static String removeAccent(String s) {

        String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(temp).replaceAll("");
    }

    public static int nthLastIndexOf(int nth, String ch, String string) {
        if (nth <= 0) {
            return string.length();
        }
        return nthLastIndexOf(--nth, ch, string.substring(0, string.lastIndexOf(ch)));
    }

    public static String hash(String password) {
        try {
            MessageDigest m = MessageDigest.getInstance("MD5");
            m.update(password.getBytes());
            byte[] bytes = m.digest();
            StringBuilder s = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                s.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            return s.toString();
        } catch (NoSuchAlgorithmException e) {
            return "";
        }
    }

    public static String getAlphaNumericString(int n) {

        // choose a Character random from this String
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";

        // create StringBuffer size of AlphaNumericString
        StringBuilder sb = new StringBuilder(n);

        for (int i = 0; i < n; i++) {

            // generate a random number between
            // 0 to AlphaNumericString variable length
            int index
                    = (int) (AlphaNumericString.length()
                    * Math.random());

            // add Character one by one in end of sb
            sb.append(AlphaNumericString
                    .charAt(index));
        }

        return sb.toString();
    }

    public static Map<String, Date> getDaysInWeek(java.sql.Date date, String[] weekdays) {
        Map<String, Date> daysInWeek = new HashMap<>();

        // Create a calendar instance and set the provided date
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        // Find the first day of the week
        int firstDayOfWeek = calendar.getFirstDayOfWeek();
        calendar.set(Calendar.DAY_OF_WEEK, firstDayOfWeek);

        // Add each day of the week to the list
        for (int i = 0; i < 7; i++) {
            Date day = new Date(calendar.getTimeInMillis());
            String weekday = weekdays[i];
            daysInWeek.put(weekday, day);
            calendar.add(Calendar.DAY_OF_MONTH, 1);
        }

        return daysInWeek;
    }

    public static Date getNextWeekWeekday(java.sql.Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        // Set the calendar to the next week
        calendar.add(Calendar.WEEK_OF_YEAR, 1);

        // Find the next Monday
        int currentDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        int daysUntilNextMonday = (Calendar.MONDAY - currentDayOfWeek + 7) % 7;
        calendar.add(Calendar.DAY_OF_WEEK, daysUntilNextMonday);

        // Get the date of the next Monday
        java.util.Date nextMonday = calendar.getTime();

        // Convert java.util.Date to java.sql.Date
        return new java.sql.Date(nextMonday.getTime());
    }

    public static Date getPreviousWeek(java.sql.Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        // Set the calendar to the previous week
        calendar.add(Calendar.WEEK_OF_YEAR, -1);

        // Get the date one week before
        java.util.Date previousWeek = calendar.getTime();

        // Convert java.util.Date to java.sql.Date
        return new java.sql.Date(previousWeek.getTime());
    }

    public static Date getLastWeekWeekday(java.sql.Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        // Set the calendar to the previous week
        calendar.add(Calendar.WEEK_OF_YEAR, -1);

        // Find the last Monday
        int currentDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        int daysUntilLastMonday = (Calendar.MONDAY - currentDayOfWeek - 7) % 7;
        calendar.add(Calendar.DAY_OF_WEEK, daysUntilLastMonday);

        // Get the date of the last Monday
        java.util.Date lastMonday = calendar.getTime();

        // Convert java.util.Date to java.sql.Date
        return new java.sql.Date(lastMonday.getTime());
    }
    
    public static Map<String, Date> sortDates(Map<String, Date> unsortedDates) {
        // Convert the Map to a List of Map entries
        List<Map.Entry<String, Date>> list = new LinkedList<>(unsortedDates.entrySet());

        // Sort the list based on the Date values
        Collections.sort(list, new Comparator<Map.Entry<String, Date>>() {
            public int compare(Map.Entry<String, Date> o1, Map.Entry<String, Date> o2) {
                return o1.getValue().compareTo(o2.getValue());
            }
        });

        // Create a new LinkedHashMap to store the sorted entries
        Map<String, Date> sortedDates = new LinkedHashMap<>();

        // Populate the sortedDates map with the sorted entries
        for (Map.Entry<String, Date> entry : list) {
            sortedDates.put(entry.getKey(), entry.getValue());
        }

        return sortedDates;
    }


    public static boolean checkPassword(String password) {
        if (password == null) {
            return false;
        }
        if (password.trim().equals("")) {
            return false;
        }
        return password.matches("^(?=.*[A-Z])(?=.*\\d).+$");
    }

    public static String getFromMap(Map<String, String[]> args, String name, String def) {
        String value = args.get(name)[0];
        if (value == null) {
            value = def;
        }
        return value;
    }
}
