package org.apache.jsp;

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
      out.write(" \n");
      out.write("    <div class=\"assign-pet-container\">\n");
      out.write("\t\t  <div class=\"assign-pet\">\n");
      out.write("        <h2>Assign your bird</h2>\n");
      out.write("        <div class=\"input-boxes\">\n");
      out.write("          <div class=\"input-box\">\n");
      out.write("            <p>Bird's name*</p>\n");
      out.write("            <input type=\"text\" placeholder=\"Bird's name\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"input-box\">\n");
      out.write("            <p>Hatching Day</p>\n");
      out.write("            <input type=\"date\" placeholder=\"Hatching Day\"/>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"input-box\">\n");
      out.write("            <p>Breed (e.g sparow, cuckoo, etc)*</p>\n");
      out.write("            <input\n");
      out.write("                type=\"text\"\n");
      out.write("                placeholder=\"Breed (e.g sparow, cuckoo, etc)*\"\n");
      out.write("              />\n");
      out.write("            </div>\n");
      out.write("          <div class=\"input-box\">\n");
      out.write("            <p>Sex</p>\n");
      out.write("            <select selected=\"selected\">\n");
      out.write("              <option>Male</option>\n");
      out.write("\t\t\t\t\t\t\t<option>Female</option>\n");
      out.write("            </select>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"input-box\">\n");
      out.write("            <p>Weight</p>\n");
      out.write("            <input type=\"text\" placeholder=\"Weight\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"input-box\">\n");
      out.write("            <p>Microchip</p>\n");
      out.write("            <select selected=\"selected\">\n");
      out.write("              <option>Yes</option>\n");
      out.write("\t\t\t\t\t\t\t<option>No</option>\n");
      out.write("            </select>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"upload-photo-box\">\n");
      out.write("            <div class=\"upload-box\">\n");
      out.write("              <i class=\"fa fa-cloud-upload-alt\"></i>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"upload-content\">\n");
      out.write("              <button onclick=\"defaultBtnActive()\" id=\"custom-btn\">\n");
      out.write("                <span><i class=\"fa fa-upload\"></i>   Upload Photo</span>\n");
      out.write("                <input id=\"default-btn\" type=\"file\" class=\"upload\" hidden>\n");
      out.write("              </button>\n");
      out.write("              <small class=\"form-text text-muted\">Allowed JPG, GIF or PNG. Max size of 2MB</small>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("        </div>\n");
      out.write("\t\t    <button class=\"submit\">Submit</button>\n");
      out.write("\t\t  </div>\n");
      out.write("    </div>\n");
      out.write("    <script>\n");
      out.write("      const defaultBtn = document.querySelector(\"#default-btn\");\n");
      out.write("      const customBtn = document.querySelector(\"#custom-btn\");\n");
      out.write("      function defaultBtnActive(){\n");
      out.write("        defaultBtn.click();\n");
      out.write("      }\n");
      out.write("    </script>\n");
      out.write("      \n");
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
