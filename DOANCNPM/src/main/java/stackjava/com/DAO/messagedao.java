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

import stackjava.com.Entity.message;
import stackjava.com.Entity.messageMapper;
import stackjava.com.Entity.participants;
import stackjava.com.Entity.participantsMapper;
import stackjava.com.Entity.room;
import stackjava.com.Entity.roomMapper;
import stackjava.com.Entity.user;
import stackjava.com.Entity.userMapper;

@Repository
public class messagedao {

	@Autowired
	private JdbcTemplate _jdbcTemplate;

	public message getmeMessageBy_userId_RoomId(long userId, long roomId) throws SQLException {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		DataSource dataSource = (DataSource) context.getBean("dataSource");
		_jdbcTemplate = new JdbcTemplate(dataSource);
		message m;
		String sql = "SELECT * FROM message where UserID=? and RoomID=?";
		try {
			m = (message) _jdbcTemplate.queryForObject(sql, new messageMapper(), userId, roomId);
		} catch (Exception e) {
			m= new message();
		}
		return m;
	}
	public boolean upDateMessageBy_userId_RoomId(message m) throws SQLException {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		DataSource dataSource = (DataSource) context.getBean("dataSource");
		_jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "UPDATE message SET chat = ? WHERE id = ? ";
		try {
			_jdbcTemplate.update(sql,m.getChat(),m.getId());
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}
	
	public message createMessage(message m) throws SQLException {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		DataSource dataSource = (DataSource) context.getBean("dataSource");
		_jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "INSERT INTO message (RoomID,UserID,id,chat) VALUES (?, ? ,? ,?)";
		_jdbcTemplate.update(sql,m.getRoomId(),m.getUserId(),m.getId(),m.getChat());
		
		message mget = new message();
		String sqlgetLast = "SELECT * FROM message ORDER BY id DESC LIMIT 1";
		mget = _jdbcTemplate.queryForObject(sqlgetLast,new messageMapper());
		return mget;
		
	}
	

	public static void main(String[] args) throws SQLException {
		messagedao u = new messagedao();
//		message m = u.getmeMessageBy_userId_RoomId(1, 1);
//		System.out.print("message"+m.getChat());
		
		//update
//		message m = new message();
//		m.setId(1);
//		m.setChat("baby shark");
//		
//		u.upDateMessageBy_userId_RoomId(m);
		//create
		message m = new message();
		m.setChat("alo");
		message mget = u.createMessage(m);
		System.out.print("message"+mget.getId());
	}
}
