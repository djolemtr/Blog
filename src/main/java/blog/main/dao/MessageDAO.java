package blog.main.dao;

import java.util.List;

import blog.main.entity.Message;

public interface MessageDAO {

	public List<Message> getMessageList();

	public void delete(int id);

	public void saveMessage(Message message);

	public long getUnseenMessagesCount();

	public Message getMessage(int id);

	public void setAllMessagesSeen();

}
