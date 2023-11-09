package blog.main.dao;

import java.util.Comparator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import blog.main.entity.Slide;

@Repository
public class SlidesDAOImplementation implements SlidesDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	@Override
	public List<Slide> getSlideList() {
		Session session = sessionFactory.getCurrentSession();

		Query<Slide> query = session.createQuery("from slides", Slide.class);

		List<Slide> slideList = query.getResultList();

		slideList.sort(Comparator.comparingInt(Slide::getOrder));

		return slideList;
	}

	@Transactional
	@Override
	public void deleteSlide(int id) {
		Session session = sessionFactory.getCurrentSession();

		Slide slide = session.get(Slide.class, id);

		session.delete(slide);

	}

	@Transactional
	@Override
	public void saveSlide(Slide slide) {
		Session session = sessionFactory.getCurrentSession();

		session.saveOrUpdate(slide);
	}

	@Transactional
	@Override
	public void enableSlide(int id) {
		Session session = sessionFactory.getCurrentSession();

		Slide slide = session.get(Slide.class, id);

		slide.setEnabled(!slide.getEnabled());

		session.saveOrUpdate(slide);
	}

	@Transactional
	@Override
	public Slide getSlide(int id) {

		Session session = sessionFactory.getCurrentSession();

		Slide slide = session.get(Slide.class, id);

		return slide;
	}

	@Transactional
	@Override
	public List<Slide> getEnabledSlides() {

		Session session = sessionFactory.getCurrentSession();

		Query<Slide> query = session.createQuery("from slides", Slide.class);

		List<Slide> slideList = query.getResultList();

		slideList.removeIf(slide -> slide.getEnabled() == false);

		slideList.sort(Comparator.comparingInt(Slide::getOrder));

		return slideList;

	}

}
