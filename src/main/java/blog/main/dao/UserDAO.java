package blog.main.dao;

import java.util.List;

import blog.main.entity.Role;
import blog.main.entity.User;

public interface UserDAO {

	public List<User> getUserList();

	public void deleteUser(String username);

	public User getUserByUsername(String username);

	public void saveUser(User user);

	public void enableUser(String username);

	public List<Role> getRoles();

}
