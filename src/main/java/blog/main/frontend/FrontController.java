package blog.main.frontend;

import java.util.List;

import javax.validation.Valid;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import blog.main.dao.CategoryDAO;
import blog.main.dao.CommentDAO;
import blog.main.dao.MessageDAO;
import blog.main.dao.PostDAO;
import blog.main.dao.SlidesDAO;
import blog.main.dao.TagDAO;
import blog.main.dao.UserDAO;
import blog.main.entity.Category;
import blog.main.entity.Comment;
import blog.main.entity.DateAndTime;
import blog.main.entity.Message;
import blog.main.entity.Post;
import blog.main.entity.Tag;
import blog.main.entity.User;

@Controller
@RequestMapping("/")
public class FrontController {

	@Autowired
	private SlidesDAO slidesDAO;
	@Autowired
	private PostDAO postsDAO;
	@Autowired
	private MessageDAO messageDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private TagDAO tagDAO;
	@Autowired
	private CommentDAO commentDAO;
	@Autowired
	private UserDAO userDAO;

	private DateAndTime dateAndTime = new DateAndTime();;

	@RequestMapping({ "/", "/index" })
	public String getIndexPage(Model model) {

		model.addAttribute("slides", slidesDAO.getEnabledSlides());

		model.addAttribute("importantPosts", postsDAO.getImportantPosts());

		model.addAttribute("latestPosts", postsDAO.getLatestTwelvePosts());

		model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
		
		model.addAttribute("footerPosts", postsDAO.getPostList());

		return "front/index";
	}

	@RequestMapping("/contact")
	public String getContactPage(Model model) {

		Message message = new Message();

		model.addAttribute("message", message);
		model.addAttribute("postList", postsDAO.getPostListForLatestWidget());
		model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
		model.addAttribute("footerPosts", postsDAO.getPostList());

		return "front/contact";
	}

	@RequestMapping("/message-save")
	public String saveMessage(@Valid @ModelAttribute Message message, BindingResult result,
			RedirectAttributes redirectAttributes) {

		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

		message.setDate(sqlDate);
		message.setSeen(false);

		messageDAO.saveMessage(message);

		redirectAttributes.addFlashAttribute("messageSent", "Message sent successfully!");

		return "redirect:/contact";
	}

	@RequestMapping("/blog")
	public String getBlogPage(Model model, @RequestParam(defaultValue = "1") int page) {

		int pageSize = 12;

		List<Post> postListWithPages = postsDAO.getPostListWithPages(page, pageSize);
		int totalPosts = postsDAO.totalPostNumber();

		int totalPages = (int) Math.ceil((double) totalPosts / pageSize);
		
		List<Post> p = postsDAO.getPostListForLatestWidget();
		
		System.out.println("List:" + p);

		model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
		model.addAttribute("postList", postsDAO.getPostListForLatestWidget());
		model.addAttribute("postListWithPages", postListWithPages);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("tagList", tagDAO.getTagList());
		model.addAttribute("footerPosts", postsDAO.getPostList());

		return "front/blog";
	}

	@RequestMapping("/search-posts")
	public String searchPosts(Model model, @RequestParam String searchTerm) {
		List<Tag> tagList = tagDAO.getTagList();
		List<Category> categoryList = categoryDAO.getCategoriesForFilter();
		List<Post> searchResults = postsDAO.searchPosts(searchTerm);
		model.addAttribute("searchResults", searchResults);

		model.addAttribute("searchResults", searchResults);
		model.addAttribute("postList", postsDAO.getPostListForLatestWidget());
		model.addAttribute("tagList", tagList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("footerPosts", postsDAO.getPostList());

		return "front/search-results";
	}

	@RequestMapping("/category-page/{url}")
	public String getCategoryPage(@PathVariable String url, Model model) {

		List<Tag> tagList = tagDAO.getTagList();
		List<Category> categoryList = categoryDAO.getCategoriesForFilter();

		Category category = new Category();

		for (Category c : categoryList) {

			if (c.getUrlTitle().equals(url)) {

				category = c;

				break;
			}
		}

		List<Post> postList = postsDAO.getPostListByCategory(category.getId());

		// finding the selected category
		String categoryName = "";
		for (Category c : categoryList) {
			if (c.getId() == category.getId()) {
				categoryName = category.getName();
				break;
			}
		}

		model.addAttribute("tagList", tagList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("postList", postList);
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("postListForLatestWidget", postsDAO.getPostListForLatestWidget());
		model.addAttribute("footerPosts", postsDAO.getPostList());

		return "front/category-page";
	}

	@RequestMapping("/tag-page/{url}")
	public String getTagPage(@PathVariable String url, Model model) {

		List<Category> categoryList = categoryDAO.getCategoriesForFilter();
		List<Tag> tagList = tagDAO.getTagList();

		Tag tag = new Tag();

		for (Tag t : tagList) {

			if (t.getUrlTitle().equals(url)) {

				tag = t;

				break;
			}

		}

		List<Post> postList = tagDAO.getPostsByTagId(tag.getId());

		// finding the selected tag name
		String tagName = "";
		for (Tag t : tagList) {
			if (t.getId() == tag.getId()) {
				tagName = tag.getName();
				break;
			}
		}

		model.addAttribute("categoryList", categoryList);
		model.addAttribute("tagList", tagList);
		model.addAttribute("postList", postList);
		model.addAttribute("postListForLatestWidget", postsDAO.getPostListForLatestWidget());
		model.addAttribute("tagName", tagName);
		model.addAttribute("footerPosts", postsDAO.getPostList());

		return "front/tag-page";
	}

	@RequestMapping("/post/{urlTitle}")
	public String getPost(@PathVariable String urlTitle, Model model) {

		Post post = postsDAO.getPostByURL(urlTitle);
		post.getCategory().setUrlTitle(post.getCategory().makeURLTitle());
		post.getUser().setUrlTitle(post.getUser().makeURLTitle());
		List<Tag> postTags = post.getTags();

		for (Tag t : postTags) {

			t.setUrlTitle(t.makeURLTitle());

		}

		Comment comment = new Comment();

		post.setViews(post.getViews() + 1);

		post.setTimePassed(dateAndTime.timePassed(post.getDate()));

		postsDAO.savePost(post);

		int commentCount = commentDAO.commentListByPost(post.getId()).size();

		model.addAttribute("postTags", postTags);
		model.addAttribute("post", post);
		model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
		model.addAttribute("postList", postsDAO.getPostListForLatestWidget());
		model.addAttribute("tagList", tagDAO.getTagList());
		model.addAttribute("previousPost", postsDAO.previousPost(post.getId()));
		model.addAttribute("nextPost", postsDAO.nextPost(post.getId()));
		model.addAttribute("comments", commentDAO.commentListByPost(post.getId()));
		model.addAttribute("commentCount", commentCount);
		model.addAttribute("comment", comment);
		model.addAttribute("footerPosts", postsDAO.getPostList());

		return "front/post";
	}

	@RequestMapping("/post-comment")
	public String postComment(@RequestParam int id, @Valid @ModelAttribute Comment comment,
			RedirectAttributes redirectAttributes) {

		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

		comment.setDate(sqlDate);
		comment.setEnabled(true);

		Post post = postsDAO.getPost(id);

		comment.setPost(post);

		post.setUrlTitle(post.makeURLTitle(post.getTitle()));

		String title = post.getUrlTitle();

		commentDAO.saveComment(comment);

		redirectAttributes.addAttribute("urlTitle", title);

		return "redirect:/post/{urlTitle}";
	}

	@RequestMapping("/author/{urlTitle}")
	public String authorPage(@PathVariable String urlTitle, Model model) {

		List<User> userList = userDAO.getUserList();
		List<Post> postList = postsDAO.getPostListByAuthorURL(urlTitle);

		User user = new User();

		for (User u : userList) {

			if (u.getUrlTitle().equals(urlTitle)) {

				user = u;

				break;
			}
		}

		model.addAttribute("authorImage", user.getImage());
		model.addAttribute("authorName", user.getName());
		model.addAttribute("postList", postList);
		model.addAttribute("userList", userList);
		model.addAttribute("postListForLatestWidget", postsDAO.getPostListForLatestWidget());
		model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
		model.addAttribute("tagList", tagDAO.getTagList());
		model.addAttribute("footerPosts", postsDAO.getPostList());

		return "front/author";
	}

}