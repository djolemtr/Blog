package blog.main.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "slides")
@Table
public class Slide {

	@Id
	@Column
	private int id;
	@Column(name = "`order`")
	private int order;
	@Column
	private String image;
	@Column
	private String title;
	@Column
	private String button_name;
	@Column
	private String button_url;
	@Column
	private boolean enabled;

	public Slide(int order, String image, String title, String button_name, String button_url, boolean enabled) {
		super();
		this.order = order;
		this.image = image;
		this.title = title;
		this.button_name = button_name;
		this.button_url = button_url;
		this.enabled = enabled;
	}

	public Slide() {

	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getButton_name() {
		return button_name;
	}

	public void setButton_name(String button_name) {
		this.button_name = button_name;
	}

	public String getButton_url() {
		return button_url;
	}

	public void setButton_url(String button_url) {
		this.button_url = button_url;
	}

	public boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
