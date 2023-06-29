package org.apache.jsp.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class bookInfo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_choose;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_when_test;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_choose = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_when_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_if_test.release();
    _jspx_tagPool_c_choose.release();
    _jspx_tagPool_c_when_test.release();
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
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/head.jsp", out, false);
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        <!-- Main Wrapper -->\r\n");
      out.write("        <div class=\"main-wrapper\">\r\n");
      out.write("            <!-- Header -->\r\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/header.jsp", out, false);
      out.write("\r\n");
      out.write("            <!--/Header -->\r\n");
      out.write("\r\n");
      out.write("            <!-- Breadcrumb -->\r\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/breadcrumb.jsp", out, false);
      out.write("\r\n");
      out.write("            <!-- /Breadcrumb -->\r\n");
      out.write("\r\n");
      out.write("            <!-- Page Content -->\r\n");
      out.write("            <div class=\"content\">\r\n");
      out.write("                <div class=\"container\">\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col-md-7 col-lg-8\">\r\n");
      out.write("                            <div class=\"card\">\r\n");
      out.write("                                <div class=\"card-body\">\r\n");
      out.write("                                    <!-- Checkout Form -->\r\n");
      out.write("                                    <form action=\"../Customer/booking-success.jsp\">\r\n");
      out.write("                                        <!-- Personal Information -->\r\n");
      out.write("                                        <div class=\"info-widget\">\r\n");
      out.write("                                            <h4 class=\"card-title\">Personal Information</h4>\r\n");
      out.write("                                            <div class=\"row\">\r\n");
      out.write("                                                <div class=\"col-md-6 col-sm-12\">\r\n");
      out.write("                                                    <div class=\"form-group card-label\">\r\n");
      out.write("                                                        <label>Full Name</label>\r\n");
      out.write("                                                        <input class=\"form-control\" type=\"text\" value=\"Nguyen Van G\" />\r\n");
      out.write("                                                    </div>\r\n");
      out.write("                                                </div>\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("                                                <div class=\"col-md-6 col-sm-12\">\r\n");
      out.write("                                                    <div class=\"form-group card-label\">\r\n");
      out.write("                                                        <label>Email</label>\r\n");
      out.write("                                                        <input class=\"form-control\" type=\"email\" value=\"test@gmail.com\" />\r\n");
      out.write("                                                    </div>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                                <div class=\"col-md-6 col-sm-12\">\r\n");
      out.write("                                                    <div class=\"form-group card-label\">\r\n");
      out.write("                                                        <label>Phone</label>\r\n");
      out.write("                                                        <input class=\"form-control\" type=\"text\" value=\"0999999000\"/>\r\n");
      out.write("                                                    </div>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                                <div class=\"col-md-6 col-sm-12\">\r\n");
      out.write("                                                    <div class=\"form-group card-label\">\r\n");
      out.write("                                                        <label>Gender</label>\r\n");
      out.write("                                                        <select class=\"form-control\">\r\n");
      out.write("                                                            <option value=\"Male\">Male</option>\r\n");
      out.write("                                                            <option value=\"Female\">Female</option>\r\n");
      out.write("                                                            <option value=\"Other\">Other</option>\r\n");
      out.write("                                                        </select>\r\n");
      out.write("                                                    </div>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <!-- <div class=\"exist-customer\">Existing Customer? <a href=\"#\">Click here to login</a></div> -->\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <!-- /Personal Information -->\r\n");
      out.write("                                        <!-- Bird info -->\r\n");
      out.write("                                        <div class=\"info-widget\">\r\n");
      out.write("                                            <h4 class=\"card-title\">Bird Information</h4>\r\n");
      out.write("                                            <div class=\"row\">\r\n");
      out.write("                                                <!-- <div class=\"col-md-6 col-sm-12\">\r\n");
      out.write("                                                        <div class=\"form-group card-label\">\r\n");
      out.write("                                                                <label>Name</label>\r\n");
      out.write("                                                                <input class=\"form-control\" type=\"text\" value=\"Chó\" />\r\n");
      out.write("                                                        </div>\r\n");
      out.write("                                                </div>\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("                                                <div class=\"col-md-6 col-sm-12\">\r\n");
      out.write("                                                        <div class=\"form-group card-label\">\r\n");
      out.write("                                                                <label>Breed</label>\r\n");
      out.write("                                                                <input class=\"form-control\" type=\"text\" value=\"Parrot\" />\r\n");
      out.write("                                                        </div>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                                <div class=\"col-md-6 col-sm-12\">\r\n");
      out.write("                                                        <div class=\"form-group card-label\">\r\n");
      out.write("                                                                <label>Date of Birth</label>\r\n");
      out.write("                                                                <input class=\"form-control\" type=\"date\" value=\"2022-12-15\" name=\"dob\"/>\r\n");
      out.write("                                                        </div>\r\n");
      out.write("                                                </div> -->\r\n");
      out.write("                                                <!-- <div class=\"col-md-6 col-sm-12\">\r\n");
      out.write("                                                        <div class=\"form-group card-label\">\r\n");
      out.write("                                                                <label>Gender</label>\r\n");
      out.write("                                                                <select class=\"form-control\">\r\n");
      out.write("                                                                        <option value=\"Male\">Male</option>\r\n");
      out.write("                                                                        <option value=\"Female\">Female</option>\r\n");
      out.write("                                                                        <option value=\"Other\">Other</option>\r\n");
      out.write("                                                                </select>\r\n");
      out.write("                                                        </div>\r\n");
      out.write("                                                </div> -->\r\n");
      out.write("                                                <div class=\"col-md-12 col-sm-12\">\r\n");
      out.write("                                                    <div class=\"form-group card-label\">\r\n");
      out.write("                                                        <label>Choose your bird</label>\r\n");
      out.write("                                                        <select class=\"form-control\">\r\n");
      out.write("                                                            <option value=\"dog\">Chó</option>\r\n");
      out.write("                                                            <option value=\"cat\">Mèo</option>\r\n");
      out.write("                                                            <option value=\"bird\">Chim</option>\r\n");
      out.write("                                                        </select>\r\n");
      out.write("                                                    </div>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <!-- <div class=\"exist-customer\">Existing Customer? <a href=\"#\">Click here to login</a></div> -->\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <!-- /Bird info -->\r\n");
      out.write("                                        <!-- Notes section -->\r\n");
      out.write("                                        <div class=\"info-widget\">\r\n");
      out.write("                                            <h4 class=\"card-title\">Notes</h4>\r\n");
      out.write("                                            ");
      if (_jspx_meth_c_if_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                                            <div class=\"col-md-12 col-sm-12\">\r\n");
      out.write("                                                <div class=\"form-group\">\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("                                                    <textarea class=\"form-control\" rows=\"4\" placeholder=\"Describe bird's symtoms\" required></textarea>\r\n");
      out.write("                                                    <div class=\"invalid-feedback\">Example invalid custom select feedback</div>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <!-- /Notes section -->\r\n");
      out.write("                                        <!-- Submit Section -->\r\n");
      out.write("                                        <div class=\"submit-section mt-4\">\r\n");
      out.write("                                            <button type=\"submit\" class=\"btn btn-primary submit-btn\">Confirm and submit</button>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <!-- /Submit Section -->\r\n");
      out.write("                                    </form>\r\n");
      out.write("                                    <!-- /Checkout Form -->\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"col-md-5 col-lg-4 theiaStickySidebar\">\r\n");
      out.write("                            <!-- Booking Summary -->\r\n");
      out.write("                            <div class=\"card booking-card\">\r\n");
      out.write("                                <div class=\"card-header\">\r\n");
      out.write("                                    <h4 class=\"card-title\">Booking Summary</h4>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"card-body\">\r\n");
      out.write("                                    <!-- Booking Doctor Info -->                                    \r\n");
      out.write("                                    ");
      if (_jspx_meth_c_choose_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                                    <!-- Booking Doctor Info -->\r\n");
      out.write("\r\n");
      out.write("                                    <div class=\"booking-summary\">\r\n");
      out.write("                                        <div class=\"booking-item-wrap\">\r\n");
      out.write("                                            <ul class=\"booking-date\">\r\n");
      out.write("                                                <li>Date <span>16 Jun 2023</span></li>\r\n");
      out.write("                                                <li>Time <span>10:00 AM</span></li>\r\n");
      out.write("                                            </ul>\r\n");
      out.write("                                            <ul class=\"booking-fee\">\r\n");
      out.write("                                                <!-- <li>Consulting Fee <span>$100</span></li> -->\r\n");
      out.write("                                                <li>Booking Fee <span>$10</span></li>\r\n");
      out.write("                                                <!-- <li>Video Call <span>$50</span></li> -->\r\n");
      out.write("                                            </ul>\r\n");
      out.write("                                            <!-- <div class=\"booking-total\">\r\n");
      out.write("                                                    <ul class=\"booking-total-list\">\r\n");
      out.write("                                                            <li>\r\n");
      out.write("                                                                    <span>Total</span>\r\n");
      out.write("                                                                    <span class=\"total-cost\">$160</span>\r\n");
      out.write("                                                            </li>\r\n");
      out.write("                                                    </ul>\r\n");
      out.write("                                            </div> -->\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <!-- /Booking Summary -->\r\n");
      out.write("                            <form>\r\n");
      out.write("                                <datetime-slot-picker \r\n");
      out.write("                                    placeholder=\"Pick a date and time slot\" \r\n");
      out.write("                                    time-slots-text=\"Time Slot\"\r\n");
      out.write("                                    no-slots-text=\"No slots are available\" \r\n");
      out.write("                                    >\r\n");
      out.write("                                </datetime-slot-picker>\r\n");
      out.write("                                <button class=\"btn-primary\">submit</button>\r\n");
      out.write("                            </form>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- /Page Content -->\r\n");
      out.write("\r\n");
      out.write("            <!-- Footer -->\r\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/footer.jsp", out, false);
      out.write("\r\n");
      out.write("            <!-- /Footer -->\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- /Main Wrapper -->\r\n");
      out.write("        \r\n");
      out.write("        <!-- Script -->\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/script.jsp", out, false);
      out.write("\r\n");
      out.write("        <script>\r\n");
      out.write("            const datetimeSlotPicker = document.querySelector('datetime-slot-picker');\r\n");
      out.write("            /* LISTENER FOR DATE AND TIME SLOT CHANGES */\r\n");
      out.write("            datetimeSlotPicker.addEventListener('slotUpdate', function (event) {\r\n");
      out.write("                console.log('Updated Slot: ', event.detail)\r\n");
      out.write("            });\r\n");
      out.write("\r\n");
      out.write("            /* INITIALIZING THE AVAILABLE SLOTS. TIME SLOTS IS OPTIONAL */\r\n");
      out.write("            datetimeSlotPicker.slots = [\r\n");
      out.write("                {\r\n");
      out.write("                    \"date\": 'Thu, 26 Nov 2020',\r\n");
      out.write("                    \"timeSlots\": [\r\n");
      out.write("                        '6 AM - 7 AM',\r\n");
      out.write("                        '7 AM - 8 AM',\r\n");
      out.write("                        '8 AM - 9 AM',\r\n");
      out.write("                        '9 AM - 10 AM',\r\n");
      out.write("                        '10 AM - 11 AM',\r\n");
      out.write("                        '11 AM - 12 PM',\r\n");
      out.write("                        '12 PM - 1 PM',\r\n");
      out.write("                        '1 PM - 2 PM',\r\n");
      out.write("                        '2 PM - 3 PM',\r\n");
      out.write("                        '3 PM - 4 PM',\r\n");
      out.write("                        '4 PM - 5 PM',\r\n");
      out.write("                        '5 PM - 6 PM',\r\n");
      out.write("                        '6 PM - 7 PM',\r\n");
      out.write("                        '7 PM - 8 PM',\r\n");
      out.write("                        '8 PM - 9 PM',\r\n");
      out.write("                        '9 PM - 10 PM',\r\n");
      out.write("                        '10 PM - 11 PM',\r\n");
      out.write("                        '11 PM - 12 AM'\r\n");
      out.write("                    ]\r\n");
      out.write("                },\r\n");
      out.write("                {\r\n");
      out.write("                    \"date\": 'Fri, 27 Nov 2020',\r\n");
      out.write("                    \"timeSlots\": [\r\n");
      out.write("                    ]\r\n");
      out.write("                },\r\n");
      out.write("                {\r\n");
      out.write("                    \"date\": 'Mon, 30 Nov 2020',\r\n");
      out.write("                    \"timeSlots\": [\r\n");
      out.write("                        '10 AM - 11 AM',\r\n");
      out.write("                        '11 AM - 12 PM',\r\n");
      out.write("                        '4 PM - 5 PM',\r\n");
      out.write("                        '5 PM - 6 PM'\r\n");
      out.write("                    ]\r\n");
      out.write("                },\r\n");
      out.write("                {\r\n");
      out.write("                    \"date\": 'Tue, 1 Dec 2020',\r\n");
      out.write("                    \"timeSlots\": [\r\n");
      out.write("                        '10 AM - 11 AM',\r\n");
      out.write("                        '11 AM - 12 PM',\r\n");
      out.write("                        '4 PM - 5 PM',\r\n");
      out.write("                        '5 PM - 6 PM'\r\n");
      out.write("                    ]\r\n");
      out.write("                },\r\n");
      out.write("                {\r\n");
      out.write("                    date: 'Mon, 4 Jan 2021',\r\n");
      out.write("                    timeSlots: [\r\n");
      out.write("                        '6 AM',\r\n");
      out.write("                        '7 AM',\r\n");
      out.write("                        '8 AM',\r\n");
      out.write("                        '1 PM - 2 PM',\r\n");
      out.write("                        '2 PM - 3 PM',\r\n");
      out.write("                        '4 PM - 5 PM',\r\n");
      out.write("                        '5 PM - 6 PM',\r\n");
      out.write("                        '6 PM - 7 PM',\r\n");
      out.write("                        '7 PM - 8 PM',\r\n");
      out.write("                        '8 PM - 9 PM'\r\n");
      out.write("                    ]\r\n");
      out.write("                }\r\n");
      out.write("            ];\r\n");
      out.write("        </script>\r\n");
      out.write("        <!-- /Script -->\r\n");
      out.write("    </body>\r\n");
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

  private boolean _jspx_meth_c_if_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_0.setPageContext(_jspx_page_context);
    _jspx_th_c_if_0.setParent(null);
    _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.doctor == 'all'}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
    if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("                                                <div class=\"col-md-12 col-sm-12\">\r\n");
        out.write("                                                    <div class=\"form-group card-label\">\r\n");
        out.write("                                                        <label>Choose specialty</label>\r\n");
        out.write("                                                        <select class=\"form-control\" required >\r\n");
        out.write("                                                            <option value=\"\">--</option>\r\n");
        out.write("                                                            <option value=\"general\">General</option>\r\n");
        out.write("                                                            <option value=\"surgery\">Surgery</option>\r\n");
        out.write("                                                            <option value=\"imaging\">Imaging</option>\r\n");
        out.write("                                                            <option value=\"nutrition\">Nutrition</option>\r\n");
        out.write("                                                            <option value=\"genetics\">Genetics</option>\r\n");
        out.write("                                                        </select>\r\n");
        out.write("                                                        <div class=\"invalid-feedback\">Example invalid custom select feedback</div>\r\n");
        out.write("                                                    </div>\r\n");
        out.write("                                                </div>\r\n");
        out.write("                                            ");
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

  private boolean _jspx_meth_c_choose_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:choose
    org.apache.taglibs.standard.tag.common.core.ChooseTag _jspx_th_c_choose_0 = (org.apache.taglibs.standard.tag.common.core.ChooseTag) _jspx_tagPool_c_choose.get(org.apache.taglibs.standard.tag.common.core.ChooseTag.class);
    _jspx_th_c_choose_0.setPageContext(_jspx_page_context);
    _jspx_th_c_choose_0.setParent(null);
    int _jspx_eval_c_choose_0 = _jspx_th_c_choose_0.doStartTag();
    if (_jspx_eval_c_choose_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("                                        ");
        if (_jspx_meth_c_when_0((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_choose_0, _jspx_page_context))
          return true;
        out.write("\r\n");
        out.write("                                        ");
        if (_jspx_meth_c_when_1((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_choose_0, _jspx_page_context))
          return true;
        out.write("                                       \r\n");
        out.write("                                    ");
        int evalDoAfterBody = _jspx_th_c_choose_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_choose_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_choose.reuse(_jspx_th_c_choose_0);
      return true;
    }
    _jspx_tagPool_c_choose.reuse(_jspx_th_c_choose_0);
    return false;
  }

  private boolean _jspx_meth_c_when_0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_choose_0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:when
    org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_when_0 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _jspx_tagPool_c_when_test.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
    _jspx_th_c_when_0.setPageContext(_jspx_page_context);
    _jspx_th_c_when_0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_choose_0);
    _jspx_th_c_when_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.doctor == 'all'}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_when_0 = _jspx_th_c_when_0.doStartTag();
    if (_jspx_eval_c_when_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("                                 \r\n");
        out.write("                                            <div class=\"booking-doc-info\">\r\n");
        out.write("                                                <a href=\"doctor-profile.jsp\" class=\"booking-doc-img\">\r\n");
        out.write("                                                    <img src=\"../assets/img/logo.png\" alt=\"User Image\" />\r\n");
        out.write("                                                </a>\r\n");
        out.write("                                                <div class=\"booking-info\">\r\n");
        out.write("                                                    <h4><a href=\"doctor-profile.jsp\">BirdLover Clinic</a></h4>\r\n");
        out.write("                                                    <!-- <div class=\"rating\">\r\n");
        out.write("                                                            <i class=\"fas fa-star filled\"></i>\r\n");
        out.write("                                                            <i class=\"fas fa-star filled\"></i>\r\n");
        out.write("                                                            <i class=\"fas fa-star filled\"></i>\r\n");
        out.write("                                                            <i class=\"fas fa-star filled\"></i>\r\n");
        out.write("                                                            <i class=\"fas fa-star\"></i>\r\n");
        out.write("                                                            <span class=\"d-inline-block average-rating\">35</span>\r\n");
        out.write("                                                    </div> -->\r\n");
        out.write("                                                    <div class=\"clinic-details\">\r\n");
        out.write("                                                        <p class=\"doc-location\"><i class=\"fas fa-map-marker-alt\"></i> Long Bien, Hanoi</p>\r\n");
        out.write("                                                    </div>\r\n");
        out.write("                                                </div>\r\n");
        out.write("                                            </div>\r\n");
        out.write("                                        ");
        int evalDoAfterBody = _jspx_th_c_when_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_when_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_0);
      return true;
    }
    _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_0);
    return false;
  }

  private boolean _jspx_meth_c_when_1(javax.servlet.jsp.tagext.JspTag _jspx_th_c_choose_0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:when
    org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_when_1 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _jspx_tagPool_c_when_test.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
    _jspx_th_c_when_1.setPageContext(_jspx_page_context);
    _jspx_th_c_when_1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_choose_0);
    _jspx_th_c_when_1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.doctor == 'doc'}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_when_1 = _jspx_th_c_when_1.doStartTag();
    if (_jspx_eval_c_when_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("                                            <div class=\"booking-doc-info\">\r\n");
        out.write("                                                <a href=\"doctor-profile.jsp\" class=\"booking-doc-img\">\r\n");
        out.write("                                                    <img src=\"../assets/img/doctors/doctor-02.jpg\" alt=\"Docs Image\" />\r\n");
        out.write("                                                </a>\r\n");
        out.write("                                                <div class=\"booking-info\">\r\n");
        out.write("                                                    <h4><a href=\"doctor-profile.jsp\">Dr. ABC</a></h4>\r\n");
        out.write("                                                    <!-- <div class=\"rating\">\r\n");
        out.write("                                                            <i class=\"fas fa-star filled\"></i>\r\n");
        out.write("                                                            <i class=\"fas fa-star filled\"></i>\r\n");
        out.write("                                                            <i class=\"fas fa-star filled\"></i>\r\n");
        out.write("                                                            <i class=\"fas fa-star filled\"></i>\r\n");
        out.write("                                                            <i class=\"fas fa-star\"></i>\r\n");
        out.write("                                                            <span class=\"d-inline-block average-rating\">35</span>\r\n");
        out.write("                                                    </div> -->\r\n");
        out.write("                                                    <div class=\"clinic-details\">\r\n");
        out.write("                                                        <p class=\"doc-location\"><i class=\"fas fa-map-marker-alt\"></i> Long Bien, Hanoi</p>\r\n");
        out.write("                                                    </div>\r\n");
        out.write("                                                </div>\r\n");
        out.write("                                            </div>\r\n");
        out.write("                                        ");
        int evalDoAfterBody = _jspx_th_c_when_1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_when_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_1);
      return true;
    }
    _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_1);
    return false;
  }
}