package tk.xwlj666.util;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 123 on 2016/1/16.
 */
public class IPutil {
    public String getRemortIP(HttpServletRequest request) {
        if (request.getHeader("x-forwarded-for") == null) {
            return request.getRemoteAddr();
        }
        return request.getHeader("x-forwarded-for");
    }
}
