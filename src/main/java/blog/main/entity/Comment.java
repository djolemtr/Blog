package blog.main.entity;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.transaction.annotation.Transactional;

@Entity(name = "comments")
@Table
public class Comment {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column
	private String content;
	@JoinColumn(name = "id_post")
	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH })
	private Post post;
	@Column
	private Date date;
	@Column
	private boolean enabled;
	@Column
	private String name;
	@Column
	private String email;
	@Transient
	private String formattedDate;

	public Comment(int id, String content, Post post, String name, String email, Date date) {
		super();
		this.id = id;
		this.content = content;
		this.post = post;
		this.name = name;
		this.email = email;
		this.date = date;
	}

	public Comment() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	@Override
	public String toString() {

		return "(" + id + ") - " + content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
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

	public String getFormattedDate() {
		return formattedDate;
	}

	public void setFormattedDate(String formattedDate) {
		this.formattedDate = formattedDate;
	}

}
