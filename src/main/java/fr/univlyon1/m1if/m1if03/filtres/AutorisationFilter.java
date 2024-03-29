package fr.univlyon1.m1if.m1if03.filtres;

import fr.univlyon1.m1if.m1if03.classes.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AutorisationFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        String loginPath = request.getRequestURI().substring( request.getContextPath().length() );
        if ( loginPath.startsWith( "/static" ) ) {
            chain.doFilter( request, response );
            return;
        }
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("user");

        if (user.getAdmin()) {
            chain.doFilter(req, resp);
        }else {
            response.sendRedirect(request.getContextPath() + "/presence");
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
