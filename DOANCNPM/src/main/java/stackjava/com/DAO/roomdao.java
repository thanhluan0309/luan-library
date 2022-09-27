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

import com.mysql.jdbc.PreparedStatement;

import stackjava.com.Entity.room;
import stackjava.com.Entity.roomMapper;
import stackjava.com.Entity.user;
import stackjava.com.Entity.userMapper;

@Repository
public class roomdao {

	@Autowired
	private JdbcTemplate _jdbcTemplate;
	
	
	public room getOneRoomByid(long id) throws SQLException {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		DataSource dataSource = (DataSource) context.getBean("dataSource");
		_jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT * FROM room Where id="+id;
		room r = _jdbcTemplate.queryForObject(sql, new roomMapper());
		return r;
	}
	
	public room createRoom(room r) throws SQLException {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		DataSource dataSource = (DataSource) context.getBean("dataSource");
		_jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "INSERT INTO room (id, name) VALUES (?, ?)";
		_jdbcTemplate.update(sql,r.getId(),r.getName());
		
		room rget = new room();
		String sqlgetLast = "SELECT * FROM room ORDER BY id DESC LIMIT 1";
		rget = _jdbcTemplate.queryForObject(sqlgetLast,new roomMapper());
		return rget;
		
	}

//	public static void main(String[] args) throws SQLException {
//		roomdao u = new roomdao();
////		for(room us : u.getOneRoomByid(1)) {
////			System.out.print("list"+us.getName());
////		}
////		
////		r = u.getOneRoomByid(1);
////		
//		room r = new room();
//		room get = new room();
//		r.setName("roomtest");
//		get = u.createRoom(r);
//		System.out.print("create success"+get.getId());
//		
//	}
}
