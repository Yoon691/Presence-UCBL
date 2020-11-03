package fr.univlyon1.m1if.m1if03.filtres;

import fr.univlyon1.m1if.m1if03.classes.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class AuthentificationFilter implements Filter {

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
        String loginPath = request.getRequestURI().substring( request.getContextPath().length() );

        boolean userConnected = session.getAttribute("user") != null;

        if (userConnected || loginPath.startsWith( "/index.jsp" )) {
            chain.doFilter(req, resp);
        } else {
            String login = request.getParameter("login");
            if (login != null && !login.equals("")) {
                User user = new User(login);
                user.setNom(request.getParameter("nom"));
                user.setAdmin(request.getParameter("admin") != null && request.getParameter("admin").equals("on"));
                session.setAttribute("user", user);
                session.setAttribute("admin", user.getAdmin());

                request.getRequestDispatcher("interface.jsp").forward(request, response);

            } else {
                response.sendRedirect( "index.jsp" );
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }
    public void destroy() {
    }

}
