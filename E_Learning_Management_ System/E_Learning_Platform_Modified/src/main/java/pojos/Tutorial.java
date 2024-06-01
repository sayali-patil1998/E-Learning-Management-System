package pojos;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity // Map this to existing table "tutorials"
@Table(name = "tutorials")
public class Tutorial extends BaseEntity {
	@Column(name = "name", length = 50)
	private String tutorialName;
	@Column(length = 0)
	private String author;
	@Column(name = "publish_date")
	private LocalDate publishDate;
	private int visits;
	private String contents;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "topic_id")
	private Topic currentTopic;

	public Tutorial() {
	}

	public Tutorial(String tutorialName, String author, LocalDate publishDate, int visits, Topic currentTopic,
			String contents) {
		super();
		this.tutorialName = tutorialName;
		this.author = author;
		this.publishDate = publishDate;
		this.visits = visits;
		this.contents = contents;
		this.currentTopic = currentTopic;
	}

	public String getTutorialName() {
		return tutorialName;
	}

	public void setTutorialName(String tutorialName) {
		this.tutorialName = tutorialName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public LocalDate getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(LocalDate publishDate) {
		this.publishDate = publishDate;
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

	public Topic getCurrentTopic() {
		return currentTopic;
	}

	public void setCurrentTopic(Topic currentTopic) {
		this.currentTopic = currentTopic;
	}

	@Override
	public String toString() {
		return "Tutorial [tutorialName=" + tutorialName + ", author=" + author + ", publishDate=" + publishDate
				+ ", visits=" + visits + ", contents=" + contents + "]";
	}

}
