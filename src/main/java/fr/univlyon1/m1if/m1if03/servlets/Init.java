package fr.univlyon1.m1if.m1if03.servlets;

import fr.univlyon1.m1if.m1if03.classes.GestionPassages;
import fr.univlyon1.m1if.m1if03.classes.Salle;
import fr.univlyon1.m1if.m1if03.classes.User;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "Init", urlPatterns = "/Init", loadOnStartup = 1)

public class Init extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("index.jsp");
    }


    public void init(ServletConfig servletConfig) {
        ServletContext context = servletConfig.getServletContext();
        context.setAttribute("salles", new HashMap<String, Salle>());
        context.setAttribute("users", new HashMap<String, User>());
        context.setAttribute("passages", new GestionPassages());
    }


    public ServletContext getServletContext()  {
        return super.getServletContext();
    }


}

