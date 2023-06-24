package org.apache.jsp.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class assignBird_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Common/head.jsp", out, false);
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        <!-- Main Wrapper -->\r\n");
      out.write("        <div class=\"main-wrapper\">\r\n");
      out.write("            <!-- Header -->\r\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Common/header-guest.jsp", out, false);
      out.write("\r\n");
      out.write("            <!--/Header -->\r\n");
      out.write("\r\n");
      out.write("            <!-- Breadcrumb -->\r\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Common/breadcrumb.jsp", out, false);
      out.write("\r\n");
      out.write("            <!-- /Breadcrumb -->\r\n");
      out.write("\r\n");
      out.write("            <!-- Page Content -->\r\n");
      out.write("\r\n");
      out.write("            <div class=\"content\">\r\n");
      out.write("                <div class=\"container-fluid\">\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <!-- Profile Sidebar -->\r\n");
      out.write("                        <div class=\"col-md-5 col-lg-4 col-xl-3 theiaStickySidebar\">\r\n");
      out.write("                            <div class=\"profile-sidebar\">\r\n");
      out.write("                                <div class=\"widget-profile pro-widget-content\">\r\n");
      out.write("                                    <div class=\"profile-info-widget\">\r\n");
      out.write("                                        <a href=\"#\" class=\"booking-doc-img\">\r\n");
      out.write("                                            <img src=\"../assets/img/patients/patient.jpg\" alt=\"User Image\" />\r\n");
      out.write("                                        </a>\r\n");
      out.write("                                        <div class=\"profile-det-info\">\r\n");
      out.write("                                            <h3>Richard Wilson</h3>\r\n");
      out.write("                                            <div class=\"patient-details\">\r\n");
      out.write("                                                <h5><i class=\"fas fa-birthday-cake\"></i> 24 Jul 1983, 38 years</h5>\r\n");
      out.write("                                                <h5 class=\"mb-0\"><i class=\"fas fa-map-marker-alt\"></i> Newyork, USA</h5>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"dashboard-widget\">\r\n");
      out.write("                                    <nav class=\"dashboard-menu\">\r\n");
      out.write("                                        <ul>\r\n");
      out.write("                                            <li>\r\n");
      out.write("                                                <a href=\"#\">\r\n");
      out.write("                                                    <i class=\"fas fa-columns\"></i>\r\n");
      out.write("                                                    <span>Dashboard</span>\r\n");
      out.write("                                                </a>\r\n");
      out.write("                                            </li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                            <li class=\"active\">\r\n");
      out.write("                                                <a href=\"profile-settings.html\">\r\n");
      out.write("                                                    <i class=\"fas fa-user-cog\"></i>\r\n");
      out.write("                                                    <span>Profile Settings</span>\r\n");
      out.write("                                                </a>\r\n");
      out.write("                                            </li>\r\n");
      out.write("\r\n");
      out.write("                                            <li>\r\n");
      out.write("                                                <a href=\"birdlist.jsp\">\r\n");
      out.write("                                                    <i class=\"fa fa-tasks\"></i>\r\n");
      out.write("                                                    <span>Birds List</span>\r\n");
      out.write("                                                </a>\r\n");
      out.write("                                            </li>\r\n");
      out.write("\r\n");
      out.write("                                            <li>\r\n");
      out.write("                                                <a href=\"change-password.html\">\r\n");
      out.write("                                                    <i class=\"fas fa-lock\"></i>\r\n");
      out.write("                                                    <span>Change Password</span>\r\n");
      out.write("                                                </a>\r\n");
      out.write("                                            </li>\r\n");
      out.write("\r\n");
      out.write("                                            <li>\r\n");
      out.write("                                                <a href=\"index.html\">\r\n");
      out.write("                                                    <i class=\"fas fa-sign-out-alt\"></i>\r\n");
      out.write("                                                    <span>Logout</span>\r\n");
      out.write("                                                </a>\r\n");
      out.write("                                            </li>\r\n");
      out.write("                                        </ul>\r\n");
      out.write("                                    </nav>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <!-- /Profile Sidebar -->\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"col-md-7 col-lg-8 col-xl-9\">\r\n");
      out.write("                            <div class=\"card\">\r\n");
      out.write("                                <div class=\"card-body\">\r\n");
      out.write("                                    <!-- Profile Settings Form -->\r\n");
      out.write("                                    <form>\r\n");
      out.write("                                        <div class=\"row form-row\">\r\n");
      out.write("                                            <div class=\"col-12 col-md-12\">\r\n");
      out.write("                                                <div class=\"form-group\">\r\n");
      out.write("                                                    <div class=\"change-avatar\">\r\n");
      out.write("                                                        <div class=\"profile-img\">\r\n");
      out.write("                                                            <img src=\"../assets/img/bird/bird-1.webp\" alt=\"Bird Image\" />\r\n");
      out.write("                                                        </div>\r\n");
      out.write("                                                        <div class=\"upload-img\">\r\n");
      out.write("                                                            <div class=\"change-photo-btn\">\r\n");
      out.write("                                                                <span><i class=\"fa fa-upload\"></i> Upload Photo</span>\r\n");
      out.write("                                                                <input type=\"file\" class=\"upload\" />\r\n");
      out.write("                                                            </div>\r\n");
      out.write("                                                            <small class=\"form-text text-muted\">Allowed JPG, GIF or PNG. Max size of 2MB</small>\r\n");
      out.write("                                                        </div>\r\n");
      out.write("                                                    </div>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <div class=\"col-12 col-md-6\">\r\n");
      out.write("                                                <div class=\"form-group\">\r\n");
      out.write("                                                    <label>Bird's Name</label>\r\n");
      out.write("                                                    <input type=\"text\" class=\"form-control\" value=\"Chó\" required />\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("\r\n");
      out.write("                                            <div class=\"col-12 col-md-6\">\r\n");
      out.write("                                                <div class=\"form-group\">\r\n");
      out.write("                                                    <label>Hatching Date</label>\r\n");
      out.write("                                                    <div class=\"cal-icon\">\r\n");
      out.write("                                                        <input type=\"text\" class=\"form-control datetimepicker\" value=\"24-07-2022\" required/>\r\n");
      out.write("                                                    </div>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            \r\n");
      out.write("                                            <div class=\"col-12 col-md-6\">\r\n");
      out.write("                                                <div class=\"form-group\">\r\n");
      out.write("                                                    <label>Breed</label>\r\n");
      out.write("                                                    <input type=\"text\" class=\"form-control\" value=\"Sparrow\" required/>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            \r\n");
      out.write("                                            <div class=\"col-12 col-md-6\">\r\n");
      out.write("                                                <div class=\"form-group\">\r\n");
      out.write("                                                    <label>Sex</label>\r\n");
      out.write("                                                    <select class=\"form-control\" required>\r\n");
      out.write("                                                        <option>Male</option>\r\n");
      out.write("                                                        <option>Female</option>\r\n");
      out.write("                                                    </select>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            \r\n");
      out.write("                                            <div class=\"col-12 col-md-6\">\r\n");
      out.write("                                                <div class=\"form-group\">\r\n");
      out.write("                                                    <label>Weight (in grams)</label>\r\n");
      out.write("                                                    <input type=\"number\" class=\"form-control\" name=\"weight\" placeholder=\"Enter weight in grams\" step=\"0.1\" value=\"35\" required />\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            \r\n");
      out.write("                                            <div class=\"col-12 col-md-6\">\r\n");
      out.write("                                                <div class=\"form-group\">\r\n");
      out.write("                                                    <label>Microchip</label>\r\n");
      out.write("                                                    <select class=\"form-control\" required>\r\n");
      out.write("                                                        <option>Yes</option>\r\n");
      out.write("                                                        <option>No</option>\r\n");
      out.write("                                                    </select>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            \r\n");
      out.write("                                            <div class=\"col-12 col-md-6\">\r\n");
      out.write("                                                <div class=\"form-group\">\r\n");
      out.write("                                                    <label>Band ID</label>\r\n");
      out.write("                                                    <input type=\"text\" class=\"form-control\" value=\"emdeplam123\" required/>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            \r\n");
      out.write("                                        <div class=\"submit-section\">\r\n");
      out.write("                                            <button type=\"submit\" class=\"btn btn-primary submit-btn\">Save Changes</button>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </form>\r\n");
      out.write("                                    <!-- /Profile Settings Form -->\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("       \r\n");
      out.write("        \r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- /Page Content -->\r\n");
      out.write("\r\n");
      out.write("<!-- Footer -->\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Common/footer.jsp", out, false);
      out.write("\r\n");
      out.write("<!-- /Footer -->\r\n");
      out.write("</div>\r\n");
      out.write("<!-- /Main Wrapper -->\r\n");
      out.write("\r\n");
      out.write("<!-- Script -->\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Common/script.jsp", out, false);
      out.write("\r\n");
      out.write("<!-- /Script -->\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
