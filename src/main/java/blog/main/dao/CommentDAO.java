package blog.main.dao;

import java.util.List;
import java.util.Set;

import blog.main.entity.Comment;

public interface CommentDAO {

	public void saveComment(Comment comment);

	public List<Comment> getCommentList();

	public void delete(int id);

	public void enableComment(int id);

	public List<Comment> commentListByPost(int postId);

}
