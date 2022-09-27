package stackjava.com.Entity;

public class message {
	private long RoomId;
	private long UserId;
	private long id;
	private String chat;

	public message() {}
	public message(long roomId, long userId, long id, String chat) {
		super();
		RoomId = roomId;
		UserId = userId;
		this.id = id;
		this.chat = chat;
	}

	public long getRoomId() {
		return RoomId;
	}

	public void setRoomId(long roomId) {
		RoomId = roomId;
	}

	public long getUserId() {
		return UserId;
	}

	public void setUserId(long userId) {
		UserId = userId;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getChat() {
		return chat;
	}

	public void setChat(String chat) {
		this.chat = chat;
	}

}
