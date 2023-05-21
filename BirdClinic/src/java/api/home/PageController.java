/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api.home;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PageController", urlPatterns = {"/home/page"})
public class PageController extends HttpServlet {

    //this is a test controller. however, this is also a guideline for how to create api.
    //web.xml has to be set like that. the cors init param should be fixed but for the dev version we can keep the *
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String resp = "This was sent by a GET Method";
        //basically this is the processing part.
        //after you're done, turn the data into a string to send to client

        JSONObject json = new JSONObject();
        json.put("server", resp);
        //add all data to the json object to send with the response

        String output;
        try (StringWriter sw = new StringWriter(); BufferedWriter JSONWriter = new BufferedWriter(sw);) {
            json.writeJSONString(JSONWriter);
            JSONWriter.flush();
            output = sw.getBuffer().toString();
        }
        //write to an common output to send to the response

        response.setContentType("application/json");
        response.setStatus(200);
        response.getOutputStream().print(output);
        //write your own response msg for fun <3
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //{"client":"hi this is the client"}
        JSONObject json;
        JSONParser parser = new JSONParser();

        InputStream input = request.getInputStream();
        BufferedReader JSONReader = new BufferedReader(new InputStreamReader(input));
        StringBuilder result = new StringBuilder();
        String line;
        while ((line = JSONReader.readLine()) != null) {
            result.append(line);
        }
        //read json data from client. all security stuff still apply tho

        try (StringWriter sw = new StringWriter(); BufferedWriter JSONWriter = new BufferedWriter(sw);) {
            Object obj = parser.parse(result.toString());
//            JSONArray array = (JSONArray) obj;
            json = (JSONObject) obj;
            //turn json string into actual map. list is if json is a list. you can now read info

            json.put("server", "hi this is the server");
            json.writeJSONString(JSONWriter);
            JSONWriter.flush();
            String output = sw.getBuffer().toString();
            //process info for output. this block doesn't write over the data, but you need to sometimes.

            response.setContentType("application/json");
            response.setStatus(200);
            response.getOutputStream().print(output);
            //write your own response msg for fun <3
        } catch (ParseException pe) {

            System.out.println("position: " + pe.getPosition());
            System.out.println(pe);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

/*
here's the js code to poll response from server. if it's in json form (almost always), get <await response.json()>. reminder that this is async
    let sendGET = async () => {
        return await fetch(url, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            },
        })
    }

    let sendPOST = async (data) => {
        return await fetch(url, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(data)
        })
    }
 */
