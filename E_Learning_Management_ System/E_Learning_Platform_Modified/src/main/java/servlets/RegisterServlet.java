package servlets;

import beans.UserBean;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"}, loadOnStartup = 1)
public class RegisterServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String regDate = request.getParameter("regDate");

        HttpSession session = request.getSession();
        UserBean userBean = new UserBean();
        
        userBean.setName(name);
        userBean.setEmail(email);
        userBean.setPassword(password);
        userBean.setRegDate(regDate);
        userBean.setRegAmount(500); // Fixed registration amount as specified

        String nextPage = userBean.registerUser();
        response.sendRedirect(nextPage);
    }
}
