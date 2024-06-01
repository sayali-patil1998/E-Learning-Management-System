package pojos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
// Map this to existing tables "topics"
@Table(name = "topics")
public class Topic extends BaseEntity {
	@Column(name = "name", length = 30)
	private String topicName;

	public Topic() {
	}

	public Topic(String title) {
		topicName = title;
	}

	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}

	@Override
	public String toString() {
		return "Topic ID= " + getId() + " topicName=" + topicName;
	}
}
