package stackjava.com.Entity;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class participantsMapper implements RowMapper<participants> {
	public participants mapRow(ResultSet rs, int rowNum) throws SQLException {
		participants u = new participants();
		u.setRoomId(rs.getLong("RoomId"));
		u.setUserId(rs.getLong("UserId"));
		u.setUserId_part(rs.getLong("UserId_part"));
		u.setId(rs.getLong("id"));
		return u;
	}
	
	
}
