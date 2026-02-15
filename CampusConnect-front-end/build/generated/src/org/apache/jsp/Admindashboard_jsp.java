package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Admindashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!-- ===================================================== -->\r\n");
      out.write("<!-- ADMIN DASHBOARD PAGE -->\r\n");
      out.write("<!-- File: adminDashboard.jsp -->\r\n");
      out.write("<!-- ===================================================== -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <title>CampusConnect • Admin Dashboard</title>\r\n");
      out.write("\r\n");
      out.write("    <!-- Bootstrap & Icons -->\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css\" rel=\"stylesheet\"/>\r\n");
      out.write("\r\n");
      out.write("    <style>\r\n");
      out.write("        body{\r\n");
      out.write("            background:#0a0c0e;\r\n");
      out.write("            color:white;\r\n");
      out.write("            font-family:Poppins,sans-serif;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .admin-wrapper{\r\n");
      out.write("            padding:2rem;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .admin-card{\r\n");
      out.write("            background:rgba(0,0,0,0.85);\r\n");
      out.write("            padding:2rem;\r\n");
      out.write("            border-radius:20px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* NAVIGATION */\r\n");
      out.write("        .nav-pills-custom{\r\n");
      out.write("            background:rgba(255,255,255,0.05);\r\n");
      out.write("            border-radius:40px;\r\n");
      out.write("            padding:0.4rem;\r\n");
      out.write("            display:inline-flex;\r\n");
      out.write("            flex-wrap:wrap;\r\n");
      out.write("            gap:0.3rem;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .nav-pill-item{\r\n");
      out.write("            padding:0.6rem 1.2rem;\r\n");
      out.write("            border-radius:30px;\r\n");
      out.write("            color:#ddd;\r\n");
      out.write("            text-decoration:none;\r\n");
      out.write("            transition:0.2s;\r\n");
      out.write("            font-size:0.95rem;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .nav-pill-item:hover{\r\n");
      out.write("            background:rgba(255,255,255,0.15);\r\n");
      out.write("            color:white;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .stats-box{\r\n");
      out.write("            background:rgba(20,20,30,0.8);\r\n");
      out.write("            border-radius:16px;\r\n");
      out.write("            padding:1.5rem;\r\n");
      out.write("            text-align:center;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .quick-box{\r\n");
      out.write("            background:rgba(20,20,30,0.8);\r\n");
      out.write("            border-radius:16px;\r\n");
      out.write("            padding:1.5rem;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

Integer countTotalRequests = (Integer)session.getAttribute("countTotalRequests");
Integer countPending = (Integer)session.getAttribute("countPending");
Integer countCompleted = (Integer)session.getAttribute("countCompleted");

      out.write("\r\n");
      out.write("<div class=\"admin-wrapper\">\r\n");
      out.write("<div class=\"admin-card\">\r\n");
      out.write("\r\n");
      out.write("    <!-- HEADER -->\r\n");
      out.write("    <div class=\"d-flex justify-content-between mb-4\">\r\n");
      out.write("        <h2>🎓 Admin Dashboard</h2>\r\n");
      out.write("        <span class=\"badge bg-secondary\">Admin</span>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!-- ================= NAVIGATION LINKS ================= -->\r\n");
      out.write("    <div class=\"mb-5\">\r\n");
      out.write("\r\n");
      out.write("        <div class=\"nav-pills-custom\">\r\n");
      out.write("\r\n");
      out.write("            <!-- Dashboard -->\r\n");
      out.write("            <a href=\"Admindashboard.jsp\" class=\"nav-pill-item\">\r\n");
      out.write("                <i class=\"fa-solid fa-chart-pie\"></i> Dashboard\r\n");
      out.write("            </a>\r\n");
      out.write("\r\n");
      out.write("            <!-- View Requests -->\r\n");
      out.write("            <a href=\"viewRequestsServelt.do\" class=\"nav-pill-item\">\r\n");
      out.write("                <i class=\"fa-regular fa-file-lines\"></i> View Requests\r\n");
      out.write("            </a>\r\n");
      out.write("\r\n");
      out.write("            <!-- UPDATE REQUEST STATUS -->\r\n");
      out.write("            <a href=\"updateRequest.jsp\" class=\"nav-pill-item\">\r\n");
      out.write("                <i class=\"fa-solid fa-pen-to-square\"></i> Update Requests\r\n");
      out.write("            </a>\r\n");
      out.write("\r\n");
      out.write("            <!-- CREATE EVENTS -->\r\n");
      out.write("            <a href=\"createEvent.jsp\" class=\"nav-pill-item\">\r\n");
      out.write("                <i class=\"fa-solid fa-calendar-days\"></i> Create Event\r\n");
      out.write("            </a>\r\n");
      out.write("\r\n");
      out.write("            <!-- Announcements -->\r\n");
      out.write("            <a href=\"createAnnouncement.jsp\" class=\"nav-pill-item\">\r\n");
      out.write("                <i class=\"fa-solid fa-bullhorn\"></i> Create Announcement\r\n");
      out.write("            </a>\r\n");
      out.write("\r\n");
      out.write("            <!-- Feedback -->\r\n");
      out.write("            <a href=\"ViewFeedbacksServlet.do\" class=\"nav-pill-item\">\r\n");
      out.write("                <i class=\"fa-regular fa-message\"></i> View Feedbacks\r\n");
      out.write("            </a>\r\n");
      out.write("\r\n");
      out.write("            <!-- Logout -->\r\n");
      out.write("            <a href=\"login.jsp\" class=\"nav-pill-item\">\r\n");
      out.write("                <i class=\"fa-solid fa-right-from-bracket\"></i> Logout\r\n");
      out.write("            </a>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- ==================================================== -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!-- DASHBOARD STATS -->\r\n");
      out.write("    <div class=\"row g-3 mb-5\">\r\n");
      out.write("\r\n");
      out.write("        <div class=\"col-md-4\">\r\n");
      out.write("            <div class=\"stats-box\">\r\n");
      out.write("                <h2>");
      out.print(countTotalRequests);
      out.write("</h2>\r\n");
      out.write("                <small>Total Requests</small>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"col-md-4\">\r\n");
      out.write("            <div class=\"stats-box\">\r\n");
      out.write("                <h2>");
      out.print(countPending);
      out.write("</h2>\r\n");
      out.write("                <small>Pending Requests</small>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"col-md-4\">\r\n");
      out.write("            <div class=\"stats-box\">\r\n");
      out.write("                <h2><h2>");
      out.print(countCompleted);
      out.write("</h2></h2>\r\n");
      out.write("                <small>Resolved Requests</small>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!-- QUICK ACTIONS -->\r\n");
      out.write("    <div class=\"quick-box\">\r\n");
      out.write("\r\n");
      out.write("        <h4 class=\"mb-3\">⚡ Quick Actions</h4>\r\n");
      out.write("\r\n");
      out.write("        <a href=\"updateRequest.jsp\" class=\"btn btn-outline-light mb-2 w-100\">\r\n");
      out.write("            📝 Update Student Request Status\r\n");
      out.write("        </a>\r\n");
      out.write("\r\n");
      out.write("        <a href=\"createEvent.jsp\" class=\"btn btn-outline-light mb-2 w-100\">\r\n");
      out.write("            📅 Create New Event\r\n");
      out.write("        </a>\r\n");
      out.write("\r\n");
      out.write("        <a href=\"createAnnouncement.jsp\" class=\"btn btn-outline-light w-100\">\r\n");
      out.write("            📢 Publish Announcement\r\n");
      out.write("        </a>\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
