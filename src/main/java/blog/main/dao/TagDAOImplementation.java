package blog.main.dao;

import java.util.ArrayList;
import java.util.Comparator;
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
import blog.main.entity.Tag;

@Repository
public class TagDAOImplementation implements TagDAO {

	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private PostDAO postDAO;
	private DateAndTime dateAndTime = new DateAndTime();

	@Transactional
	@Override
	public List<Tag> getTagList() {

		Session session = sessionFactory.getCurrentSession();

		Query<Tag> query = session.createQuery("from tags", Tag.class);

		List<Tag> tagList = query.getResultList();

		for (Tag t : tagList) {

			t.setUrlTitle(t.makeURLTitle());

		}

		tagList.sort(Comparator.comparingInt(tag -> ((Tag) tag).getPosts().size()).reversed());

		return tagList;
	}

	@Transactional
	@Override
	public void saveTag(Tag tag) {
		Session session = sessionFactory.getCurrentSession();

		session.saveOrUpdate(tag);
	}

	@Transactional
	@Override
	public Tag getTag(int id) {
		Session session = sessionFactory.getCurrentSession();

		Tag tag = session.get(Tag.class, id);

		return tag;
	}

	@Transactional
	@Override
	public void deleteTag(int id) {
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("delete from tags where id=:id");

		query.setParameter("id", id);

		query.executeUpdate();
	}

	@Transactional
	@Override
	public List<Tag> getTagsById(List<Integer> ids) {

		Session session = sessionFactory.getCurrentSession();

		Query<Tag> query = session.createQuery("select t from tags t where t.id IN (:ids)");
		query.setParameter("ids", ids);

		List<Tag> tags = query.getResultList();

		return tags;
	}

	@Transactional
	@Override
	public List<Post> getPostsByTagId(int tagId) {
		Session session = sessionFactory.getCurrentSession();

		Query<Tag> query = session.createQuery("from tags where id = :tagId", Tag.class);
		query.setParameter("tagId", tagId);
		Tag tag = query.uniqueResult();

		List<Post> list = tag.getPosts();

		List<Post> postList = new ArrayList<>();

		for (Post p : list) {

			if (p.isEnabled()) {

				p.setUrlTitle(p.makeURLTitle(p.getTitle()));
				p.getUser().setUrlTitle(p.getUser().makeURLTitle());
				p.getCategory().setUrlTitle(p.getCategory().makeURLTitle());
				p.setTimePassed(dateAndTime.timePassed(p.getDate()));

				postList.add(p);

			}

		}

		return tag != null ? postList : new ArrayList<>();
	}

	@Transactional
	@Override
	public List<Tag> getTagsByPostID(int postId) {

		Session session = sessionFactory.getCurrentSession();

		Post post = postDAO.getPost(postId);

		List<Tag> tagList = post.getTags();

		return tagList;

	}

}