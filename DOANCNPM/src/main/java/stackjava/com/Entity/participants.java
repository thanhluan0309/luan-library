package stackjava.com.Entity;

public class participants {
	private long RoomId;
	private long UserId;
	private long UserId_part;
	private long id;

	public participants() {
	}

	public participants(long roomId, long userId,long userId_part,long id) {
		super();
		RoomId = roomId;
		UserId_part = userId_part;
		UserId = userId;
		this.id = id;

	}

	public long getUserId_part() {
		return UserId_part;
	}

	public void setUserId_part(long userId_part) {
		UserId_part = userId_part;
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

}
