package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>CampusConnect Dashboard</title>\n");
      out.write("\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\"/>\n");
      out.write("<link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css\" rel=\"stylesheet\"/>\n");
      out.write("\n");
      out.write("<style>\n");
      out.write("html, body {\n");
      out.write("    height: 100%;\n");
      out.write("    margin: 0;\n");
      out.write("    font-family: 'Poppins', sans-serif;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Background */\n");
      out.write(".background {\n");
      out.write("    position: fixed;\n");
      out.write("    width: 100%;\n");
      out.write("    height: 100%;\n");
      out.write("    background-image: url('https://www.studentroom.co.za/wp-content/uploads/2020/03/Tshwane-University-of-Technology-tut-logo.png');\n");
      out.write("    background-repeat: repeat;\n");
      out.write("    background-size: 150px;\n");
      out.write("    filter: blur(1px);\n");
      out.write("    z-index: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Container */\n");
      out.write(".dashboard-container {\n");
      out.write("    position: relative;\n");
      out.write("    z-index: 1;\n");
      out.write("    padding: 30px;\n");
      out.write("    max-width: 1000px;   /* limit width */\n");
      out.write("    margin: auto;        /* center content */\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Main card */\n");
      out.write(".dashboard-card {\n");
      out.write("    background: rgba(0,0,0,0.9);\n");
      out.write("    color: white;\n");
      out.write("    border-radius: 12px;\n");
      out.write("    padding: 25px;\n");
      out.write("    box-shadow: 0 10px 25px rgba(0,0,0,0.5);\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Header bar */\n");
      out.write(".top-bar {\n");
      out.write("    display: flex;\n");
      out.write("    justify-content: space-between;\n");
      out.write("    align-items: center;\n");
      out.write("    border-bottom: 1px solid #444;\n");
      out.write("    padding-bottom: 10px;\n");
      out.write("    margin-bottom: 20px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Feature boxes */\n");
      out.write(".feature-box {\n");
      out.write("    background: #111;\n");
      out.write("    border: 1px solid #333;\n");
      out.write("    border-radius: 10px;\n");
      out.write("    padding: 30px 20px;\n");
      out.write("    text-align: center;\n");
      out.write("    cursor: pointer;\n");
      out.write("    transition: 0.3s;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".feature-box:hover {\n");
      out.write("    background: #0d6efd;\n");
      out.write("    transform: translateY(-5px);\n");
      out.write("}\n");
      out.write("\n");
      out.write(".feature-box i {\n");
      out.write("    font-size: 28px;\n");
      out.write("    margin-top: 10px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".welcome-text {\n");
      out.write("    margin: 20px 0 30px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Recent requests box */\n");
      out.write(".requests-box {\n");
      out.write("    margin-top: 40px;\n");
      out.write("    border: 1px solid #444;\n");
      out.write("    border-radius: 8px;\n");
      out.write("    padding: 15px;\n");
      out.write("    background: #111;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".requests-row {\n");
      out.write("    border-bottom: 1px solid #333;\n");
      out.write("    padding: 8px 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".requests-row:last-child {\n");
      out.write("    border-bottom: none;\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<div class=\"background\"></div>\n");
      out.write("\n");
      out.write("<div class=\"dashboard-container container\">\n");
      out.write("<div class=\"dashboard-card\">\n");
      out.write("\n");
      out.write("<!-- Header -->\n");
      out.write("<div class=\"top-bar\">\n");
      out.write("    <h4>CampusConnect</h4>\n");
      out.write("    <div>\n");
      out.write("        <span class=\"me-3\">>></span>\n");
      out.write("        <a href=\"login.jsp\" class=\"btn btn-sm btn-danger\">Logout</a>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<!-- Welcome -->\n");
      out.write("<h5 class=\"welcome-text\">Welcome, Student!</h5>\n");
      out.write("\n");
      out.write("<!-- Dashboard Grid -->\n");
      out.write("\n");
      out.write("<!-- Dashboard Grid -->\n");
      out.write("\n");
      out.write("<!-- Row 1 -->\n");
      out.write("<div class=\"row g-4\">\n");
      out.write("    <div class=\"col-md-6\">\n");
      out.write("        <div class=\"feature-box\">\n");
      out.write("            <h6>Request Support</h6>\n");
      out.write("            <i class=\"fa-solid fa-plus\"></i>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"col-md-6\">\n");
      out.write("        <div class=\"feature-box\">\n");
      out.write("            <h6>Announcements</h6>\n");
      out.write("            <i class=\"fa-solid fa-bullhorn\"></i>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<!-- Row 2 -->\n");
      out.write("<div class=\"row g-4 mt-1\">\n");
      out.write("    <div class=\"col-md-6\">\n");
      out.write("        <a href=\"trackRequestPage.jsp\" class=\"text-decoration-none\">\n");
      out.write("            <div class=\"feature-box\">\n");
      out.write("            <h6>Track Requests</h6>\n");
      out.write("            <i class=\"fa-solid fa-clipboard-list\"></i>\n");
      out.write("        </div>\n");
      out.write("        </a>\n");
      out.write("       \n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"col-md-6\">\n");
      out.write("        <a href=\"feedBackPage.jsp\" class=\"text-decoration-none\">\n");
      out.write("           <div class=\"feature-box\">\n");
      out.write("            <h6>Feedback</h6>\n");
      out.write("            <i class=\"fa-solid fa-comment\"></i>\n");
      out.write("        </div> \n");
      out.write("        </a>\n");
      out.write("        \n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Recent Requests Section -->\n");
      out.write("<div class=\"requests-box\">\n");
      out.write("    <h6>RECENT REQUESTS:</h6>\n");
      out.write("\n");
      out.write("    <div class=\"requests-row\">\n");
      out.write("        Math Tutoring | Pending | 2024-10-01\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"requests-row\">\n");
      out.write("        Consultation | Approved | 2024-09-28\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
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
