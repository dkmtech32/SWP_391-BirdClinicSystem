/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filters;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.dto.users.UserDTO;

/**
 *
 * @author Admin
 */
//@WebFilter(filterName = "AuthorizationFilter", urlPatterns = {"/customer/*", "/doctor/*", "/staff/*", "/admin/*"})
public class AuthorizationFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
//    private static final String LOGIN_PAGE = "guest/login.jsp";

    public AuthorizationFilter() {

    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletResponse res = (HttpServletResponse) response;
        if (res.getStatus()!=401) {
            HttpServletRequest req = (HttpServletRequest) request;
            String url = req.getRequestURI().split(req.getContextPath())[1];
            String authPattern = url.split("/")[1];
            HttpSession session = req.getSession();
            UserDTO user = (UserDTO) session.getAttribute("currentUser");
            String role = user.getUserRole().trim();

            if (!role.equals(authPattern)) {//if user is unauthorized
                if (session.getAttribute("tempURL") == null) {
                    session.setAttribute("tempURL", req.getRequestURL()); //store url to go back to after user reauthorized
                }
                res.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Wrong role.");
                return;
            } else {//if user is authorized
                String tempURL = (String) session.getAttribute("tempURL"); //get stored url

                if (tempURL != null) {
                    session.setAttribute("tempURL", null);
                    req.getRequestDispatcher(tempURL).forward(request, response); //if user stored url then go to that url, else go default request url
                    return;
                }
            }
        }

        try {
            chain.doFilter(request, response);
        } catch (IOException | ServletException ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("AuthenticationFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthenticationFilter()");
        }
        StringBuffer sb = new StringBuffer("AuthenticationFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
