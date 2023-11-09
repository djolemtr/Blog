package blog.main.entity;

import java.util.List;

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
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

@Entity(name = "tags")
@Table
public class Tag {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column
	@Size(min = 3, max = 20, message = "min 3, max 20 characters")
	private String name;
	@ManyToMany(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, fetch = FetchType.EAGER)
	@JoinTable(name = "post_tag", joinColumns = @JoinColumn(name = "id_tag"), inverseJoinColumns = @JoinColumn(name = "id_post"))
	private List<Post> posts;
	@Transient
	private String urlTitle;

	public Tag() {
	}

	public Tag(String name) {
		super();
		this.name = name;
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

	@Override
	public String toString() {

		return "(" + id + ") - " + name;
	}

	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {

		this.posts = posts;
	}

	public String getUrlTitle() {
		return urlTitle;
	}

	public void setUrlTitle(String urlTitle) {
		this.urlTitle = urlTitle;
	}

	public String makeURLTitle() {

		return this.name.toLowerCase().replaceAll("[^a-zA-Z0-9\\s]", "").replaceAll("\\s+", "-").trim().replaceAll("-+",
				"-");

	}

}
