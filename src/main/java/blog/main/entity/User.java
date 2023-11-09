package blog.main.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity(name = "users")
@Table

public class User {
	@Id
	@Column
	private String username;
	@Column
	private String name;
	@Column
	private String surname;
	@Column
	private String image;
	@Column
	private String phone;
	@Column
	private String password;
	@Column
	private boolean enabled;
	@JoinTable(name = "authorities", joinColumns = @JoinColumn(name = "username"), inverseJoinColumns = @JoinColumn(name = "authority"))
	@ManyToMany(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, fetch = FetchType.EAGER)
	private Set<Role> authorities;
	@Column
	private String email;
	@Transient
	private String urlTitle;

	public User() {
	}

	public User(String username, String name, String surname, String image, String phone, String password,
			boolean enabled, String email) {
		super();
		this.username = username;
		this.name = name;
		this.surname = surname;
		this.image = image;
		this.phone = phone;
		this.password = password;
		this.enabled = enabled;
		this.email = email;

	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {

		return username;
	}

	public boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Set<Role> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Set<Role> authorities) {
		this.authorities = authorities;
	}

	public String makeURLTitle() {

		return name.toLowerCase().replaceAll("[^a-zA-Z0-9\\s]", "").replaceAll("\\s+", "-").trim().replaceAll("-+",
				"-");

	}

	public String getUrlTitle() {
		return urlTitle;
	}

	public void setUrlTitle(String urlTitle) {
		this.urlTitle = urlTitle;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
