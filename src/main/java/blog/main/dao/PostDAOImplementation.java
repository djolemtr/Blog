package blog.main.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import blog.main.entity.DateAndTime;
import blog.main.entity.Post;

@Repository
public class PostDAOImplementation implements PostDAO {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private CommentDAO commentDAO;

	private DateAndTime dateAndTime = new DateAndTime();

	@Transactional
	@Override
	public Post getPost(int id) {

		Session session = sessionFactory.getCurrentSession();

		Post post = session.get(Post.class, id);

		return post;
	}

	@Transactional
	@Override
	public List<Post> getPostList() {

		Session session = sessionFactory.getCurrentSession();

		Query<Post> query = session.createQuery("FROM posts WHERE enabled = :enabled", Post.class);
		query.setParameter("enabled", true);

		List<Post> postList = query.getResultList();

		Collections.sort(postList);

		for (Post p : postList) {
			p.getCategory().setUrlTitle(p.getCategory().makeURLTitle());
			p.setUrlTitle(p.makeURLTitle(p.getTitle()));
			p.getUser().setUrlTitle(p.getUser().makeURLTitle());
			p.setComments(commentDAO.commentListByPost(p.getId()).size());
			p.setTimePassed(dateAndTime.timePassed(p.getDate()));

		}

		return postList;

	}

	@Transactional
	@Override
	public List<Post> getPostListWithPages(int page, int pageSize) {
		Session session = sessionFactory.getCurrentSession();

		Query<Post> query = session.createQuery("from posts order by date desc", Post.class);
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);

		List<Post> list = query.getResultList();

		List<Post> postList = new ArrayList<>();

		for (Post p : list) {

			if (p.isEnabled()) {
				p.setUrlTitle(p.makeURLTitle(p.getTitle()));
				p.getCategory().setUrlTitle(p.getCategory().makeURLTitle());
				p.getUser().setUrlTitle(p.getUser().makeURLTitle());
				p.setComments(commentDAO.commentListByPost(p.getId()).size());
				p.setTimePassed(dateAndTime.timePassed(p.getDate()));

				postList.add(p);

			}

		}

		return postList;
	}

	@Transactional
	@Override
	public void savePost(Post post) {
		Session session = sessionFactory.getCurrentSession();

		session.saveOrUpdate(post);

	}

	@Transactional
	@Override
	public void delete(int id) {

		Session session = sessionFactory.getCurrentSession();

		Post p = session.get(Post.class, id);

		session.delete(p);

	}

	@Transactional
	@Override
	public void enablePost(int id) {

		Session session = sessionFactory.getCurrentSession();

		Post post = session.get(Post.class, id);

		post.setEnabled(!post.isEnabled());

		session.saveOrUpdate(post);

	}

	@Transactional
	@Override
	public void markImportant(int id) {

		Session session = sessionFactory.getCurrentSession();

		Post post = session.get(Post.class, id);

		post.setImportant(!post.isImportant());

		session.saveOrUpdate(post);

	}

	@Transactional
	@Override
	public Post getPostWithTags(int id) {
		Session session = sessionFactory.getCurrentSession();

		Post p = session.get(Post.class, id);

		Hibernate.initialize(p.getTags());

		return p;

	}

	@Transactional
	@Override
	public List<Post> getImportantPosts() {

		Session session = sessionFactory.getCurrentSession();

		Query<Post> query = session.createQuery("from posts", Post.class);

		List<Post> postList = query.getResultList();

		postList.removeIf(post -> post.isImportant() == false);

		Collections.sort(postList);

		List<Post> list = new ArrayList<>();

		for (int n = 0; n < 3; n++) {

			if (postList.get(n).isEnabled()) {
				list.add(postList.get(n));
			}

		}

		for (Post p : list) {

			p.setUrlTitle(p.makeURLTitle(p.getTitle()));
			p.getUser().setUrlTitle(p.getUser().makeURLTitle());
			p.getCategory().setUrlTitle(p.getCategory().makeURLTitle());
			p.setTimePassed(dateAndTime.timePassed(p.getDate()));

		}

		return list;

	}

	@Transactional
	@Override
	public List<Post> getLatestTwelvePosts() {

		List<Post> postList = this.getPostList();

		Collections.sort(postList);

		if (postList.size() > 12) {

			for (int i = 12; i <= (postList.size() - 1); i++) {

				postList.remove(i);

			}

		}

		for (Post p : postList) {

			p.setUrlTitle(p.makeURLTitle(p.getTitle()));
			p.getUser().setUrlTitle(p.getUser().makeURLTitle());
			p.getCategory().setUrlTitle(p.getCategory().makeURLTitle());

		}

		return postList;
	}

	@Transactional
	@Override
	public int totalPostNumber() {

		Session session = sessionFactory.getCurrentSession();

		Query<Post> query = session.createQuery("from posts", Post.class);

		List<Post> postList = query.getResultList();

		int number = postList.size();

		return number;

	}

	@Transactional
	@Override
	public List<Post> searchPosts(String searchTerm) {
		Session session = sessionFactory.getCurrentSession();

		Query<Post> query = session.createQuery(
				"from posts where (title like :searchTerm or description like :searchTerm or content like :searchTerm) and enabled = true",
				Post.class);

		query.setParameter("searchTerm", "%" + searchTerm + "%");

		List<Post> searchResults = query.getResultList();

		for (Post p : searchResults) {

			p.setUrlTitle(p.makeURLTitle(p.getTitle()));
			p.getUser().setUrlTitle(p.getUser().makeURLTitle());
			p.getCategory().setUrlTitle(p.getCategory().makeURLTitle());
			p.setTimePassed(dateAndTime.timePassed(p.getDate()));

		}

		return searchResults;
	}

	@Transactional
	@Override
	public List<Post> getPostListByCategory(int id) {

		Session session = sessionFactory.getCurrentSession();

		Query<Post> query = session.createQuery("from posts post where post.category.id = :id and enabled = true");

		query.setParameter("id", id);

		List<Post> postList = query.getResultList();

		for (Post p : postList) {

			p.setUrlTitle(p.makeURLTitle(p.getTitle()));
			p.getUser().setUrlTitle(p.getUser().makeURLTitle());
			p.getCategory().setUrlTitle(p.getCategory().makeURLTitle());
			p.setTimePassed(dateAndTime.timePassed(p.getDate()));

		}

		return postList;

	}

	@Transactional
	@Override
	public Post getPostByURL(String urlTitle) {

		Session session = sessionFactory.getCurrentSession();

		Query<Post> query = session.createQuery("from posts", Post.class);

		List<Post> postList = query.getResultList();

		for (Post p : postList) {

			p.setUrlTitle(p.makeURLTitle(p.getTitle()));

		}

		Post post = new Post();

		for (Post p : postList) {

			if (p.getUrlTitle().equals(urlTitle)) {

				post = p;

			}
		}

		return post;

	}

	@Transactional
	@Override
	public Post previousPost(int id) {

		List<Post> postList = this.getPostList();

		for (int i = 0; i < postList.size(); i++) {
			if (postList.get(i).getId() == id) {

				if (i < postList.size() - 1) {

					int index = postList.indexOf(postList.get(i)) + 1;

					Post previousPost = this.getPost(postList.get(index).getId());

					previousPost.setUrlTitle(previousPost.makeURLTitle(previousPost.getTitle()));

					return previousPost;

				}

				break;
			}
		}

		return new Post();
	}

	@Transactional
	@Override
	public Post nextPost(int id) {

		List<Post> postList = this.getPostList();

		for (int i = 0; i < postList.size(); i++) {
			if (postList.get(i).getId() == id) {

				if (i > 0) {

					int index = postList.indexOf(postList.get(i)) - 1;

					Post nextPost = this.getPost(postList.get(index).getId());

					nextPost.setUrlTitle(nextPost.makeURLTitle(nextPost.getTitle()));

					return nextPost;

				}

				break;
			}
		}

		return new Post();
	}

	@Transactional
	@Override
	public List<Post> getPostListByAuthorURL(String url) {

		List<Post> list = this.getPostList();

		List<Post> listForReturning = new ArrayList<>();

		for (Post p : list) {

			if (p.getUser().getUrlTitle().equals(url)) {
				listForReturning.add(p);
			}

		}

		return listForReturning;
	}

	@Transactional
	@Override
	public List<Post> getPostListByUserName(String username) {

		Session session = sessionFactory.getCurrentSession();

		Query<Post> query = session.createQuery("from posts", Post.class);

		List<Post> list = query.getResultList();

		List<Post> listForReturning = new ArrayList<>();

		for (Post p : list) {

			if (p.getUser().getUsername().equals(username)) {
				listForReturning.add(p);
			}

		}

		Collections.sort(listForReturning);

		return listForReturning;

	}

	@Transactional
	@Override
	public List<Post> getPostListForLatestWidget() {
	    Session session = sessionFactory.getCurrentSession();

	    Calendar calendar = Calendar.getInstance();
	    calendar.add(Calendar.DAY_OF_MONTH, -30);

	    Date thirtyDaysAgo = calendar.getTime();

	    String hql = "FROM posts p WHERE p.enabled = :enabled " +
	            "AND p.date >= :thirtyDaysAgo " +
	            "ORDER BY p.views DESC";

	    Query<Post> query = session.createQuery(hql, Post.class);
	    query.setParameter("enabled", true);
	    query.setParameter("thirtyDaysAgo", thirtyDaysAgo);

	    List<Post> postList = query.getResultList();

	    for (Post p : postList) {
	        p.getCategory().setUrlTitle(p.getCategory().makeURLTitle());
	        p.setUrlTitle(p.makeURLTitle(p.getTitle()));
	        p.getUser().setUrlTitle(p.getUser().makeURLTitle());
	        p.setComments(commentDAO.commentListByPost(p.getId()).size());
	        p.setTimePassed(dateAndTime.timePassed(p.getDate()));
	    }

	    return postList;
	}

	@Transactional
	@Override
	public List<Post> searchPostsForAdmin(String title, String category, String author, String enabled) {
		Session session = sessionFactory.getCurrentSession();

		String queryString = "FROM posts p WHERE ";
		List<String> conditions = new ArrayList<>();

		// making query
		if (title != null && !title.isEmpty()) {
			conditions.add("p.title LIKE :title");
		}

		if (category != null && !category.isEmpty()) {
			conditions.add("p.category.name LIKE :category");
		}

		if (author != null && !author.isEmpty()) {
			conditions.add("p.user.name LIKE :author");
		}

		if (!enabled.isEmpty()) {
			conditions.add("p.enabled = :enabled");
		}

		// combining
		if (conditions.isEmpty()) {
			queryString += "1 = 1";
		} else {
			queryString += String.join(" AND ", conditions);
		}

		Query<Post> query = session.createQuery(queryString, Post.class);

		// setting parameters
		if (title != null && !title.isEmpty()) {
			query.setParameter("title", "%" + title + "%");
		}

		if (category != null && !category.isEmpty()) {
			query.setParameter("category", "%" + category + "%");
		}

		if (author != null && !author.isEmpty()) {
			query.setParameter("author", "%" + author + "%");
		}

		if (enabled.equals("true")) {
			query.setParameter("enabled", true);
		}

		if (!enabled.isEmpty()) {
			query.setParameter("enabled", Boolean.parseBoolean(enabled));
		}

		return query.getResultList();
	}

}
