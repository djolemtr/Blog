package blog.main.dao;

import java.util.List;

import blog.main.entity.Post;
import blog.main.entity.Slide;

public interface PostDAO {

	public Post getPost(int id);

	public List<Post> getPostListWithPages(int page, int pageSize);

	public List<Post> getPostList();
	
	public List<Post> getPostListForLatestWidget();

	public Post getPostByURL(String urlTitle);

	public void savePost(Post post);

	public void delete(int id);

	public void enablePost(int id);

	public void markImportant(int id);

	public Post getPostWithTags(int id);

	public List<Post> getImportantPosts();

	public List<Post> getLatestTwelvePosts();

	public int totalPostNumber();

	public List<Post> searchPosts(String searchTerm);
	
	public List<Post> searchPostsForAdmin(String title, String category, String author, String enabled);

	public List<Post> getPostListByCategory(int id);

	public Post previousPost(int id);

	public Post nextPost(int id);

	public List<Post> getPostListByAuthorURL(String url);

	public List<Post> getPostListByUserName(String name);

}
