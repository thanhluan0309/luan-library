package stackjava.com.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class messageMapper implements RowMapper<message> {

	
	public message mapRow(ResultSet rs, int rowNum) throws SQLException {
		message u = new message();
		u.setRoomId(rs.getLong("RoomId"));
		u.setUserId(rs.getLong("UserId"));
		u.setId(rs.getLong("id"));
		u.setChat(rs.getString("chat"));
		return u;
	}

}
