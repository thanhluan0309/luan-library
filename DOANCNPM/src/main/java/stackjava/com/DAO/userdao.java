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
import stackjava.com.Entity.user;
import stackjava.com.Entity.userMapper;

@Repository
public class userdao {

	@Autowired
	private JdbcTemplate _jdbcTemplate;
	
	
	public List<user> getDataUser() throws SQLException {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		DataSource dataSource = (DataSource) context.getBean("dataSource");
		_jdbcTemplate = new JdbcTemplate(dataSource);
		List<user> list = new ArrayList<user>();
		String sql = "SELECT * FROM user";
		list = _jdbcTemplate.query(sql, new userMapper());
		return list;
	}
	
	public user upDateUser_ById(user u) throws SQLException {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		DataSource dataSource = (DataSource) context.getBean("dataSource");
		_jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "UPDATE user SET image = ? , password =? , username = ? WHERE id = ? ";
		try {
			_jdbcTemplate.update(sql,u.getImage(),u.getPassword(),u.getUsername(),u.getId());
			return u;
		} catch (Exception e) {
			return u;
		}
		
	}
	public user getUserBy_userId(long userid) throws SQLException {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		DataSource dataSource = (DataSource) context.getBean("dataSource");
		_jdbcTemplate = new JdbcTemplate(dataSource);
		user m;
		String sql = "SELECT * FROM user where id=?";
		try {
			m = _jdbcTemplate.queryForObject(sql, new userMapper(), userid);
		} catch (Exception e) {
			m= new user();
		}
		return m;
	}

	public static void main(String[] args) throws SQLException {
		userdao u = new userdao();
		user u1 = new user(1,"luan1","1","asd");
//		for(user us : u.getDataUser()) {
//			System.out.print("list"+us.getId()+us.getImage());
//		}
//		user temp = u.upDateUser_ById(u1);
//		System.out.print("list"+temp.getImage());
//		user u2 =u.getUserBy_userId(2);
//		System.out.print("list"+u2.getUsername());
	}
}
