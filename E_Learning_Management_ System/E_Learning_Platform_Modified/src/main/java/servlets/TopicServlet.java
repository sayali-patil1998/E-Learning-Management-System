package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.TopicTutorialBean;
import pojos.Topic;

@WebServlet(name = "TopicServlet", urlPatterns = { "/TopicServlet" }, loadOnStartup = 1)
public class TopicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		TopicTutorialBean topicBean = (TopicTutorialBean) session.getAttribute("topic_list");
		if (topicBean == null) {
			try {
				topicBean = new TopicTutorialBean();
				session.setAttribute("topic_list", topicBean);
			} catch (Exception e) {
				request.setAttribute("error", "Error initializing the topic bean");
				request.getRequestDispatcher("/error.jsp").forward(request, response);
				return;
			}
		}
		try {
			List<Topic> topics = topicBean.getTopics();
//			request.setAttribute("topics", topics);
			request.getServletContext().setAttribute("topics", topics);
			request.getRequestDispatcher("/topics.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("error", "Error loading topics: " + e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
}
