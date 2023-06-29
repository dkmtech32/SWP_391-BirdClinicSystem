package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class service_002ddetail_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("            <!-- Page Content -->\n");
      out.write("\n");
      out.write("            <section class=\"section section-specialities\" style=\"padding: 0;\">\n");
      out.write("                <div class=\"container py-5\">\n");
      out.write("                    <div class=\"row py-5\">\n");
      out.write("                        <div class=\"col-lg-7 pb-5 pb-lg-0 px-3 px-lg-5\">\n");
      out.write("                            <h4 class=\"text-secondary mb-3\">Service Detail</h4>\n");
      out.write("                            <h1 class=\"display-4 mb-4\"><span\n");
      out.write("                                    class=\"text-primary\">Bird Boarding</span>\n");
      out.write("                                <span class=\"text-secondary\">Service</span></h1>\n");
      out.write("                            <h5 class=\"text-muted mb-3\">\n");
      out.write("                                Take Flight with BirdLover: Where Birds Find a\n");
      out.write("                                Home Away from Home\n");
      out.write("                            </h5>\n");
      out.write("                            <p class=\"mb-4\">\n");
      out.write("                                Welcome to BirdLover: Where Feathers Find a\n");
      out.write("                                Home.\n");
      out.write("                            </p>\n");
      out.write("                            <p class=\"mb-4\">\n");
      out.write("                                Discover a premier Bird Boarding Service that\n");
      out.write("                                offers your avian companions a safe and\n");
      out.write("                                enriching retreat. Our state-of-the-art facility\n");
      out.write("                                provides spacious enclosures, stimulating\n");
      out.write("                                activities, and expert care to ensure their\n");
      out.write("                                happiness and well-being.\n");
      out.write("                            </p>\n");
      out.write("                            <p class=\"mb-4\">\n");
      out.write("\n");
      out.write("                                Experience the ultimate bird boarding experience\n");
      out.write("                                at BirdLover. Contact us now to secure a spot\n");
      out.write("                                for your feathered friends.\n");
      out.write("                            </p>\n");
      out.write("\n");
      out.write("                            <ul class=\"list-inline\">\n");
      out.write("                                <li>\n");
      out.write("                                    <h5><i\n");
      out.write("                                            class=\"fa fa-check-double text-secondary mr-3\"></i>Best\n");
      out.write("                                        In Industry</h5>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <h5><i\n");
      out.write("                                            class=\"fa fa-check-double text-secondary mr-3\"></i>Emergency\n");
      out.write("                                        Services</h5>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <h5><i\n");
      out.write("                                            class=\"fa fa-check-double text-secondary mr-3\"></i>24/7\n");
      out.write("                                        Customer Support</h5>\n");
      out.write("                                </li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-lg-5\">\n");
      out.write("                            <div class=\"row px-3\">\n");
      out.write("                                <div class=\"col-12 p-0\">\n");
      out.write("                                    <img class=\"img-fluid w-100 h-100\"\n");
      out.write("                                        src=\"https://images.unsplash.com/photo-1614685761174-e67b8d6badcf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80\"\n");
      out.write("                                        alt>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </section>\n");
      out.write("\n");
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
