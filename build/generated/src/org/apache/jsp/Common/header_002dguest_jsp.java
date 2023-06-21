package org.apache.jsp.Common;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_002dguest_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "head.jsp", out, false);
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <header class=\"header\">\n");
      out.write("\t\t\t\t<nav class=\"navbar navbar-expand-lg header-nav\">\n");
      out.write("\t\t\t\t\t<div class=\"navbar-header\">\n");
      out.write("\t\t\t\t\t\t<a id=\"mobile_btn\" href=\"javascript:void(0);\">\n");
      out.write("\t\t\t\t\t\t\t<span class=\"bar-icon\">\n");
      out.write("\t\t\t\t\t\t\t\t<span></span>\n");
      out.write("\t\t\t\t\t\t\t\t<span></span>\n");
      out.write("\t\t\t\t\t\t\t\t<span></span>\n");
      out.write("\t\t\t\t\t\t\t</span>\n");
      out.write("\t\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t\t\t<a href=\"index.html\" class=\"navbar-brand logo\">\n");
      out.write("\t\t\t\t\t\t\t<img src=\"../assets/img/logo.png\" class=\"img-fluid\" alt=\"Logo\" />\n");
      out.write("\t\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"main-menu-wrapper\">\n");
      out.write("\t\t\t\t\t\t<div class=\"menu-header\">\n");
      out.write("\t\t\t\t\t\t\t<a href=\"index.html\" class=\"menu-logo\">\n");
      out.write("\t\t\t\t\t\t\t\t<img src=\"assets/img/logo.png\" class=\"img-fluid\" alt=\"Logo\" />\n");
      out.write("\t\t\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t\t\t\t<a id=\"menu_close\" class=\"menu-close\" href=\"javascript:void(0);\">\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"fas fa-times\"></i>\n");
      out.write("\t\t\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<ul class=\"main-nav\">\n");
      out.write("\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"index.html\">Home</a>\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t<li class=\"has-submenu\">\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#\">Doctors <i class=\"fas fa-chevron-down\"></i></a>\n");
      out.write("\t\t\t\t\t\t\t\t<ul class=\"submenu\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"doctor-dashboard.html\">Doctor Dashboard</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"appointments.html\">Appointments</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"schedule-timings.html\">Schedule Timing</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"my-patients.html\">Patients List</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"patient-profile.html\">Patients Profile</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"chat-doctor.html\">Chat</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"invoices.html\">Invoices</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"doctor-profile-settings.html\">Profile Settings</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"reviews.html\">Reviews</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"doctor-register.html\">Doctor Register</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t<li class=\"has-submenu active\">\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#\">Patients <i class=\"fas fa-chevron-down\"></i></a>\n");
      out.write("\t\t\t\t\t\t\t\t<ul class=\"submenu\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"search.html\">Search Doctor</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"active\"><a href=\"doctor-profile.html\">Doctor Profile</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"booking.html\">Booking</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"checkout.html\">Checkout</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"booking-success.html\">Booking Success</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"patient-dashboard.html\">Patient Dashboard</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"favourites.html\">Favourites</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"chat.html\">Chat</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"profile-settings.html\">Profile Settings</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"change-password.html\">Change Password</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t<li class=\"has-submenu\">\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#\">Pages <i class=\"fas fa-chevron-down\"></i></a>\n");
      out.write("\t\t\t\t\t\t\t\t<ul class=\"submenu\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"voice-call.html\">Voice Call</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"video-call.html\">Video Call</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"search.html\">Search Doctors</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"calendar.html\">Calendar</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"components.html\">Components</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"has-submenu\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a href=\"invoices.html\">Invoices</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<ul class=\"submenu\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<li><a href=\"invoices.html\">Invoices</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<li><a href=\"invoice-view.html\">Invoice View</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"blank-page.html\">Starter Page</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"login.html\">Login</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"register.html\">Register</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"forgot-password.html\">Forgot Password</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"admin/index.html\" target=\"_blank\">Admin</a>\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t<li class=\"login-link\">\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"login.html\">Login / Signup</a>\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<ul class=\"nav header-navbar-rht\">\n");
      out.write("\t\t\t\t\t\t<li class=\"nav-item contact-item\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"header-contact-img\">\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"far fa-hospital\"></i>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"header-contact-detail\">\n");
      out.write("\t\t\t\t\t\t\t\t<p class=\"contact-header\">Contact</p>\n");
      out.write("\t\t\t\t\t\t\t\t<p class=\"contact-info-header\">+1 315 369 5943</p>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t<li class=\"nav-item\">\n");
      out.write("\t\t\t\t\t\t\t<a class=\"nav-link header-login\" href=\"login.html\">login / Signup </a>\n");
      out.write("\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t</nav>\n");
      out.write("\t\t\t</header>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
