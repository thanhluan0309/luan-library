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

//	public static void main(String[] args) throws SQLException {
//		userdao u = new userdao();
//		for(user us : u.getDataUser()) {
//			System.out.print("list"+us.getUsername());
//		}
//		
//	}
}
