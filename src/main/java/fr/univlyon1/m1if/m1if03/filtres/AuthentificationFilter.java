package fr.univlyon1.m1if.m1if03.filtres;

import fr.univlyon1.m1if.m1if03.classes.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;


public class AuthentificationFilter implements Filter {

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        @SuppressWarnings("unchecked")
        HashMap<String, User> users = (HashMap<String, User>) request.getServletContext().getAttribute("users");
        String loginPath= request.getRequestURI().substring( request.getContextPath().length() );
        if ( loginPath.startsWith( "/static" ) ) {
            chain.doFilter( request, response );
            return;
        }


        HttpSession session = request.getSession();

        boolean userConnected = session.getAttribute("user") != null;
        if (userConnected) {
            chain.doFilter(req, resp);
        } else {
            String login = request.getParameter("login");
            if (login != null && !login.equals("")) {
                User user = new User(login);
                user.setNom(request.getParameter("nom"));
                user.setAdmin(request.getParameter("admin") != null && request.getParameter("admin").equals("on"));
                session.setAttribute("user", user);
                session.setAttribute("admin", user.getAdmin());
                if (!users.containsValue(user)) {
                    users.put(user.getLogin(), user);
                }
                request.setAttribute("users", users);
                response.sendRedirect(request.getContextPath() + "/presence");

            } else {
//
                request.getRequestDispatcher("/Init").forward(request, response);
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }
    public void destroy() {
    }

}
