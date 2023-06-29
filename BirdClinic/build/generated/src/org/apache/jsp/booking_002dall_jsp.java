package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class booking_002dall_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("                        <div class=\"col-12\">\n");
      out.write("                            <div class=\"card\">\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <div class=\"booking-doc-info\">\n");
      out.write("                                        <a href=\"doctor-profile.jsp\" class=\"booking-doc-img\">\n");
      out.write("                                            <img src=\"assets/img/logo2.png\" alt=\"User Image\" />\n");
      out.write("                                        </a>\n");
      out.write("                                        <div class=\"booking-info\">\n");
      out.write("                                            <h4><a href=\"doctor-profile.jsp\">All doctor</a></h4>\n");
      out.write("                                            <!-- <div class=\"rating\">\n");
      out.write("                                                    <i class=\"fas fa-star filled\"></i>\n");
      out.write("                                                    <i class=\"fas fa-star filled\"></i>\n");
      out.write("                                                    <i class=\"fas fa-star filled\"></i>\n");
      out.write("                                                    <i class=\"fas fa-star filled\"></i>\n");
      out.write("                                                    <i class=\"fas fa-star\"></i>\n");
      out.write("                                                    <span class=\"d-inline-block average-rating\">35</span>\n");
      out.write("                                            </div> -->\n");
      out.write("                                            <p class=\"text-muted mb-0\"><i class=\"fas fa-map-marker-alt\"></i> Dong Da district, Hanoi city</p>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <!-- Schedule Widget -->\n");
      out.write("                            <div class=\"card booking-schedule schedule-widget\">\n");
      out.write("                                <!-- Schedule Header -->\n");
      out.write("                                <div class=\"schedule-header\">\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col-md-12\">\n");
      out.write("                                            <!-- Day Slot -->\n");
      out.write("                                            <div class=\"day-slot\">\n");
      out.write("                                                <ul>\n");
      out.write("                                                    <li class=\"left-arrow\">\n");
      out.write("                                                        <a href=\"#\">\n");
      out.write("                                                            <i class=\"fa fa-chevron-left\"></i>\n");
      out.write("                                                        </a>\n");
      out.write("                                                    </li>\n");
      out.write("                                                    <li>\n");
      out.write("                                                        <span>Mon</span>\n");
      out.write("                                                        <span class=\"slot-date\">11 Jun <small class=\"slot-year\">2023</small></span>\n");
      out.write("                                                    </li>\n");
      out.write("                                                    <li>\n");
      out.write("                                                        <span>Tue</span>\n");
      out.write("                                                        <span class=\"slot-date\">12 Jun <small class=\"slot-year\">2023</small></span>\n");
      out.write("                                                    </li>\n");
      out.write("                                                    <li>\n");
      out.write("                                                        <span>Wed</span>\n");
      out.write("                                                        <span class=\"slot-date\">13 Jun <small class=\"slot-year\">2023</small></span>\n");
      out.write("                                                    </li>\n");
      out.write("                                                    <li>\n");
      out.write("                                                        <span>Thu</span>\n");
      out.write("                                                        <span class=\"slot-date\">14 Jun <small class=\"slot-year\">2023</small></span>\n");
      out.write("                                                    </li>\n");
      out.write("                                                    <li>\n");
      out.write("                                                        <span>Fri</span>\n");
      out.write("                                                        <span class=\"slot-date\">15 Jun <small class=\"slot-year\">2023</small></span>\n");
      out.write("                                                    </li>\n");
      out.write("                                                    <li>\n");
      out.write("                                                        <span>Sat</span>\n");
      out.write("                                                        <span class=\"slot-date\">16 Jun <small class=\"slot-year\">2023</small></span>\n");
      out.write("                                                    </li>\n");
      out.write("                                                    <li>\n");
      out.write("                                                        <span>Sun</span>\n");
      out.write("                                                        <span class=\"slot-date\">17 Jun <small class=\"slot-year\">2023</small></span>\n");
      out.write("                                                    </li>\n");
      out.write("                                                    <li class=\"right-arrow\">\n");
      out.write("                                                        <a href=\"#\">\n");
      out.write("                                                            <i class=\"fa fa-chevron-right\"></i>\n");
      out.write("                                                        </a>\n");
      out.write("                                                    </li>\n");
      out.write("                                                </ul>\n");
      out.write("                                            </div>\n");
      out.write("                                            <!-- /Day Slot -->\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <!-- /Schedule Header -->\n");
      out.write("\n");
      out.write("                                <!-- Schedule Content -->\n");
      out.write("                                <div class=\"schedule-cont\">\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col-md-12\">\n");
      out.write("                                            <!-- Time Slot -->\n");
      out.write("                                            <div class=\"time-slot\">\n");
      out.write("                                                <ul class=\"clearfix\">\n");
      out.write("                                                    <li>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>9:00</span> <span>AM</span> </a>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>10:00</span> <span>AM</span> </a>\n");
      out.write("                                                    </li>\n");
      out.write("                                                    <li>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>9:00</span> <span>AM</span> </a>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>10:00</span> <span>AM</span> </a>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>11:00</span> <span>AM</span> </a>\n");
      out.write("                                                    </li>\n");
      out.write("                                                    <li>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>9:00</span> <span>AM</span> </a>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>10:00</span> <span>AM</span> </a>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>11:00</span> <span>AM</span> </a>\n");
      out.write("                                                    </li>\n");
      out.write("                                                    <li>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>9:00</span> <span>AM</span> </a>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>10:00</span> <span>AM</span> </a>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>11:00</span> <span>AM</span> </a>\n");
      out.write("                                                    </li>\n");
      out.write("                                                    <li>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>9:00</span> <span>AM</span> </a>\n");
      out.write("                                                        <a class=\"timing selected\" href=\"#\"> <span>10:00</span> <span>AM</span> </a>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>11:00</span> <span>AM</span> </a>\n");
      out.write("                                                    </li>\n");
      out.write("                                                    <li>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>9:00</span> <span>AM</span> </a>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>10:00</span> <span>AM</span> </a>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>11:00</span> <span>AM</span> </a>\n");
      out.write("                                                    </li>\n");
      out.write("                                                    <li>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>9:00</span> <span>AM</span> </a>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>10:00</span> <span>AM</span> </a>\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>11:00</span> <span>AM</span> </a>\n");
      out.write("                                                    </li>\n");
      out.write("                                                </ul>\n");
      out.write("                                            </div>\n");
      out.write("                                            <!-- /Time Slot -->\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <!-- /Schedule Content -->\n");
      out.write("                            </div>\n");
      out.write("                            <!-- /Schedule Widget -->\n");
      out.write("\n");
      out.write("                            <!-- Submit Section -->\n");
      out.write("                            <div class=\"submit-section proceed-btn text-right\">\n");
      out.write("                                <a href=\"bookInfo-all.jsp\" class=\"btn btn-primary submit-btn\">Next</a>\n");
      out.write("                            </div>\n");
      out.write("                            <!-- /Submit Section -->\n");
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
