package com.maiphuhai.config;

import com.maiphuhai.model.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class RoleInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest req,
            HttpServletResponse res,
            Object handler) throws Exception {

        String ctx = req.getContextPath();          // "/TutorSchedulingSystem" hoặc ""
        String uri = req.getRequestURI();           // "/TutorSchedulingSystem/main/dashboard-tutor"
        String path = uri.substring(ctx.length());   // "/main/dashboard-tutor"
        boolean needAuth
                = uri.startsWith(ctx + "/dashboard-") // student / tutor
                || uri.startsWith(ctx + "/admin");

        User user = (User) req.getSession().getAttribute("USER");
        if (user == null) {
            user = (User) req.getSession().getAttribute("ADMIN");
        }
        if (user == null) {                          // chưa login
            res.sendRedirect(ctx + "/login");
            return false;
        }

        String role = user.getRole();                // tutor | student | admin

        /* ----- Quy tắc ----- */
        if (path.startsWith("/dashboard-tutor") && !"tutor".equals(role)
                || path.startsWith("/main/dashboard-tutor") && !"tutor".equals(role)) {
            res.sendRedirect(ctx + "/403");
            return false;
        }
        if (path.startsWith("/dashboard-student")
                || path.startsWith("/main/dashboard-student")) {
            if (!"student".equals(role)) {
                res.sendRedirect(ctx + "/403");
                return false;
            }
        }
        if (path.startsWith("/admin") && !"admin".equals(role)) {
            res.sendRedirect(ctx + "/403");
            return false;
        }
        return true;
    }

}
