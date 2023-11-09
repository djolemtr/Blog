package blog.main.backend;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.AbstractSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.Set;

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
import blog.main.entity.Role;
import blog.main.entity.Slide;
import blog.main.entity.Tag;
import blog.main.entity.User;

@Controller
@RequestMapping("/administration")
public class AdministrationController {

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private ChangePasswordValidator changePasswordValidator;
	@Autowired
	private SlidesDAO slideDAO;
	@Autowired
	private PostDAO postDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private TagDAO tagDAO;
	@Autowired
	private CommentDAO commentDAO;
	@Autowired
	private MessageDAO messageDAO;

	private DateAndTime dateAndTime;

	// USERS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	@RequestMapping("/user-list")
	public String getUserListPage(Model model) {

		model.addAttribute("userList", userDAO.getUserList());
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "user-list";

	}

	@RequestMapping("/user-delete")
	public String deleteUser(@RequestParam String username) {

		userDAO.deleteUser(username);

		return "redirect:/administration/user-list";
	}

	@RequestMapping("/user-form")

	public String getUserForm(Model model) {

		model.addAttribute("user", new User());
		model.addAttribute("roles", userDAO.getRoles());
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "user-form";

	}

	@RequestMapping("/user-form-action")

	public String userFormAction(@ModelAttribute User user) {

		String passwordEncode = new BCryptPasswordEncoder().encode(user.getPassword());

		user.setEnabled(true);

		Set<Role> roles = new HashSet<>();

		Role role = new Role("ROLE_user");

		roles.add(role);

		user.setAuthorities(roles);

		user.setPassword("{bcrypt}" + passwordEncode);

		userDAO.saveUser(user);

		return "redirect:/administration/user-list";

	}

	@RequestMapping("/user-enable")
	public String enableUser(@RequestParam String username) {

		userDAO.enableUser(username);

		return "redirect:/administration/user-list";
	}

	@RequestMapping("/user-save")
	public String getUserForm(@ModelAttribute User user) {

		userDAO.saveUser(user);

		return "redirect:/administration/post-list";

	}

	@RequestMapping("/user-edit-profile")
	public String getUserEditProfile(Principal principal, Model model) {

		User user = userDAO.getUserByUsername(principal.getName());

		model.addAttribute("user", user);
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "user-edit-profile";
	}

	@RequestMapping("/user-edit")
	public String getUserEdit(@ModelAttribute User user) {

		userDAO.saveUser(user);

		return "redirect:/administration/user-list";

	}

	@RequestMapping("/user-change-password")
	public String getChangePassword(Model model) {

		model.addAttribute("changePassword", new ChangePassword());
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "user-change-password";

	}

	@RequestMapping("/user-change-password-action")
	public String getChangePasswordAction(@ModelAttribute ChangePassword changePassword, Principal principal,
			Model model, BindingResult bindingResult) {

		User user = userDAO.getUserByUsername(principal.getName());

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		changePasswordValidator.validate(changePassword, bindingResult, user, encoder);

		if (bindingResult.hasErrors()) {

			return "user-change-password";

		} else {
			user.setPassword("{bcrypt}" + encoder.encode(changePassword.getNewPassword()));

			userDAO.saveUser(user);

		}

		return "redirect:/administration/post-list";

	}

	// SLIDES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	@RequestMapping("/slide-list")
	public String getSlideListPage(Model model) {

		model.addAttribute("slideList", slideDAO.getSlideList());
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "slide-list";

	}

	@RequestMapping("/slide-delete")
	public String deleteSlide(@RequestParam int id) {

		slideDAO.deleteSlide(id);

		return "redirect:/administration/slide-list";
	}

	@RequestMapping("/slide-form")

	public String getSlideForm(Model model) {

		model.addAttribute("slide", new Slide());
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "slide-form";

	}

	@RequestMapping("/slide-form-action")

	public String slideAction(@ModelAttribute Slide slide) {

		List<Slide> slides = slideDAO.getSlideList();

		if (slides.isEmpty()) {

			slide.setOrder(1);

		} else {

			slide.setOrder(slides.size() + 1);
		}

		slide.setEnabled(true);

		slideDAO.saveSlide(slide);

		return "redirect:/administration/slide-list";

	}

	@RequestMapping("/slide-enable")
	public String enableSlide(@RequestParam int id) {

		slideDAO.enableSlide(id);

		return "redirect:/administration/slide-list";
	}

	@RequestMapping("/slide-save")
	public String getSlideForm(@ModelAttribute Slide slide) {

		slideDAO.saveSlide(slide);

		return "redirect:/administration/slide-list";

	}

	@RequestMapping("/slide-update")
	public String slideUpdate(@RequestParam int id, Model model) {

		Slide slide = slideDAO.getSlide(id);

		model.addAttribute("slide", slide);
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "slide-update";

	}

	// POSTS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	@RequestMapping("/user-post-list")
	public String getUserPostListPage(Principal principal, Model model) {

		List<Post> userPosts = postDAO.getPostListByUserName(principal.getName());

		model.addAttribute("postList", userPosts);
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "user-post-list";

	}

	@RequestMapping("/post-list")
	public String getPostListPage(Principal principal, Model model) {

		model.addAttribute("postList", postDAO.getPostList());
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());
		model.addAttribute("categoryList", categoryDAO.getCategoryList());
		model.addAttribute("authorList", userDAO.getUserList());

		return "post-list";

	}

	@RequestMapping("/post-search")
	public String searchPosts(Principal principal, Model model,
			@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "author", required = false) String author,
			@RequestParam(value = "enabled", required = false) String enabled) {

		List<Post> postList = postDAO.searchPostsForAdmin(title, category, author, enabled);

		model.addAttribute("postList", postList);
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());
		model.addAttribute("categoryList", categoryDAO.getCategoryList());
		model.addAttribute("authorList", userDAO.getUserList());

		return "post-search-results";

	}

	@RequestMapping("/post-form")
	public String getProductForm(Model model) {

		Post post = new Post();

		List<Category> categoryList = categoryDAO.getCategoryList();
		List<Tag> tagList = tagDAO.getTagList();

		model.addAttribute("post", post);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("tagList", tagList);
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "post-form";
	}

	@RequestMapping("/post-save")
	public String savePost(@Valid @ModelAttribute Post post, BindingResult result, Model model, Principal principal) {

		if (result.hasErrors()) {

			List<Category> categoryList = categoryDAO.getCategoryList();
			List<Tag> tagList = tagDAO.getTagList();

			model.addAttribute("categoryList", categoryList);
			model.addAttribute("tagList", tagList);

			return "user-post-list";
		}

		Category category = categoryDAO.getCategory(post.getCategory().getId());

		List<Integer> ids = new ArrayList<Integer>();

		for (Tag tag : post.getTags()) {
			ids.add(Integer.parseInt(tag.getName()));
		}

		List<Tag> tags = tagDAO.getTagsById(ids);

		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

		post.setDate(sqlDate);

		this.dateAndTime = new DateAndTime();

		String formattedDate = dateAndTime.formatDate(sqlDate);
		post.setFormattedDate(formattedDate);

		// title for URL
		String urlTitle = post.makeURLTitle(post.getTitle());

		post.setUrlTitle(urlTitle);
		//

		User user = userDAO.getUserByUsername(principal.getName());

		post.setUser(user);
		post.setEnabled(true);
		post.setCategory(category);
		post.setTags(tags);
		postDAO.savePost(post);

		return "redirect:/administration/user-post-list";
	}

	@RequestMapping("/post-delete")

	public String deletePost(@RequestParam int id) {

		postDAO.delete(id);
		return "redirect:/administration/user-post-list";

	}

	@RequestMapping("/post-enable")
	public String enablePost(@RequestParam int id) {

		postDAO.enablePost(id);

		return "redirect:/administration/user-post-list";
	}

	@RequestMapping("/post-mark-important")
	public String markImportant(@RequestParam int id) {

		postDAO.markImportant(id);

		return "redirect:/administration/user-post-list";
	}

	@RequestMapping("/post-update")
	public String postUpdate(@RequestParam int id, Model model) {

		Post post = postDAO.getPostWithTags(id);
		List<Category> categoryList = categoryDAO.getCategoryList();
		List<Tag> tagList = tagDAO.getTagList();

		model.addAttribute("post", post);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("tagList", tagList);
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "post-update";
	}

	@RequestMapping("/post-update-action")
	public String postUpdateAction(@Valid @ModelAttribute Post post, BindingResult result, Model model) {

		Post existingPost = postDAO.getPost(post.getId());

		post.setUser(existingPost.getUser());
		post.setDate(existingPost.getDate());
		post.setImportant(true);
		post.setEnabled(true);
		post.setViews(existingPost.getViews());
		post.setComments(existingPost.getComments());
		post.setFormattedDate(existingPost.getFormattedDate());

		Category category = categoryDAO.getCategory(post.getCategory().getId());

		User user = userDAO.getUserByUsername(post.getUser().getUsername());

		List<Integer> ids = new ArrayList<Integer>();

		for (Tag tag : post.getTags()) {
			ids.add(Integer.parseInt(tag.getName()));
		}

		List<Tag> tags = tagDAO.getTagsById(ids);

		post.setUser(user);
		post.setCategory(category);
		post.setTags(tags);
		postDAO.savePost(post);

		return "redirect:/administration/user-post-list";
	}

	// CATEGORY!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	@RequestMapping("/category-list")
	public String getCategoryList(Model model) {

		List<Category> list = categoryDAO.getCategoryList();

		model.addAttribute("categoryList", list);
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "category-list";
	}

	@RequestMapping("/category-form")
	public String getCategoryForm(Model model) {

		Category category = new Category();

		model.addAttribute("category", category);
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "category-form";
	}

	@RequestMapping("/category-form-update")
	public String getCategoryUpdateForm(@RequestParam int id, Model model) {

		Category category = categoryDAO.getCategory(id);

		model.addAttribute("category", category);

		return "category-form";
	}

	@RequestMapping("/category-save")
	public String saveCategory(@Valid @ModelAttribute Category category, BindingResult result) {

		if (result.hasErrors()) {

			return "category-form";
		}

		categoryDAO.saveCategory(category);

		return "redirect:/administration/category-list";
	}

	@RequestMapping("/category-delete")
	public String deleteCategory(@RequestParam int id) {

		categoryDAO.deleteCategory(id);

		return "redirect:/administration/category-list";
	}

	// TAG!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	@RequestMapping("/tag-list")
	public String getTagList(Model model) {

		List<Tag> tagList = tagDAO.getTagList();

		model.addAttribute("tagList", tagList);
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "tag-list";
	}

	@RequestMapping("/tag-form")
	public String getTagForm(Model model) {

		Tag tag = new Tag();

		model.addAttribute("tag", tag);
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "tag-form";
	}

	@RequestMapping("/tag-save")
	public String saveTag(@Valid @ModelAttribute Tag tag, BindingResult result) {

		if (result.hasErrors()) {
			return "tag-form";
		}

		tagDAO.saveTag(tag);

		return "redirect:/administration/tag-list";
	}

	@RequestMapping("/tag-delete")
	public String deleteTag(@RequestParam int id) {
		tagDAO.deleteTag(id);
		return "redirect:/administration/tag-list";
	}

	@RequestMapping("/tag-form-update")
	public String getTagUpdateForm(@RequestParam int id, Model model) {

		Tag tag = tagDAO.getTag(id);
		model.addAttribute("tag", tag);
		return "tag-form";
	}

	// COMMENTS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	@RequestMapping("/comment-list")
	public String getCommentList(Model model) {

		List<Comment> commentList = commentDAO.getCommentList();

		model.addAttribute("commentList", commentList);
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "comment-list";
	}

	@RequestMapping("/comment-search")
	public String searchComments(Model model, @RequestParam(value = "id", required = false) String id) {

		List<Comment> commentList;

		if (id.isEmpty())
			commentList = commentDAO.getCommentList();
		else {
			commentList = commentDAO.commentListByPost(Integer.parseInt(id));

		}

		model.addAttribute("commentList", commentList);
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "comment-search-results";
	}

	@RequestMapping("/comment-delete")
	public String deleteComment(@RequestParam int id) {

		commentDAO.delete(id);

		return "redirect:/administration/comment-list";
	}

	@RequestMapping("/comment-enable")
	public String enableComment(@RequestParam int id) {

		commentDAO.enableComment(id);

		return "redirect:/administration/comment-list";
	}

	// MESSAGES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	@RequestMapping("/message-list")
	public String getMessageList(Model model) {

		List<Message> messageList = messageDAO.getMessageList();

		messageDAO.setAllMessagesSeen();
		model.addAttribute("messageList", messageList);
		model.addAttribute("messagesCount", messageDAO.getUnseenMessagesCount());

		return "message-list";
	}

	@RequestMapping("/message-delete")
	public String deleteMessage(@RequestParam int id) {

		messageDAO.delete(id);

		return "redirect:/administration/message-list";
	}

	@RequestMapping("/message-seen")
	public String getMarkMessageSeen(@RequestParam int id) {

		Message m = messageDAO.getMessage(id);

		m.setSeen(true);

		messageDAO.saveMessage(m);

		return "redirect: reservation-list";

	}

}
