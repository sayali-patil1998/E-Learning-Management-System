package beans;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import dao.TopicDao;
import dao.TutorialDao;
import pojos.Topic;
import pojos.Tutorial;

/*
 </select> Tutorial Title : <input type="text" name="tutName"><br>
				Tutorial Author: <input type="text" name="tutAuthor"><br>
				Published Date : <input type="date" name="pubDate"><br>
				Visits : <input type="number" name="visits"><br>
				Contents :
				<textarea name="contents"></textarea>
 */
public class TopicTutorialBean {
	// Properties
	private int topicId;
	private String title;
	private String tutName;
	private String tutAuthor;
	private String pubDate; // This conversion, WC can't perform. So prog has to parse this.
	private int visits;
	private String contents;
	private String message;

	private TopicDao topicDao;
	private TutorialDao tutDao;

	public TopicTutorialBean() throws Exception {
		System.out.println("In ctor of " + getClass().getName());
		topicDao = new TopicDao();
		tutDao = new TutorialDao();
	}

	public TopicDao getTopicDao() {
		return topicDao;
	}

	public TutorialDao getTutDao() {
		return tutDao;
	}
	// Setters and Getters

	public int getTopicId() {
		return topicId;
	}

	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}

	public String getTutName() {
		return tutName;
	}

	public void setTutName(String tutName) {
		this.tutName = tutName;
	}

	public String getTutAuthor() {
		return tutAuthor;
	}

	public void setTutAuthor(String tutAuthor) {
		this.tutAuthor = tutAuthor;
	}

	public String getPubDate() {
		return pubDate;
	}

	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}

	public int getVisits() {
		return visits;
	}

	public void setVisits(int visits) {
		this.visits = visits;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getMessage() {
		return message;
	}

	// Add B.L method to fetch all topics.
	public List<Topic> getTopics() throws SQLException {
		return topicDao.getAllTopics();
	}

	// Add B.L method to validate and add new tutorial.
	public String validateInsertTutorialDetails(Topic newTopic) throws SQLException {
		System.out.println("B.L method: validation + insert " + getClass().getName());
		LocalDate publishDate = LocalDate.parse(pubDate);
		// API of java.time.Period
		int periodInMonths = Period.between(publishDate, LocalDate.now()).getMonths();
		if (contents.length() >= 255 || periodInMonths > 48) {
			// Validation failed.
			message = "Adding new tutorial failed: Invalid date or content length.";
			return "tut_form";
		}
		// validation successful
		
		message = tutDao
				.addNewTutorial(new Tutorial(tutName, tutAuthor, publishDate, 0, newTopic, contents));
		if (message.contains("failed"))
			return "tut_form";
		return message;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
