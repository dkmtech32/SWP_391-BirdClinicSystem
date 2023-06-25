package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/head.jsp", out, false);
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <!-- Main Wrapper -->\n");
      out.write("        <div class=\"main-wrapper\">\n");
      out.write("            <!-- Header -->\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/header-guest.jsp", out, false);
      out.write("\n");
      out.write("            <!--/Header -->\n");
      out.write("            \n");
      out.write("            <!-- Page Content -->\n");
      out.write("            <div class=\"content\">\n");
      out.write("                <div class=\"container-fluid\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-8 offset-md-2\">\n");
      out.write("                            <!-- Login Tab Content -->\n");
      out.write("                            <div class=\"account-content\">\n");
      out.write("                                <div class=\"row align-items-center justify-content-center\">\n");
      out.write("                                    <div class=\"col-md-7 col-lg-6 login-left\">\n");
      out.write("                                        <img src=\"assets/img/login-banner.png\" class=\"img-fluid\" alt=\"Doccure Login\" />\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-md-12 col-lg-6 login-right\">\n");
      out.write("                                        <div class=\"login-header\">\n");
      out.write("                                            <h3>Login <span>Birdlover</span></h3>\n");
      out.write("                                        </div>\n");
      out.write("                                        <form action=\"https://dreamguys.co.in/demo/doccure/index.html\">\n");
      out.write("                                            <div class=\"form-group form-focus\">\n");
      out.write("                                                <input type=\"email\" class=\"form-control floating\" />\n");
      out.write("                                                <label class=\"focus-label\">Email</label>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group form-focus\">\n");
      out.write("                                                <input type=\"password\" class=\"form-control floating\" />\n");
      out.write("                                                <label class=\"focus-label\">Password</label>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"text-right\">\n");
      out.write("                                                <a class=\"forgot-link\" href=\"forgot-password.html\">Forgot Password ?</a>\n");
      out.write("                                            </div>\n");
      out.write("                                            <button class=\"btn btn-primary btn-block btn-lg login-btn\" type=\"submit\">Login</button>\n");
      out.write("                                            <div class=\"login-or\">\n");
      out.write("                                                <span class=\"or-line\"></span>\n");
      out.write("                                                <span class=\"span-or\">or</span>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"row form-row social-login\">\n");
      out.write("                                                <div class=\"col-6\">\n");
      out.write("                                                    <a href=\"#\" class=\"btn btn-facebook btn-block\"><i class=\"fab fa-facebook-f mr-1\"></i> Login</a>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-6\">\n");
      out.write("                                                    <a href=\"#\" class=\"btn btn-google btn-block\"><i class=\"fab fa-google mr-1\"></i> Login</a>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"text-center dont-have\">Don’t have an account? <a href=\"register.html\">Register</a></div>\n");
      out.write("                                        </form>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <!-- /Login Tab Content -->\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <!-- /Page Content -->\n");
      out.write("\n");
      out.write("            <!-- Footer -->\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/footer.jsp", out, false);
      out.write("\n");
      out.write("            <!-- /Footer -->\n");
      out.write("        </div>\n");
      out.write("        <!-- /Main Wrapper -->\n");
      out.write("\n");
      out.write("        <!-- Script -->\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/script.jsp", out, false);
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
