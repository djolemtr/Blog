package blog.main.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Entity(name = "messages")
@Table
public class Message implements Comparable<Message> {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column
	@NotNull
	@NotEmpty(message = "Required")
	private String name;
	@Column
	@NotNull
	@NotEmpty(message = "Required")
	private String email;
	@Column
	private Date date;
	@Column
	@NotNull
	@NotEmpty(message = "Required")
	private String content;
	@Column
	private boolean isSeen;

	public Message(int id, @NotNull @NotEmpty(message = "Required") String name,
			@NotNull @NotEmpty(message = "Required") String email, Date date, boolean isSeen) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.date = date;
		this.isSeen = isSeen;
	}

	public Message() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public int compareTo(Message otherMessage) {
		return otherMessage.getDate().compareTo(this.date);
	}

	public boolean setSeen() {
		return isSeen;
	}

	public void setSeen(boolean isSeen) {
		this.isSeen = isSeen;
	}

}
