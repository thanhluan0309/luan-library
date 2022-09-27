package stackjava.com.Service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stackjava.com.DAO.userdao;
import stackjava.com.Entity.user;
@Service
public class LoginImpl implements InterfaceLogin {
	@Autowired
	private userdao userd;

	@Override
	public List<user> getDataUser() {
		try {
			return userd.getDataUser();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
