package fr.univlyon1.m1if.m1if03.servlets;


import fr.univlyon1.m1if.m1if03.classes.GestionPassages;
import fr.univlyon1.m1if.m1if03.classes.Passage;
import fr.univlyon1.m1if.m1if03.classes.Salle;
import fr.univlyon1.m1if.m1if03.classes.User;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "UserServelet", urlPatterns = "/presence")
public class UtilisateurNormal extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GestionPassages passages = (GestionPassages) request.getServletContext().getAttribute("passages");
        HashMap<String, Salle> salles = (HashMap<String, Salle>) request.getServletContext().getAttribute("salles");

        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("user");

        //Traitement des données fournies par saisie_passage
        String nomSalle = request.getParameter("nom");
        if (request.getParameter("nomSalle") != null) {
            request.setAttribute("passagesAffiches", passages.getPassagesByUserAndSalle((User) session.getAttribute("user"), new Salle(request.getParameter("nomSalle"))));
        }else {
            request.setAttribute("passagesAffiches", passages.getPassagesByUser((User) session.getAttribute("user")));
        }
        Salle salle;
        if (salles.get(nomSalle) == null) {
            salle = new Salle(nomSalle);
            salles.put(nomSalle, salle);
        } else
            salle = salles.get(nomSalle);

        List<Passage> passagesAffiches = (List<Passage>) request.getAttribute("passagesAffiches");
        if (request.getParameter("entree") != null) {
            Passage p = new Passage(user, salle, new Date());
            passages.add(p);
            passagesAffiches.add(p); // On rajoute le passage dans passageAffiches qui arrive par un attribut de requête
            salle.incPresent();
        } else if (request.getParameter("sortie") != null) {
            List<Passage> passTemp = passages.getPassagesByUserAndSalle(user, salle);
            for (Passage p : passTemp) { // On mémorise une sortie de tous les passages existants et sans sortie
                if (p.getSortie() == null) {
                    p.setSortie(new Date());
                    salle.decPresent();
                }
            }
        }

        request.getRequestDispatcher("interface.jsp").include(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GestionPassages passages = (GestionPassages) request.getServletContext().getAttribute("passages");
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("user");

        if (request.getParameter("nomSalle") != null) {
            request.setAttribute("passagesAffiches", passages.getPassagesByUserAndSalle(user, new Salle(request.getParameter("nomSalle"))));
        }else {
            request.setAttribute("passagesAffiches", passages.getPassagesByUser(user));
        }

        request.getRequestDispatcher("interface.jsp").include(request,response);
    }

}
