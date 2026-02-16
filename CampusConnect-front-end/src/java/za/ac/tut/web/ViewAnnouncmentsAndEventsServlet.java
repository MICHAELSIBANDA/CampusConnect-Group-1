/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.bl.AnnouncmentFacadeLocal;
import za.ac.tut.bl.EventFacadeLocal;
import za.ac.tut.model.entity.Announcment;
import za.ac.tut.model.entity.Event;

/**
 *
 * @author Lwazy
 */
public class ViewAnnouncmentsAndEventsServlet extends HttpServlet {

    @EJB
    private AnnouncmentFacadeLocal afl;

    @EJB
    private EventFacadeLocal efl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Announcment> announcments = afl.findAll();
        List<Event> events = efl.findAll();

        // Sort Announcements by publishedDate descending
        announcments.sort((a1, a2) -> a2.getPublishedDate().compareTo(a1.getPublishedDate()));

        // Sort Events by startDateAndTime descending
        events.sort((e1, e2) -> e2.getStartDateAndTime().compareTo(e1.getStartDateAndTime()));

        request.setAttribute("announcments", announcments);
        request.setAttribute("events", events);

        RequestDispatcher disp = request.getRequestDispatcher("viewAnnouncmentsAndEvents.jsp");
        disp.forward(request, response);
    }

}
