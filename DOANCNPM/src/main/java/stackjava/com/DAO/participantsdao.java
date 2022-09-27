package stackjava.com.DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import stackjava.com.Entity.participants;
import stackjava.com.Entity.participantsMapper;
import stackjava.com.Entity.room;
import stackjava.com.Entity.roomMapper;
import stackjava.com.Entity.user;
import stackjava.com.Entity.userMapper;

@Repository
public class participantsdao {

	@Autowired
	private JdbcTemplate _jdbcTemplate;

	public boolean checKPariticipants_BY_userID_userIdpart(long userId, long userIdPart) throws SQLException {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		DataSource dataSource = (DataSource) context.getBean("dataSource");
		_jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT * FROM participants where UserID=? and UserId_part=?";
		try {
			participants p = (participants) _jdbcTemplate.queryForObject(sql, new participantsMapper(), userId,
					userIdPart);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public participants createParticipantsBy_RoomId_UserId_userParts(participants p) throws SQLException {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		DataSource dataSource = (DataSource) context.getBean("dataSource");
		_jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "INSERT INTO participants (RoomID,UserID,id,UserId_part) VALUES (?, ? ,? ,?)";
		_jdbcTemplate.update(sql, p.getRoomId(), p.getUserId(), p.getId(), p.getUserId_part());

		participants pget = new participants();
		String sqlgetLast = "SELECT * FROM participants ORDER BY id DESC LIMIT 1";
		pget = _jdbcTemplate.queryForObject(sqlgetLast, new participantsMapper());
		return pget;

	}

//	public static void main(String[] args) throws SQLException {
//		participantsdao u = new participantsdao();
////		boolean p = u.checKPariticipants_BY_userID_userIdpart(1, 1);
////		
////		System.out.print("value"+p);
//		participants p = new participants();
//		participants pget  = u.createParticipantsBy_RoomId_UserId_userParts(p);
//		System.out.print("value" + pget.getId());
//	}
}
