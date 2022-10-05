package stackjava.com.Service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stackjava.com.DAO.messagedao;
import stackjava.com.Entity.message;

@Service
public class messageImpl implements Interfacemessage {

	@Autowired
	private messagedao md;



	@Override
	public boolean upDateMessageBy_userId_RoomId(message m) {

		try {
			return md.upDateMessageBy_userId_RoomId(m);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public message createMessage(message m) {
		message mget =new message();
		try {
			return mget=md.createMessage(m);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mget;
	}

	@Override
	public message getmeMessageBy_userId_RoomId(long roomId) {
		try {
			return md.getmeMessageBy_userId_RoomId( roomId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
