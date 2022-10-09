package stackjava.com.DAO;

import javax.security.auth.spi.LoginModule;

import org.springframework.beans.factory.annotation.Autowired;

import stackjava.com.Entity.user;
import stackjava.com.Service.loginDAOimpl;

public interface loginDAO extends LoginModule {	
	boolean validateUser(String username , String password);
	boolean userRegistration(String username , String password);
	
    user findByUsername(String name);
	
	
}
