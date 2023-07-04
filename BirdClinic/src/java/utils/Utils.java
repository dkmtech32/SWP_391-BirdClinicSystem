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
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
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
    
    public static List<Date> getDaysInWeek(java.sql.Date date) {
        List<Date> daysInWeek = new ArrayList<>();

        // Create a calendar instance and set the provided date
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        // Find the first day of the week
        int firstDayOfWeek = calendar.getFirstDayOfWeek();
        calendar.set(Calendar.DAY_OF_WEEK, firstDayOfWeek);

        // Add each day of the week to the list
        for (int i = 0; i < 7; i++) {
            daysInWeek.add(new Date(calendar.getTimeInMillis()));
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
    
    public static boolean checkPassword(String password) {
        if (password == null) {
            return false;
        }
        if (password.trim().equals("")) return false;
        return password.matches("^(?=.*[A-Z])(?=.*\\d).+$");
    }
}
