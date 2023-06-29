package org.apache.jsp.Common;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class client_002dappointment_002ddetails_002dnot_002dyet_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "common/head.jsp", out, false);
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <div class=\"main-wrapper\">\n");
      out.write("            <!-- Header -->\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/header.jsp", out, false);
      out.write("\n");
      out.write("            <!--/Header -->\n");
      out.write("\n");
      out.write("            <!-- Breadcrumb -->\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/breadcrumb.jsp", out, false);
      out.write("\n");
      out.write("            <!-- /Breadcrumb -->\n");
      out.write("\n");
      out.write("            <!-- Page Content -->\n");
      out.write("            <div class=\"content\">\n");
      out.write("                <div class=\"container-fluid\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <!-- Profile Sidebar -->\n");
      out.write("                        <div class=\"bird-general-info\">\n");
      out.write("                            <div class=\"avatar-image\">\n");
      out.write("                                <img src=\"assets/img/about-1.jpg\" class=\"bird-avatar\"/>\n");
      out.write("                                <h2><a href=\"bird-details.html\">Andy</a></h2>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"bird-information-boxes\">\n");
      out.write("                                <div class=\"bird-information-box\">\n");
      out.write("                                    <p class=\"header\">Bird's name</p>\n");
      out.write("                                    <p class=\"information\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${bird.birdFullname}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"bird-information-box\">\n");
      out.write("                                    <p class=\"header\">Hatching Day</p>\n");
      out.write("                                    <p class=\"information\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${bird.hatchingDate}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"bird-information-box\">\n");
      out.write("                                    <p class=\"header\">Breed</p>\n");
      out.write("                                    <p class=\"information\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${bird.breed}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"bird-information-box\">\n");
      out.write("                                    <p class=\"header\">Sex</p>\n");
      out.write("                                    <p class=\"information\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${bird.birdGender}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"bird-information-box\">\n");
      out.write("                                    <p class=\"header\">Weight</p>\n");
      out.write("                                    <p class=\"information\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${bird.birdWeight}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"bird-information-box\">\n");
      out.write("                                    <p class=\"header\">Microchip</p>\n");
      out.write("                                    <p class=\"information\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${bird.microchip}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"bird-information-box\">\n");
      out.write("                                    <p class=\"header\">Sex Method</p>\n");
      out.write("                                    <p class=\"information\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${bird.sexingMethod}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"bird-information-box\">\n");
      out.write("                                    <p class=\"header\">Feather Color</p>\n");
      out.write("                                    <p class=\"information\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${bird.featherColor}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <!-- /Profile Sidebar -->\n");
      out.write("\n");
      out.write("                        <div class=\"col-md-7 col-lg-8 col-xl-9\">\n");
      out.write("                            <div class=\"card\">\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <!-- Profile Settings Form -->\n");
      out.write("                                    <form>\n");
      out.write("                                        <div class=\"row form-row\">\n");
      out.write("                                            <div class=\"col-12 col-md-12\">\n");
      out.write("                                                <div class=\"form-group\">\n");
      out.write("                                                    <div class=\"change-avatar\">\n");
      out.write("                                                        <div class=\"profile-img\">\n");
      out.write("                                                            <img src=\"assets/img/patients/patient.jpg\" alt=\"User Image\" />\n");
      out.write("                                                        </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"col-12 col-md-6\">\n");
      out.write("                                                <div class=\"form-group\">\n");
      out.write("                                                    <label>First Name</label>\n");
      out.write("                                                    <div class=\"form-control\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${customer.firstName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"col-12 col-md-6\">\n");
      out.write("                                                <div class=\"form-group\">\n");
      out.write("                                                    <label>Last Name</label>\n");
      out.write("                                                    <div type=\"text\" class=\"form-control\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${customer.lastName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"col-12 col-md-6\">\n");
      out.write("                                                <div class=\"form-group\">\n");
      out.write("                                                    <label>Date of Birth</label>\n");
      out.write("                                                    <div class=\"cal-icon\">\n");
      out.write("                                                        <div class=\"form-control datetimepicker\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${customer.dob}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"col-12 col-md-6\">\n");
      out.write("                                                <div class=\"form-group\">\n");
      out.write("                                                    <label>Address</label>\n");
      out.write("                                                    <div class=\"form-control\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${customer.customerAddress}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"col-12 col-md-6\">\n");
      out.write("                                                <div class=\"form-group\">\n");
      out.write("                                                    <label>Email</label>\n");
      out.write("                                                    <div class=\"form-control\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${customer.email}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"col-12 col-md-6\">\n");
      out.write("                                                <div class=\"form-group\">\n");
      out.write("                                                    <label>Mobile</label>\n");
      out.write("                                                    <div class=\"form-control\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${customer.phoneNumber}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</div> \n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                    </form>\n");
      out.write("                                    <!-- /Profile Settings Form -->\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"prescription\">\n");
      out.write("                    <div class=\"col-md-12\">\n");
      out.write("                        <table class=\"table table-bordered\" >\n");
      out.write("                            <thead>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>Appointment Date</th>\n");
      out.write("                                    <th>Appointment Time</th>\n");
      out.write("                                    <th>Doctor</th>\n");
      out.write("                                    <th>Type of Service</th>\n");
      out.write("                                    <th>Bird's symptoms</th>\n");
      out.write("                                </tr>\n");
      out.write("                            </thead>\n");
      out.write("                            <tbody>\n");
      out.write("                                <tr >\n");
      out.write("                                    <td >");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${appoitment.date}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</td>\n");
      out.write("                                    <td >");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${appoitment.timeslot}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</td>\n");
      out.write("                                    <td >");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${appoitment.doctor}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</td>\n");
      out.write("                                    <td >");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${appoitment.service}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</td>\n");
      out.write("                                    <td >");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${appoitment.notes}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</td>\n");
      out.write("                                </tr>\n");
      out.write("                            </tbody>\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                    <button onclick=\"\" class=\"btn btn-dark d-flex justify-content-center mx-auto mt-2\">\n");
      out.write("                        <a href=\"add-prescription.html\" class=\"prescription-submit\"> <i class=\"fa fa-flask\"></i> Prescribe </a>\n");
      out.write("                    </button>\n");
      out.write("                </div>\n");
      out.write("                <!-- /Page Content -->\n");
      out.write("\n");
      out.write("                <!-- Footer -->\n");
      out.write("                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/footer.jsp", out, false);
      out.write("\n");
      out.write("                <!-- /Footer -->\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/script.jsp", out, false);
      out.write("\n");
      out.write("</body>\n");
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
