package com.uef.mvcenvironment;

import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;

/**
 * Global Jakarta REST configuration.
 * Đăng ký đường gốc "/resources" cho toàn bộ endpoint JAX-RS.
 */
@ApplicationPath("/resources")
public class JakartaRestConfiguration extends Application {
    // Không cần thêm mã; kế thừa cấu hình mặc định.
}
