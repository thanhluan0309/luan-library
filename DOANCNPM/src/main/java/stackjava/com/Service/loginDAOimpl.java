package stackjava.com.Service;

import java.util.Map;

import javax.security.auth.Subject;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.login.LoginException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import stackjava.com.DAO.loginDAO;
import stackjava.com.Entity.user;
import stackjava.com.Entity.userMapper;
@Repository
public class loginDAOimpl implements loginDAO{

	@Autowired
	JdbcTemplate jdbcTemplate;
	@Override
	public void initialize(Subject subject, CallbackHandler callbackHandler, Map<String, ?> sharedState,
			Map<String, ?> options) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean login() throws LoginException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean commit() throws LoginException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean abort() throws LoginException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean logout() throws LoginException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean validateUser(String username, String password) {
	  try {
		int count = jdbcTemplate.queryForObject("select count(*) from user where username = ? and password =? ",Integer.class, username, password);
		if(count != 0) {
			return true;
		}
		else return false;
	} catch (Exception e) {
		e.printStackTrace();
	}
		return false;
	}

	@Override
	public boolean userRegistration(String username, String password) {
		try {
			int user = jdbcTemplate.update("insert into user (username,password)values ('"+username+"','"+password+"')");
		if(user != 0) {
			return true;
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public user findByUsername(String username) {
		String sql ="select * from user where username = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[]{username}, new userMapper());	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}



}
