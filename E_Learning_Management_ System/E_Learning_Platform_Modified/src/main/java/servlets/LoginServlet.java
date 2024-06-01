package servlets;

import beans.UserBean;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"}, loadOnStartup = 1)
public class LoginServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        UserBean userBean = (UserBean) session.getAttribute("user");
        if (userBean == null) {
            userBean = new UserBean();
            session.setAttribute("user", userBean);
        }
        
        userBean.setEmail(email);
        userBean.setPassword(password);

        String nextPage = userBean.authenticateUser();
        if(nextPage.equals("TopicServlet"))
        response.sendRedirect(nextPage);
        else
        	response.sendRedirect(nextPage+".jsp");
        	
    }
}
