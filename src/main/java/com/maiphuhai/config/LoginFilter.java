package com.maiphuhai.config;
        
import com.maiphuhai.model.User;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class LoginFilter implements Filter {
    @Override public void init(FilterConfig fc) {}

    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest  r = (HttpServletRequest) req;
        HttpServletResponse s = (HttpServletResponse) res;

        String ctx = r.getContextPath();
        String uri = r.getRequestURI();

        boolean needAuth =
              uri.startsWith(ctx + "/dashboard-")
           || uri.startsWith(ctx + "/admin");

        boolean isPublic =
              uri.startsWith(ctx + "/login")
           || uri.startsWith(ctx + "/signup")
           || uri.startsWith(ctx + "/resources/");

        User u = (User) r.getSession().getAttribute("USER");
        if (u == null) u = (User) r.getSession().getAttribute("ADMIN");

        System.out.println("[FILTER] uri=" + uri + " need=" + needAuth + " user=" + u);

        if (needAuth && !isPublic && u == null) {
            s.sendRedirect(ctx + "/login");
            return;
        }
        chain.doFilter(req, res);
    }
    @Override public void destroy() {}
}
