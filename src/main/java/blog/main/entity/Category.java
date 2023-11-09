package blog.main.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity(name = "categories")
@Table
public class Category implements Comparable<Category> {
	@Id
	@Column
	private int id;
	@Column
	private String name;
	@Column
	private int priority;
	@Column
	private String description;
	@Transient
	private long count;
	@Transient
	private String urlTitle;

	public Category(int id, String name, int priority, String description) {
		super();
		this.id = id;
		this.name = name;
		this.priority = priority;
		this.description = description;
	}

	public Category() {
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

	@Override
	public String toString() {

		return name;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public String getUrlTitle() {
		return urlTitle;
	}

	public void setUrlTitle(String urlTitle) {
		this.urlTitle = urlTitle;
	}

	public String makeURLTitle() {

		return name.toLowerCase().replaceAll("[^a-zA-Z0-9\\s]", "").replaceAll("\\s+", "-").trim().replaceAll("-+",
				"-");

	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	@Override
	public int compareTo(Category otherCategory) {

		return Integer.compare(this.priority, otherCategory.getPriority());
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
