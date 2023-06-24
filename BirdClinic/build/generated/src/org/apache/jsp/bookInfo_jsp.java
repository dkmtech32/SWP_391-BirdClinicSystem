package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class bookInfo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Common/head.jsp", out, false);
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <!-- Main Wrapper -->\n");
      out.write("        <div class=\"main-wrapper\">\n");
      out.write("            <!-- Header -->\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Common/header-guest.jsp", out, false);
      out.write("\n");
      out.write("            <!--/Header -->\n");
      out.write("\n");
      out.write("            <!-- Breadcrumb -->\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Common/breadcrumb.jsp", out, false);
      out.write("\n");
      out.write("            <!-- /Breadcrumb -->\n");
      out.write("\n");
      out.write("            <!-- Page Content -->\n");
      out.write("            <div class=\"content\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-7 col-lg-8\">\n");
      out.write("                            <div class=\"card\">\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <!-- Checkout Form -->\n");
      out.write("                                    <form action=\"booking-success.jsp\">\n");
      out.write("                                        <!-- Personal Information -->\n");
      out.write("                                        <div class=\"info-widget\">\n");
      out.write("                                            <h4 class=\"card-title\">Personal Information</h4>\n");
      out.write("                                            <div class=\"row\">\n");
      out.write("                                                <div class=\"col-md-6 col-sm-12\">\n");
      out.write("                                                    <div class=\"form-group card-label\">\n");
      out.write("                                                        <label>Full Name</label>\n");
      out.write("                                                        <input class=\"form-control\" type=\"text\" value=\"Nguyen Van G\" />\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\t\t\t\t\t\t\t\t\t\t\t\t\n");
      out.write("                                                <div class=\"col-md-6 col-sm-12\">\n");
      out.write("                                                    <div class=\"form-group card-label\">\n");
      out.write("                                                        <label>Email</label>\n");
      out.write("                                                        <input class=\"form-control\" type=\"email\" value=\"test@gmail.com\" />\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-md-6 col-sm-12\">\n");
      out.write("                                                    <div class=\"form-group card-label\">\n");
      out.write("                                                        <label>Phone</label>\n");
      out.write("                                                        <input class=\"form-control\" type=\"text\" value=\"0999999000\"/>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-md-6 col-sm-12\">\n");
      out.write("                                                    <div class=\"form-group card-label\">\n");
      out.write("                                                        <label>Gender</label>\n");
      out.write("                                                        <select class=\"form-control\">\n");
      out.write("                                                            <option value=\"Male\">Male</option>\n");
      out.write("                                                            <option value=\"Female\">Female</option>\n");
      out.write("                                                            <option value=\"Other\">Other</option>\n");
      out.write("                                                        </select>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <!-- <div class=\"exist-customer\">Existing Customer? <a href=\"#\">Click here to login</a></div> -->\n");
      out.write("                                        </div>\n");
      out.write("                                        <!-- /Personal Information -->\n");
      out.write("                                        <!-- Bird info -->\n");
      out.write("                                        <div class=\"info-widget\">\n");
      out.write("                                            <h4 class=\"card-title\">Bird Information</h4>\n");
      out.write("                                            <div class=\"row\">\n");
      out.write("                                                <!-- <div class=\"col-md-6 col-sm-12\">\n");
      out.write("                                                        <div class=\"form-group card-label\">\n");
      out.write("                                                                <label>Name</label>\n");
      out.write("                                                                <input class=\"form-control\" type=\"text\" value=\"Chó\" />\n");
      out.write("                                                        </div>\n");
      out.write("                                                </div>\t\t\t\t\t\t\t\t\t\t\t\t\n");
      out.write("                                                <div class=\"col-md-6 col-sm-12\">\n");
      out.write("                                                        <div class=\"form-group card-label\">\n");
      out.write("                                                                <label>Breed</label>\n");
      out.write("                                                                <input class=\"form-control\" type=\"text\" value=\"Parrot\" />\n");
      out.write("                                                        </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-md-6 col-sm-12\">\n");
      out.write("                                                        <div class=\"form-group card-label\">\n");
      out.write("                                                                <label>Date of Birth</label>\n");
      out.write("                                                                <input class=\"form-control\" type=\"date\" value=\"2022-12-15\" name=\"dob\"/>\n");
      out.write("                                                        </div>\n");
      out.write("                                                </div> -->\n");
      out.write("                                                <!-- <div class=\"col-md-6 col-sm-12\">\n");
      out.write("                                                        <div class=\"form-group card-label\">\n");
      out.write("                                                                <label>Gender</label>\n");
      out.write("                                                                <select class=\"form-control\">\n");
      out.write("                                                                        <option value=\"Male\">Male</option>\n");
      out.write("                                                                        <option value=\"Female\">Female</option>\n");
      out.write("                                                                        <option value=\"Other\">Other</option>\n");
      out.write("                                                                </select>\n");
      out.write("                                                        </div>\n");
      out.write("                                                </div> -->\n");
      out.write("                                                <div class=\"col-md-12 col-sm-12\">\n");
      out.write("                                                    <div class=\"form-group card-label\">\n");
      out.write("                                                        <label>Choose your bird</label>\n");
      out.write("                                                        <select class=\"form-control\">\n");
      out.write("                                                            <option value=\"dog\">Chó</option>\n");
      out.write("                                                            <option value=\"cat\">Mèo</option>\n");
      out.write("                                                            <option value=\"bird\">Chim</option>\n");
      out.write("                                                        </select>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <!-- <div class=\"exist-customer\">Existing Customer? <a href=\"#\">Click here to login</a></div> -->\n");
      out.write("                                        </div>\n");
      out.write("                                        <!-- /Bird info -->\n");
      out.write("                                        <!-- Notes section -->\n");
      out.write("                                        <div class=\"info-widget\">\n");
      out.write("                                            <h4 class=\"card-title\">Notes</h4>\n");
      out.write("                                            <div class=\"col-md-12 col-sm-12\">\n");
      out.write("                                                <div class=\"form-group card-label\">\n");
      out.write("                                                    <label>Choose specialty</label>\n");
      out.write("                                                    <select class=\"form-control\" required >\n");
      out.write("                                                        <option value=\"\">--</option>\n");
      out.write("                                                        <option value=\"general\">General</option>\n");
      out.write("                                                        <option value=\"surgery\">Surgery</option>\n");
      out.write("                                                        <option value=\"imaging\">Imaging</option>\n");
      out.write("                                                        <option value=\"nutrition\">Nutrition</option>\n");
      out.write("                                                        <option value=\"genetics\">Genetics</option>\n");
      out.write("                                                    </select>\n");
      out.write("                                                    <div class=\"invalid-feedback\">Example invalid custom select feedback</div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"col-md-12 col-sm-12\">\n");
      out.write("                                                <div class=\"form-group\">\t\t\t\t\t\t\t\t\t\t\t\t\t\n");
      out.write("                                                    <textarea class=\"form-control\" rows=\"4\" placeholder=\"Describe bird's symtoms\" ></textarea>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                        <!-- /Notes section -->\n");
      out.write("                                        <!-- Submit Section -->\n");
      out.write("                                        <div class=\"submit-section mt-4\">\n");
      out.write("                                            <button type=\"submit\" class=\"btn btn-primary submit-btn\">Confirm and submit</button>\n");
      out.write("                                        </div>\n");
      out.write("                                        <!-- /Submit Section -->\n");
      out.write("                                    </form>\n");
      out.write("                                    <!-- /Checkout Form -->\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"col-md-5 col-lg-4 theiaStickySidebar\">\n");
      out.write("                            <!-- Booking Summary -->\n");
      out.write("                            <div class=\"card booking-card\">\n");
      out.write("                                <div class=\"card-header\">\n");
      out.write("                                    <h4 class=\"card-title\">Booking Summary</h4>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <!-- Booking Doctor Info -->\n");
      out.write("                                    <div class=\"booking-doc-info\">\n");
      out.write("                                        <a href=\"doctor-profile.jsp\" class=\"booking-doc-img\">\n");
      out.write("                                            <img src=\"assets/img/logo.png\" alt=\"User Image\" />\n");
      out.write("                                        </a>\n");
      out.write("                                        <div class=\"booking-info\">\n");
      out.write("                                            <h4><a href=\"doctor-profile.jsp\">BirdLover Clinic</a></h4>\n");
      out.write("                                            <!-- <div class=\"rating\">\n");
      out.write("                                                    <i class=\"fas fa-star filled\"></i>\n");
      out.write("                                                    <i class=\"fas fa-star filled\"></i>\n");
      out.write("                                                    <i class=\"fas fa-star filled\"></i>\n");
      out.write("                                                    <i class=\"fas fa-star filled\"></i>\n");
      out.write("                                                    <i class=\"fas fa-star\"></i>\n");
      out.write("                                                    <span class=\"d-inline-block average-rating\">35</span>\n");
      out.write("                                            </div> -->\n");
      out.write("                                            <div class=\"clinic-details\">\n");
      out.write("                                                <p class=\"doc-location\"><i class=\"fas fa-map-marker-alt\"></i> Long Bien, Hanoi</p>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <!-- Booking Doctor Info -->\n");
      out.write("\n");
      out.write("                                    <div class=\"booking-summary\">\n");
      out.write("                                        <div class=\"booking-item-wrap\">\n");
      out.write("                                            <ul class=\"booking-date\">\n");
      out.write("                                                <li>Date <span>16 Jun 2023</span></li>\n");
      out.write("                                                <li>Time <span>10:00 AM</span></li>\n");
      out.write("                                            </ul>\n");
      out.write("                                            <ul class=\"booking-fee\">\n");
      out.write("                                                <!-- <li>Consulting Fee <span>$100</span></li> -->\n");
      out.write("                                                <li>Booking Fee <span>$10</span></li>\n");
      out.write("                                                <!-- <li>Video Call <span>$50</span></li> -->\n");
      out.write("                                            </ul>\n");
      out.write("                                            <!-- <div class=\"booking-total\">\n");
      out.write("                                                    <ul class=\"booking-total-list\">\n");
      out.write("                                                            <li>\n");
      out.write("                                                                    <span>Total</span>\n");
      out.write("                                                                    <span class=\"total-cost\">$160</span>\n");
      out.write("                                                            </li>\n");
      out.write("                                                    </ul>\n");
      out.write("                                            </div> -->\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <!-- /Booking Summary -->\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <!-- /Page Content -->\n");
      out.write("\n");
      out.write("            <!-- Footer -->\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Common/footer.jsp", out, false);
      out.write("\n");
      out.write("            <!-- /Footer -->\n");
      out.write("        </div>\n");
      out.write("        <!-- /Main Wrapper -->\n");
      out.write("\n");
      out.write("        <!-- Script -->\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Common/script.jsp", out, false);
      out.write("\n");
      out.write("        <!-- /Script -->\n");
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