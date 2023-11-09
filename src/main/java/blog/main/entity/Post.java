package blog.main.entity;

import java.sql.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Autowired;

import blog.main.dao.CommentDAO;

import javax.persistence.Transient;

@Entity(name = "posts")
@Table
public class Post implements Comparable<Post> {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column
	private Date date;
	@Column
	@Size(min = 20, max = 255, message = "minimum 20, maximum 255 characters")
	private String title;
	@Column
	@Size(min = 50, max = 500, message = "minimum 50, maximum 500 characters")
	private String description;
	@Column
	private String image;
	@JoinColumn(name = "id_category")
	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH })
	private Category category;
	@JoinTable(name = "post_tag", joinColumns = @JoinColumn(name = "id_post"), inverseJoinColumns = @JoinColumn(name = "id_tag"))
	@ManyToMany(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, fetch = FetchType.EAGER)
	private List<Tag> tags;
	@JoinColumn(name = "id_author")
	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH })
	private User user;
	@Column
	private int views;
	@Column
	private int comments;
	@Column
	private boolean enabled;
	@Column
	private boolean important;
	@Column
	private String content;
	@Column
	private String formattedDate;
	@Transient
	private String urlTitle;
	@Transient
	private String timePassed;

	public Post(int id, Date date,
			@Size(min = 20, max = 255, message = "minimum 20, maximum 255 characters") String title,
			@Size(min = 50, max = 500, message = "minimum 50, maximum 500 characters") String description, String image,
			Category category, List<Tag> tags, User user, int views, int commentCount, boolean enabled,
			boolean important) {
		super();
		this.id = id;
		this.date = date;
		this.title = title;
		this.description = description;
		this.image = image;
		this.category = category;
		this.tags = tags;
		this.user = user;
		this.views = views;
		this.comments = commentCount;
		this.enabled = enabled;
		this.important = important;
		this.urlTitle = this.makeURLTitle(title);

	}

	public Post() {
		super();

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getComments() {
		return comments;
	}

	public void setComments(int comments) {

		this.comments = comments;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public boolean isImportant() {
		return important;
	}

	public void setImportant(boolean important) {
		this.important = important;
	}

	@Override
	public String toString() {

		return "(" + id + ") - " + title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public int compareTo(Post otherPost) {
		return otherPost.getDate().compareTo(this.date);
	}

	public String getFormattedDate() {
		return formattedDate;
	}

	public void setFormattedDate(String formattedDate) {
		this.formattedDate = formattedDate;
	}

	public String getUrlTitle() {
		return urlTitle;
	}

	public void setUrlTitle(String urlTitle) {
		this.urlTitle = urlTitle;
	}

	public String makeURLTitle(String title) {

		return title.toLowerCase().replaceAll("[^a-zA-Z0-9\\s]", "").replaceAll("\\s+", "-").trim().replaceAll("-+",
				"-");

	}

	public String getTimePassed() {
		return timePassed;
	}

	public void setTimePassed(String timePassed) {
		this.timePassed = timePassed;
	}

}
