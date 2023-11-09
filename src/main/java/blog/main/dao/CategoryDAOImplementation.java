package blog.main.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import blog.main.entity.Category;

@Repository
public class CategoryDAOImplementation implements CategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	@Override
	public List<Category> getCategoryList() {

		Session session = sessionFactory.getCurrentSession();

		Query<Category> query = session.createQuery("from categories", Category.class);

		List<Category> categoryList = query.getResultList();

		Collections.sort(categoryList);

		return categoryList;
	}

	@Transactional
	@Override
	public void saveCategory(Category category) {
		Session session = sessionFactory.getCurrentSession();

		session.saveOrUpdate(category);

	}

	@Transactional
	@Override
	public Category getCategory(int id) {

		Session session = sessionFactory.getCurrentSession();

		Category category = session.get(Category.class, id);

		return category;
	}

	@Transactional
	@Override
	public void deleteCategory(int id) {
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("delete from categories where id=:id");

		query.setParameter("id", id);

		query.executeUpdate();
	}

	@Transactional
	@Override
	public List<Category> getCategoriesForFilter() {

		Session session = sessionFactory.getCurrentSession();

		Query<Category> query = session.createQuery("from categories");

		List<Category> list = query.getResultList();

		List<Category> categoryList = new ArrayList<>();

		for (Category cat : list) {

			if (!cat.getName().equals("Uncategorized")) {

				Query queryCount = session.createQuery(
						"select count (post.id) from posts post where post.category.id = :id and post.enabled = true");

				queryCount.setParameter("id", cat.getId());

				cat.setCount((long) queryCount.uniqueResult());

				cat.setUrlTitle(cat.makeURLTitle());

				categoryList.add(cat);

			}

		}

		Collections.sort(categoryList);

		return categoryList;
	}

	@Transactional
	@Override
	public Category getCategoryWithURL(String url) {

		List<Category> list = this.getCategoryList();

		for (Category c : list) {

			c.setUrlTitle(c.makeURLTitle());

			if (c.getUrlTitle().equals(url)) {
				return c;
			}

		}

		return null;
	}

}
