package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class view_002dprescription_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("            <div class=\"text-center fw-bold\" id=\"title\">\n");
      out.write("                <h1 class=\"mt-3\">Prescription</h1>\n");
      out.write("\n");
      out.write("                <hr>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"container-fluid p-5 mt-4\" id=\"prescriptionForm\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-4 \">\n");
      out.write("                        <h3 class=\"text-center\">Details :</h3>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"name\">Customer Name :</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" id=\"name\" value=\"Nguyen Van G\" readonly>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group mt-3\">\n");
      out.write("                            <label for=\"age\">Bird name :</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" id=\"bird-name\" value=\"Chó\" readonly>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group mt-3\">\n");
      out.write("                            <label for=\"address\">Breed :</label>\n");
      out.write("                            <input class=\"form-control\" id=\"breed\" value=\"Sparrow\" readonly>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group mt-3\">\n");
      out.write("                            <label for=\"gender\">Gender :</label>\n");
      out.write("                            <select class=\"form-select\" aria-label=\"Default select example\" id=\"gender\" disabled>\n");
      out.write("                                <option value=\"\">Select Gender</option>\n");
      out.write("                                <option value=\"Male\" selected>Male</option>\n");
      out.write("                                <option value=\"Female\">Female</option>\n");
      out.write("                                <option value=\"Other\">Other</option>\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group mt-3\">\n");
      out.write("                            <label for=\"date\">Date :</label>\n");
      out.write("                            <input type=\"date\" class=\"form-control\" value=\"2023-06-16\" id=\"date\" readonly>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col-md-8\">\n");
      out.write("                        <h3 class=\"text-center prescription\">Prescription :</h3>\n");
      out.write("                        <div id=\"indays\">\n");
      out.write("                            <div class=\"btn-group\" role=\"group\" aria-label=\"Basic example\">\n");
      out.write("\n");
      out.write("                                <button type=\"button\" class=\"btn btn-primary\" disabled>3 Days</button>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        <!-- <div class=\"form-group mt-3\" id=\"mn\">\n");
      out.write("                                <label for=\"medicalNotes\">Medical Notes :</label>\n");
      out.write("                                <textarea class=\"form-control note-field\" id=\"medicalNotes\" rows='2'></textarea>\n");
      out.write("                                <div class=\"gap-2 d-flex justify-content-end mt-2 ms-auto\">\n");
      out.write("                                        <button onclick=\"addNewMNField()\" class=\"btn btn-success\" id=\"mnAdd\"\n");
      out.write("                                                type=\"button\">Add</button>\n");
      out.write("                                        <button onclick=\"delNewMNField()\" class=\"btn btn-danger\" id=\"mnDel\" type=\"button\">\n");
      out.write("                                                Delete\n");
      out.write("                                        </button>\n");
      out.write("                                </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        \n");
      out.write("\n");
      out.write("                        <div class=\"form-group mt-3\" id=\"md\">\n");
      out.write("                                <label for=\"medicineDetails\">Medicine Details :</label>\n");
      out.write("                                <textarea class=\"form-control detail-field\" id=\"medicineDetails\" rows='2'></textarea>\n");
      out.write("                                <div class=\"gap-2 d-flex justify-content-end mt-2 ms-auto\">\n");
      out.write("                                        <button onclick=\"addNewMDField()\" class=\"btn btn-success\" id=\"mdAdd\"\n");
      out.write("                                                type=\"button\">Add</button>\n");
      out.write("                                        <button onclick=\"delNewMDField()\" class=\"btn btn-danger\" id=\"mdDel\" type=\"button\">\n");
      out.write("                                                Delete\n");
      out.write("                                        </button>\n");
      out.write("                                </div>\n");
      out.write("                        </div> -->\n");
      out.write("                        <!-- <div id=\"tags\">\n");
      out.write("                                <p id=\"center\">\n");
      out.write("                                  <select class=\"search\" id=\"search\">\n");
      out.write("                                        <option value=\"\">Select a tag...</option>\n");
      out.write("                                        <option value=\"dt-dd\">&#60;dt&#62; &amp; &#60;dd&#62;</option>\n");
      out.write("                                        <option value=\"det-sum\">&#60;details&#62; &amp; &#60;summary&#62;</option>\n");
      out.write("                                        <option value=\"sub-sup\">&#60;sub&#62; &amp; &#60;sup&#62;</option>\n");
      out.write("                                        <option value=\"del-ins\">&#60;del&#62; &amp; &#60;ins&#62;</option>\n");
      out.write("                                        <option value=\"a\">&#60;a&#62;</option>\n");
      out.write("                                        <option value=\"b-i\">&#60;b&#62; &amp; &#60;i&#62;</option>\n");
      out.write("                                  </select>\n");
      out.write("                                </p>\n");
      out.write("                          </div>\n");
      out.write("                        -->\n");
      out.write("                        <div class=\"container\">\n");
      out.write("\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-md-12\">\n");
      out.write("                                    <table class=\"table table-bordered\" >\n");
      out.write("                                        <thead>\n");
      out.write("                                            <tr>\n");
      out.write("                                                <th>Medicine</th>\n");
      out.write("                                                <th>Quantity</th>\n");
      out.write("                                                <th>Unit</th>\n");
      out.write("                                                <th>Description</th>\n");
      out.write("\n");
      out.write("                                            </tr>\n");
      out.write("                                        </thead>\n");
      out.write("                                        <tbody>\n");
      out.write("\n");
      out.write("                                            <tr >\n");
      out.write("                                                <td >ibuprofen</td>\n");
      out.write("                                                <td >24</td>\n");
      out.write("                                                <td >pills</td>\n");
      out.write("                                                <td >1 tablet every 6 hours as needed for pain</td>\n");
      out.write("\n");
      out.write("                                            </tr>\n");
      out.write("\n");
      out.write("                                            <tr >\n");
      out.write("                                                <td >omeprazole</td>\n");
      out.write("                                                <td>30</td>\n");
      out.write("                                                <td >capsules</td>\n");
      out.write("                                                <td >1 capsule before breakfast for 14 days</td>\t\t\t\t\t\t\t\t\t\t\t\n");
      out.write("                                            </tr>\n");
      out.write("\n");
      out.write("                                            <tr >\n");
      out.write("                                                <td >loratadine</td>\n");
      out.write("                                                <td >10</td>\n");
      out.write("                                                <td >mg</td>\n");
      out.write("                                                <td >1 tablet daily for allergies</td>\t\t\t\t\t\t\t\t\t\t\t\n");
      out.write("                                            </tr>\n");
      out.write("\n");
      out.write("                                        </tbody>\n");
      out.write("                                    </table>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"info-widget\">\n");
      out.write("                            <h4 class=\"card-title\">Notes</h4>\t\t\t\t\t\t\n");
      out.write("                            <div class=\"col-md-12 col-sm-12\">\n");
      out.write("                                <div class=\"form-group\">\t\t\t\t\t\t\t\t\t\t\t\t\t\n");
      out.write("                                    <textarea class=\"form-control\" rows=\"4\" placeholder=\"Note for bird\" readonly >Upon examination, the bird appears weak and is exhibiting signs of weight loss. The mucous membranes appear pale, and there is evidence of dehydration. No obvious abnormalities were detected upon physical examination.</textarea>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>            \n");
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
