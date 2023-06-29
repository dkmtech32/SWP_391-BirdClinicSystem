package org.apache.jsp.Common;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class booking_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_choose;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_when_test;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_choose = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_when_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
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
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/header-guest.jsp", out, false);
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
      out.write("                        <div class=\"col-12\">\r\n");
      out.write("                            <div class=\"card\">\r\n");
      out.write("                                <div class=\"card-body\">\r\n");
      out.write("                                    ");
      if (_jspx_meth_c_choose_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("\r\n");
      out.write("                            <!-- Schedule Widget -->\r\n");
      out.write("                            <div class=\"card booking-schedule schedule-widget\">\r\n");
      out.write("                                <!-- Schedule Header -->\r\n");
      out.write("                                <div class=\"schedule-header\">\r\n");
      out.write("                                    <div class=\"row\">\r\n");
      out.write("                                        <div class=\"col-md-12\">\r\n");
      out.write("                                            <!-- Day Slot -->\r\n");
      out.write("                                            <div class=\"day-slot\">\r\n");
      out.write("                                                <ul>\r\n");
      out.write("                                                    <li class=\"left-arrow\">\r\n");
      out.write("                                                        <a href=\"#\">\r\n");
      out.write("                                                            <i class=\"fa fa-chevron-left\"></i>\r\n");
      out.write("                                                        </a>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                    <li>\r\n");
      out.write("                                                        <span>Mon</span>\r\n");
      out.write("                                                        <span class=\"slot-date\">11 Jun <small class=\"slot-year\">2023</small></span>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                    <li>\r\n");
      out.write("                                                        <span>Tue</span>\r\n");
      out.write("                                                        <span class=\"slot-date\">12 Jun <small class=\"slot-year\">2023</small></span>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                    <li>\r\n");
      out.write("                                                        <span>Wed</span>\r\n");
      out.write("                                                        <span class=\"slot-date\">13 Jun <small class=\"slot-year\">2023</small></span>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                    <li>\r\n");
      out.write("                                                        <span>Thu</span>\r\n");
      out.write("                                                        <span class=\"slot-date\">14 Jun <small class=\"slot-year\">2023</small></span>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                    <li>\r\n");
      out.write("                                                        <span>Fri</span>\r\n");
      out.write("                                                        <span class=\"slot-date\">15 Jun <small class=\"slot-year\">2023</small></span>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                    <li>\r\n");
      out.write("                                                        <span>Sat</span>\r\n");
      out.write("                                                        <span class=\"slot-date\">16 Jun <small class=\"slot-year\">2023</small></span>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                    <li>\r\n");
      out.write("                                                        <span>Sun</span>\r\n");
      out.write("                                                        <span class=\"slot-date\">17 Jun <small class=\"slot-year\">2023</small></span>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                    <li class=\"right-arrow\">\r\n");
      out.write("                                                        <a href=\"#\">\r\n");
      out.write("                                                            <i class=\"fa fa-chevron-right\"></i>\r\n");
      out.write("                                                        </a>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                </ul>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <!-- /Day Slot -->\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <!-- /Schedule Header -->\r\n");
      out.write("\r\n");
      out.write("                                <!-- Schedule Content -->\r\n");
      out.write("                                <div class=\"schedule-cont\">\r\n");
      out.write("                                    <div class=\"row\">\r\n");
      out.write("                                        <div class=\"col-md-12\">\r\n");
      out.write("                                            <!-- Time Slot -->\r\n");
      out.write("                                            <div class=\"time-slot\">\r\n");
      out.write("                                                <ul class=\"clearfix\">\r\n");
      out.write("                                                    <li>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>9:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>10:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                    <li>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>9:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>10:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>11:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                    <li>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>9:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>10:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>11:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                    <li>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>9:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>10:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>11:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                    <li>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>9:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                        <a class=\"timing selected\" href=\"#\"> <span>10:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>11:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                    <li>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>9:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>10:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>11:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                    <li>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>9:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>10:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                        <a class=\"timing\" href=\"#\"> <span>11:00</span> <span>AM</span> </a>\r\n");
      out.write("                                                    </li>\r\n");
      out.write("                                                </ul>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <!-- /Time Slot -->\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <!-- /Schedule Content -->\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <!-- /Schedule Widget -->\r\n");
      out.write("\r\n");
      out.write("                            <!-- Submit Section -->\r\n");
      out.write("                            ");
      if (_jspx_meth_c_choose_1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("                            <!-- /Submit Section -->\r\n");
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
      out.write("\r\n");
      out.write("        <!-- Script -->\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/script.jsp", out, false);
      out.write("\r\n");
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
        out.write("\r\n");
        out.write("                                            <div class=\"booking-doc-info\">\r\n");
        out.write("                                                <a href=\"doctor-profile.jsp\" class=\"booking-doc-img\">\r\n");
        out.write("                                                    <img src=\"../assets/img/logo2.png\" alt=\"User Image\" />\r\n");
        out.write("                                                </a>\r\n");
        out.write("                                                <div class=\"booking-info\">\r\n");
        out.write("                                                    <h4><a href=\"doctor-profile.jsp\">All doctor</a></h4>\r\n");
        out.write("                                                    <p class=\"text-muted mb-0\"><i class=\"fas fa-map-marker-alt\"></i> Dong Da district, Hanoi city</p>\r\n");
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
        out.write("                                                <a href=\"doctor-profile.html\" class=\"booking-doc-img\">\r\n");
        out.write("                                                    <img src=\"../assets/img/doctors/doctor-thumb-02.jpg\" alt=\"User Image\" />\r\n");
        out.write("                                                </a>\r\n");
        out.write("                                                <div class=\"booking-info\">\r\n");
        out.write("                                                    <h4><a href=\"doctor-profile.html\">Dr. ABC</a></h4>\r\n");
        out.write("                                                    <p class=\"text-muted mb-0\"><i class=\"fas fa-map-marker-alt\"></i> Dong Da district, Hanoi city</p>\r\n");
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

  private boolean _jspx_meth_c_choose_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:choose
    org.apache.taglibs.standard.tag.common.core.ChooseTag _jspx_th_c_choose_1 = (org.apache.taglibs.standard.tag.common.core.ChooseTag) _jspx_tagPool_c_choose.get(org.apache.taglibs.standard.tag.common.core.ChooseTag.class);
    _jspx_th_c_choose_1.setPageContext(_jspx_page_context);
    _jspx_th_c_choose_1.setParent(null);
    int _jspx_eval_c_choose_1 = _jspx_th_c_choose_1.doStartTag();
    if (_jspx_eval_c_choose_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("                                ");
        if (_jspx_meth_c_when_2((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_choose_1, _jspx_page_context))
          return true;
        out.write("\r\n");
        out.write("                                ");
        if (_jspx_meth_c_when_3((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_choose_1, _jspx_page_context))
          return true;
        out.write("                                       \r\n");
        out.write("                            ");
        int evalDoAfterBody = _jspx_th_c_choose_1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_choose_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_choose.reuse(_jspx_th_c_choose_1);
      return true;
    }
    _jspx_tagPool_c_choose.reuse(_jspx_th_c_choose_1);
    return false;
  }

  private boolean _jspx_meth_c_when_2(javax.servlet.jsp.tagext.JspTag _jspx_th_c_choose_1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:when
    org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_when_2 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _jspx_tagPool_c_when_test.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
    _jspx_th_c_when_2.setPageContext(_jspx_page_context);
    _jspx_th_c_when_2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_choose_1);
    _jspx_th_c_when_2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.doctor == 'all'}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_when_2 = _jspx_th_c_when_2.doStartTag();
    if (_jspx_eval_c_when_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("                                 \r\n");
        out.write("                                    <div class=\"submit-section proceed-btn text-right\">\r\n");
        out.write("                                        <a onclick=\"location.href='../Customer/bookInfo.jsp?doctor=all'\" class=\"btn btn-primary submit-btn\">Next</a>\r\n");
        out.write("                                    </div>\r\n");
        out.write("                                ");
        int evalDoAfterBody = _jspx_th_c_when_2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_when_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_2);
      return true;
    }
    _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_2);
    return false;
  }

  private boolean _jspx_meth_c_when_3(javax.servlet.jsp.tagext.JspTag _jspx_th_c_choose_1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:when
    org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_when_3 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _jspx_tagPool_c_when_test.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
    _jspx_th_c_when_3.setPageContext(_jspx_page_context);
    _jspx_th_c_when_3.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_choose_1);
    _jspx_th_c_when_3.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.doctor == 'doc'}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_when_3 = _jspx_th_c_when_3.doStartTag();
    if (_jspx_eval_c_when_3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("                                   <div class=\"submit-section proceed-btn text-right\">\r\n");
        out.write("                                        <a onclick=\"location.href='../Customer/bookInfo.jsp?doctor=doc'\" class=\"btn btn-primary submit-btn\">Next</a>\r\n");
        out.write("                                    </div>\r\n");
        out.write("                                ");
        int evalDoAfterBody = _jspx_th_c_when_3.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_when_3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_3);
      return true;
    }
    _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_3);
    return false;
  }
}
