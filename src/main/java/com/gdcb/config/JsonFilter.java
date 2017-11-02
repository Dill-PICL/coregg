package com.gdcb.config;

import javax.servlet.*;
import java.io.IOException;

/**
 * @author Chenguang He
 * @email gaoyike@gmail.com
 */
public class JsonFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
