package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.TopicTutorialBean;
import dao.TopicDao;
import pojos.Topic;

@WebServlet(name = "AddTutorialServlet", urlPatterns = { "/AddTutorialServlet" }, loadOnStartup = 1)
public class AddTutorialServlet extends HttpServlet {
	private static final long serialVersionUID = 2013924491972596472L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
		
		
		String title = request.getParameter("subjects");
		System.out.println(title);
		String tutName = request.getParameter("tutName");
		String tutAuthor = request.getParameter("tutAuthor");
		LocalDate pubDate = LocalDate.parse(request.getParameter("pubDate"));
		String contents = request.getParameter("contents");
		
		TopicDao topicDao = new TopicDao();
		Topic newTopic=null;
		try {
			List<Topic> topicList = topicDao.getAllTopics();
			
			for (Topic topic : topicList) {
				if(topic.getTopicName().equals(title)) {
					newTopic = topic;
				}
			}
			
			
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		

		topicBean.setTitle(title);
		topicBean.setTutName(tutName);
		topicBean.setTutAuthor(tutAuthor);
		topicBean.setPubDate(pubDate.toString());
		topicBean.setContents(contents);

		try {
			String message = topicBean.validateInsertTutorialDetails(newTopic);
			request.setAttribute("message", message);

			if (message.contains("failed")) {
				request.setAttribute("title", title);
				request.setAttribute("tutName", tutName);
				request.setAttribute("tutAuthor", tutAuthor);
				request.setAttribute("pubDate", pubDate.toString());
				request.setAttribute("contents", contents);
			}

			// Redirect or forward based on your architecture choice
			
			request.getRequestDispatcher("/tut_form.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("error", "Error processing tutorial details: " + e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
}
