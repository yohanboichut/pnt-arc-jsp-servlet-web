package listeners;

import facade.FacadeImpl;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

public class ListenerApplication implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        sce.getServletContext().setAttribute("facade", new FacadeImpl());
    }
}
