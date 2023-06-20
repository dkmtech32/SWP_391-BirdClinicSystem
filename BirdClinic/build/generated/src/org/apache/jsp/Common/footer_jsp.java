package org.apache.jsp.Common;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class footer_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <footer class=\"footer\">\n");
      out.write("\t\t\t\t<!-- Footer Top -->\n");
      out.write("\t\t\t\t<div class=\"footer-top\">\n");
      out.write("\t\t\t\t\t<div class=\"container-fluid\">\n");
      out.write("\t\t\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"col-lg-3 col-md-6\">\n");
      out.write("\t\t\t\t\t\t\t\t<!-- Footer Widget -->\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"footer-widget footer-about\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"footer-logo\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<img src=\"../assets/img/logo.png\" alt=\"logo\" />\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"footer-about-content\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"social-icon\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<a href=\"#\" target=\"_blank\"><i class=\"fab fa-facebook-f\"></i> </a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<a href=\"#\" target=\"_blank\"><i class=\"fab fa-twitter\"></i> </a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<a href=\"#\" target=\"_blank\"><i class=\"fab fa-linkedin-in\"></i></a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<a href=\"#\" target=\"_blank\"><i class=\"fab fa-instagram\"></i></a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<a href=\"#\" target=\"_blank\"><i class=\"fab fa-dribbble\"></i> </a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t<!-- /Footer Widget -->\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t<div class=\"col-lg-3 col-md-6\">\n");
      out.write("\t\t\t\t\t\t\t\t<!-- Footer Widget -->\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"footer-widget footer-menu\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<h2 class=\"footer-title\">For Patients</h2>\n");
      out.write("\t\t\t\t\t\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"search.html\"><i class=\"fas fa-angle-double-right\"></i> Search for Doctors</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"login.html\"><i class=\"fas fa-angle-double-right\"></i> Login</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"register.html\"><i class=\"fas fa-angle-double-right\"></i> Register</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"booking.html\"><i class=\"fas fa-angle-double-right\"></i> Booking</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"patient-dashboard.html\"><i class=\"fas fa-angle-double-right\"></i> Patient Dashboard</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t<!-- /Footer Widget -->\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t<div class=\"col-lg-3 col-md-6\">\n");
      out.write("\t\t\t\t\t\t\t\t<!-- Footer Widget -->\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"footer-widget footer-menu\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<h2 class=\"footer-title\">For Doctors</h2>\n");
      out.write("\t\t\t\t\t\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"appointments.html\"><i class=\"fas fa-angle-double-right\"></i> Appointments</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"chat.html\"><i class=\"fas fa-angle-double-right\"></i> Chat</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"login.html\"><i class=\"fas fa-angle-double-right\"></i> Login</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"doctor-register.html\"><i class=\"fas fa-angle-double-right\"></i> Register</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"doctor-dashboard.html\"><i class=\"fas fa-angle-double-right\"></i> Doctor Dashboard</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t<!-- /Footer Widget -->\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t<div class=\"col-lg-3 col-md-6\">\n");
      out.write("\t\t\t\t\t\t\t\t<!-- Footer Widget -->\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"footer-widget footer-contact\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<h2 class=\"footer-title\">Contact Us</h2>\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"footer-contact-info\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"footer-address\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<span><i class=\"fas fa-map-marker-alt\"></i></span>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<p>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t3556 Beech Street, San Francisco,<br />\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tCalifornia, CA 94108\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</p>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<p>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<i class=\"fas fa-phone-alt\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t+1 315 369 5943\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</p>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<p class=\"mb-0\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<i class=\"fas fa-envelope\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tdoccure@example.com\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</p>\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t<!-- /Footer Widget -->\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<!-- /Footer Top -->\n");
      out.write("\n");
      out.write("\t\t\t\t<!-- Footer Bottom -->\n");
      out.write("\t\t\t\t<div class=\"footer-bottom\">\n");
      out.write("\t\t\t\t\t<div class=\"container-fluid\">\n");
      out.write("\t\t\t\t\t\t<!-- Copyright -->\n");
      out.write("\t\t\t\t\t\t<div class=\"copyright\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"col-md-6 col-lg-6\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"copyright-text\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<p class=\"mb-0\"><a href=\"templateshub.net\">Templates Hub</a></p>\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"col-md-6 col-lg-6\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<!-- Copyright Menu -->\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"copyright-menu\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<ul class=\"policy-menu\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<li><a href=\"term-condition.html\">Terms and Conditions</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<li><a href=\"privacy-policy.html\">Policy</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t<!-- /Copyright Menu -->\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<!-- /Copyright -->\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<!-- /Footer Bottom -->\n");
      out.write("\t\t\t</footer>\n");
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
