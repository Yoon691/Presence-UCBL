package fr.univlyon1.m1if.m1if03.servlets;

import fr.univlyon1.m1if.m1if03.classes.GestionPassages;
import fr.univlyon1.m1if.m1if03.classes.Salle;
import fr.univlyon1.m1if.m1if03.classes.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@WebServlet(name = "UtilisateurAdmin", urlPatterns = "/admin")
public class UtilisateurAdmin extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap<String, Salle> salles = (HashMap<String, Salle>) request.getServletContext().getAttribute("salles");
        try {
            if (request.getParameter("nomSalle") != null && request.getParameter("capacite") != null) {
                Salle salle = salles.get(request.getParameter("nomSalle"));
                salle.setCapacite(Integer.parseInt(request.getParameter("capacite")));

            }
        } catch (NumberFormatException e) {
            PrintWriter out = response.getWriter();
            out.println("Erreur : Valeur incorrect");

        }
        request.setAttribute("salles", salles);
        request.getRequestDispatcher("interface_admin.jsp").include(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GestionPassages passages = (GestionPassages) request.getServletContext().getAttribute("passages");
        HashMap<String, Salle> salles = (HashMap<String, Salle>) request.getServletContext().getAttribute("salles");
        if (request.getParameter("nomSalle") != null) {
            if (request.getParameter("login") != null)
                request.setAttribute("passagesAffiches", passages.getPassagesByUserAndSalle(new User(request.getParameter("login")), new Salle(request.getParameter("nomSalle"))));
            else if (request.getParameter("dateEntree") != null && request.getParameter("dateSortie") != null) {
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss Z yyyy", new Locale("us"));
                    Date dateEntree = sdf.parse(request.getParameter("dateEntree"));
                    Date dateSortie = sdf.parse(request.getParameter("dateSortie"));
                    request.setAttribute("passagesAffiches", passages.getPassagesBySalleAndDates(new Salle(request.getParameter("nomSalle")), dateEntree, dateSortie));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            } else
                request.setAttribute("passagesAffiches", passages.getPassagesBySalle(new Salle(request.getParameter("nomSalle"))));
        } else if (request.getParameter("login") != null)
            request.setAttribute("passagesAffiches", passages.getPassagesByUser(new User(request.getParameter("login"))));
        else
            request.setAttribute("passagesAffiches", passages.getAllPassages());

        request.setAttribute("salles", salles);
        request.getRequestDispatcher("interface_admin.jsp").include(request,response);
    }
}
