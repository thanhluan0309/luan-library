package stackjava.com.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import stackjava.com.Entity.user;

@Service
public interface InterfaceLogin {
	public List<user> getDataUser();
}
