package stackjava.com.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class roomMapper implements RowMapper<room> {

	public room mapRow(ResultSet rs, int rowNum) throws SQLException {
		room u = new room();
		u.setId(rs.getLong("id"));
		u.setName(rs.getString("name"));
		return u;
	}

}
