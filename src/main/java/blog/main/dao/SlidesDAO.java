package blog.main.dao;

import java.util.List;

import blog.main.entity.Slide;

public interface SlidesDAO {

	public List<Slide> getSlideList();

	public void deleteSlide(int id);

	public void saveSlide(Slide slide);

	public void enableSlide(int id);

	public Slide getSlide(int id);

	public List<Slide> getEnabledSlides();

}
