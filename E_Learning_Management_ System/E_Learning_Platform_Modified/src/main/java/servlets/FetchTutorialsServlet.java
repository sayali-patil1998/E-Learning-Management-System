package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TutorialDao;
import pojos.Tutorial;

@WebServlet(urlPatterns = {"/FetchTutorialsServlet"}, loadOnStartup = 1)
public class FetchTutorialsServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int topicId = Integer.parseInt(request.getParameter("topicId"));
		TutorialDao tutorialDao = new TutorialDao();

		try {
			List<Tutorial> tutorials = tutorialDao.getAllTutorialByTopic(topicId);
			request.getSession().setAttribute("tutorials", tutorials);
			request.getRequestDispatcher("show_tutorials.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
}
