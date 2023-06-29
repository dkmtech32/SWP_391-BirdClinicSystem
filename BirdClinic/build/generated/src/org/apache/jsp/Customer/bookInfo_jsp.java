package org.apache.jsp.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class bookInfo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_url_value_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_url_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
    _jspx_tagPool_c_if_test.release();
    _jspx_tagPool_c_url_value_nobody.release();
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
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-7 col-lg-8\">\n");
      out.write("                            <div class=\"card\">\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <!-- Checkout Form -->\n");
      out.write("                                    <form action=\"");
      if (_jspx_meth_c_url_0(_jspx_page_context))
        return;
      out.write("\" method=\"POST\">\n");
      out.write("                                        ");
      if (_jspx_meth_c_if_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                                        <!-- Personal Information -->\n");
      out.write("                                        <div class=\"info-widget\">\n");
      out.write("                                            <h4 class=\"card-title\">Personal Information</h4>\n");
      out.write("                                            <div class=\"row\">\n");
      out.write("                                                <div class=\"col-12 col-md-6\">\n");
      out.write("                                                    <div class=\"form-group\">\n");
      out.write("                                                        <label>Full Name</label>\n");
      out.write("                                                        <div class=\"form-control\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${currentUser.fullName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-12 col-md-6\">\n");
      out.write("                                                    <div class=\"form-group\">\n");
      out.write("                                                        <label>Date of Birth</label>\n");
      out.write("                                                        <div class=\"cal-icon\">\n");
      out.write("                                                            <div class=\"form-control datetimepicker\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${currentUser.dob}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</div>\n");
      out.write("                                                        </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-12 col-md-6\">\n");
      out.write("                                                    <div class=\"form-group\">\n");
      out.write("                                                        <label>Address</label>\n");
      out.write("                                                        <div class=\"form-control\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${currentUser.phoneNumber}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-12 col-md-6\">\n");
      out.write("                                                    <div class=\"form-group\">\n");
      out.write("                                                        <label>Email</label>\n");
      out.write("                                                        <div class=\"form-control\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${currentUser.email}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</div> <!-- email này chưa có nên tôi chế -->\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-12 col-md-6\">\n");
      out.write("                                                    <div class=\"form-group\">\n");
      out.write("                                                        <label>Mobile</label>\n");
      out.write("                                                        <div class=\"form-control\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${currentUser.customerAddress}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</div> \n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <!-- <div class=\"exist-currentUser\">Existing Customer? <a href=\"#\">Click here to login</a></div> -->\n");
      out.write("                                        </div>\n");
      out.write("                                        <!-- /Personal Information -->\n");
      out.write("                                        <!-- Bird info -->\n");
      out.write("                                        <div class=\"info-widget\">\n");
      out.write("                                            <h4 class=\"card-title\">Bird Information</h4>\n");
      out.write("                                            <div class=\"row\">\n");
      out.write("                                                <div class=\"col-md-12 col-sm-12\">\n");
      out.write("                                                    <div class=\"form-group card-label\">\n");
      out.write("                                                        <label>Choose your bird</label>\n");
      out.write("                                                        <select class=\"form-control\" name=\"birdID\" required=\"required\">\n");
      out.write("                                                            ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                                                        </select>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <!-- <div class=\"exist-currentUser\">Existing Customer? <a href=\"#\">Click here to login</a></div> -->\n");
      out.write("                                        </div>\n");
      out.write("                                        <!-- /Bird info -->\n");
      out.write("                                        <!-- Notes section -->\n");
      out.write("                                        <div class=\"info-widget\">\n");
      out.write("                                            <h4 class=\"card-title\">Notes</h4>\n");
      out.write("                                            <div class=\"col-md-12 col-sm-12\">\n");
      out.write("                                                <div class=\"form-group card-label\">\n");
      out.write("                                                    <label>Choose service</label>\n");
      out.write("                                                    <select class=\"form-control\" name=\"serviceID\" required >\n");
      out.write("                                                        ");
      if (_jspx_meth_c_forEach_1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                                                    </select>\n");
      out.write("                                                    <div class=\"invalid-feedback\">Example invalid custom select feedback</div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"col-md-12 col-sm-12\">\n");
      out.write("                                                <div class=\"form-group\">\t\t\t\t\t\t\t\t\t\t\t\t\t\n");
      out.write("                                                    <textarea class=\"form-control\" rows=\"4\" placeholder=\"Describe bird's symtoms\"></textarea>\n");
      out.write("                                                    <div class=\"invalid-feedback\">Example invalid custom select feedback</div>\n");
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
      out.write("                                                <li>Date <span>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${appoitment.service_}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span></li>\n");
      out.write("                                                <li>Time <span>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${appoitment.timeslot}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span></li>\n");
      out.write("                                            </ul>\n");
      out.write("                                            <ul class=\"booking-fee\">\n");
      out.write("                                                <!-- <li>Consulting Fee <span>$100</span></li> -->\n");
      out.write("                                                <li>Booking Fee <span>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${appoitment.bookingFee}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/span></li> <!--biến này chế vì chưa có-->\n");
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

  private boolean _jspx_meth_c_url_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_url_0 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _jspx_tagPool_c_url_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_url_0.setPageContext(_jspx_page_context);
    _jspx_th_c_url_0.setParent(null);
    _jspx_th_c_url_0.setValue("Customer/bookAppointment");
    int _jspx_eval_c_url_0 = _jspx_th_c_url_0.doStartTag();
    if (_jspx_th_c_url_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_url_value_nobody.reuse(_jspx_th_c_url_0);
      return true;
    }
    _jspx_tagPool_c_url_value_nobody.reuse(_jspx_th_c_url_0);
    return false;
  }

  private boolean _jspx_meth_c_if_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_0.setPageContext(_jspx_page_context);
    _jspx_th_c_if_0.setParent(null);
    _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty doctorID}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
    if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                                            <input value=\"");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${doctorID}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("\" name=\"doctorID\" id=\"doctorID\" hidden=\"hidden\"/>\n");
        out.write("                                        ");
        int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
    return false;
  }

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setVar("bird");
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${birds}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                                                                <option value=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${bird.birdID}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write('"');
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${bird.birdFullname}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</option>\n");
          out.write("                                                            ");
          int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_0.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }

  private boolean _jspx_meth_c_forEach_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_1 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_1.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_1.setParent(null);
    _jspx_th_c_forEach_1.setVar("service");
    _jspx_th_c_forEach_1.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${services}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int[] _jspx_push_body_count_c_forEach_1 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_1 = _jspx_th_c_forEach_1.doStartTag();
      if (_jspx_eval_c_forEach_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                                                            <option value=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${service.serviceID}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write('"');
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${service.serviceName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</option>\n");
          out.write("                                                        ");
          int evalDoAfterBody = _jspx_th_c_forEach_1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_1[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_1.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_1.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_1);
    }
    return false;
  }
}
