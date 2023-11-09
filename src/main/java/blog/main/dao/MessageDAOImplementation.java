package blog.main.dao;

import java.util.Collections;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import blog.main.entity.Message;
import blog.main.entity.Tag;

@Repository
public class MessageDAOImplementation implements MessageDAO {
	@Autowired
	private org.hibernate.SessionFactory sessionFactory;

	@Transactional
	@Override
	public void saveMessage(Message message) {

		Session session = sessionFactory.getCurrentSession();

		session.saveOrUpdate(message);
	}

	@Transactional
	@Override
	public List<Message> getMessageList() {

		Session session = sessionFactory.getCurrentSession();

		Query<Message> query = session.createQuery("from messages", Message.class);

		List<Message> list = query.getResultList();

		Collections.sort(list);

		return list;
	}

	@Transactional
	@Override
	public void delete(int id) {

		Session session = sessionFactory.getCurrentSession();

		Message m = session.get(Message.class, id);

		session.delete(m);
	}

	@Transactional
	@Override
	public long getUnseenMessagesCount() {

		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("select count(*) from messages m where m.isSeen=0");

		return (long) query.uniqueResult();
	}

	@Transactional
	@Override
	public Message getMessage(int id) {

		Session session = sessionFactory.getCurrentSession();

		return session.get(Message.class, id);

	}

	@Transactional
	@Override
	public void setAllMessagesSeen() {

		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("update messages set isSeen = :isSeen");

		query.setParameter("isSeen", true);

		query.executeUpdate();

	}

}
