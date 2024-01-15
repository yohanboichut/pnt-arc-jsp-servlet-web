package controleur;

import exceptions.EmailMalFormeException;
import exceptions.MauvaisIdentifiantsException;
import exceptions.PseudoManquantException;
import facade.FacadeImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modele.Utilisateur;

import java.io.IOException;

public class Controleur extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        String[] path = req.getRequestURI().split("/");
        FacadeImpl facade = (FacadeImpl) req.getServletContext().getAttribute("facade");
        String cleNavigation = path[path.length-1];

        String destination= "/WEB-INF/pages/notfound.jsp";


        switch (cleNavigation) {
            case "home": {
                destination = "/WEB-INF/pages/home.jsp";
                break;
            }

            case "gotoinscription": {
                destination = "/WEB-INF/pages/inscription.jsp";
                break;
            }

            case "deconnexion": {
                req.getSession().invalidate();
                destination = "/WEB-INF/pages/home.jsp";
                break;
            }
        }

        req.getServletContext()
                .getRequestDispatcher(destination)
                .forward(req,resp);
    }



    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {
                String[] path = req.getRequestURI().split("/");
                FacadeImpl facade = (FacadeImpl) req.getServletContext().getAttribute("facade");
                String cleNavigation = path[path.length-1];

                String destination= "/WEB-INF/pages/notfound.jsp";
                switch (cleNavigation){
                    case "connexion": {
                        String email = req.getParameter("email");
                        String cleAuthentification = req.getParameter("cleAuthentification");
                        try {
                            Utilisateur utilisateur = facade.getUtilisateur(email, cleAuthentification);
                            req.getSession().setAttribute("utilisateur",utilisateur);
                            destination = "/WEB-INF/pages/menu.jsp";


                        } catch (MauvaisIdentifiantsException e) {
                            req.setAttribute("erreur","Identifiants incorrects");
                            destination = "/WEB-INF/pages/home.jsp";
                        }

                        break;
                    }



                    case "inscription": {
                        String email = req.getParameter("email");
                        String pseudo = req.getParameter("pseudo");
                        String type = req.getParameter("type");
                        try {

                            String cleAuthentification = type.toUpperCase().equals("ETUDIANT")?facade.inscription(email, pseudo):facade.inscriptionProfesseur(email, pseudo);
                            req.setAttribute("cleAuthentification",cleAuthentification);
                            destination = "/WEB-INF/pages/confirmationinscription.jsp";
                        } catch (EmailMalFormeException e) {
                            String erreur="Email mal forme";
                            req.setAttribute("erreur",erreur);
                            destination = "/WEB-INF/pages/inscription.jsp";
                        } catch (PseudoManquantException e) {
                            String erreur="Pseudo manquant";
                            req.setAttribute("erreur",erreur);
                            destination = "/WEB-INF/pages/inscription.jsp";
                        }
                    }
                }

        req.getServletContext()
                .getRequestDispatcher(destination)
                .forward(req,resp);
            }
}
