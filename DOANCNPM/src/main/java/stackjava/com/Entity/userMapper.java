package stackjava.com.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class userMapper implements RowMapper<user> {

	public user mapRow(ResultSet rs, int rowNum) throws SQLException {
		user u = new user();
		u.setId(rs.getLong("id"));
		u.setUsername(rs.getString("username"));
		u.setPassword(rs.getString("password"));
		u.setImage(rs.getString("image"));
		return u;
	}

}
