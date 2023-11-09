package blog.main.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import blog.main.entity.Comment;
import blog.main.entity.DateAndTime;
import blog.main.entity.Message;
import blog.main.entity.Post;
import javassist.expr.NewArray;

@Repository
public class CommentDAOImplementation implements CommentDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private DateAndTime dateAndTime = new DateAndTime();

	@Transactional
	@Override
	public void saveComment(Comment comment) {

		Session session = sessionFactory.getCurrentSession();

		session.save(comment);
	}

	@Transactional
	@Override
	public List<Comment> getCommentList() {

		Session session = sessionFactory.getCurrentSession();

		Query<Comment> query = session.createQuery("from comments", Comment.class);

		List<Comment> commentList = query.getResultList();

		return commentList;
	}

	@Transactional
	@Override
	public void delete(int id) {

		Session session = sessionFactory.getCurrentSession();

		Comment c = session.get(Comment.class, id);

		session.delete(c);
	}

	@Transactional
	@Override
	public void enableComment(int id) {

		Session session = sessionFactory.getCurrentSession();

		Comment c = session.get(Comment.class, id);

		c.setEnabled(!c.isEnabled());

		session.saveOrUpdate(c);

	}

	@Transactional
	@Override
	public List<Comment> commentListByPost(int postId) {

		Session session = sessionFactory.getCurrentSession();
		Query<Comment> query = session.createQuery("from comments c where c.post.id = :postId", Comment.class);
		query.setParameter("postId", postId);

		List<Comment> result = query.getResultList();

		List<Comment> list = new ArrayList<>();

		for (Comment c : result) {

			if (c.isEnabled()) {

				c.setFormattedDate(dateAndTime.formatDate(c.getDate()));
				list.add(c);
			}

		}
		return list;
	}

}
